using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wekala.Apis.Dtos;
using Wekala.Apis.Helpers;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Repositories;
using Wekala.BLL.Specification.OrderSpecification;
using Wekala.BLL.Specification.ProductSpecification;
using Wekala.DAL.Contexts;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;

        public ProductController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ProductWithALLInfoDto>> GetProduct(int id)
        {
            var Specification = new ProductWithReviewsAndBrandAndCategoryAndStoreAndPromotionSpecification(id);
            var ProductWithSpecification = await unitOfWork.Repository<Product>().GetById(Specification);
            var MapperResult = mapper.Map<Product, ProductWithALLInfoDto>(ProductWithSpecification);
            return Ok(MapperResult);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductWithALLInfoDto>>> GetAllProducts()
        {
            var Specification = new ProductWithReviewsAndBrandAndCategoryAndStoreAndPromotionSpecification();
            var ProductsWithSpecification = await unitOfWork.Repository<Product>().GetAll(Specification);
            var MapperResult = mapper.Map<IEnumerable<Product>, IEnumerable<ProductWithALLInfoDto>>(ProductsWithSpecification);
            return Ok(MapperResult);
        }

        [HttpPost]
        public async Task<ActionResult<ProductDto>> AddProduct(ProductDto productDto)
        {
            var MappedResult = mapper.Map<ProductDto, Product>(productDto);
            await unitOfWork.Repository<Product>().Add(MappedResult);
            await unitOfWork.Complete();
            return Ok(productDto);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProduct(int id, ProductDto productDto)
        {
            if (id != productDto.Id)
            {
                return BadRequest();
            }

            var MappedResult = mapper.Map<ProductDto, Product>(productDto);
            unitOfWork.Repository<Product>().Update(MappedResult);

            try
            {
               await unitOfWork.Complete();
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }

            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Product>> DeleteProduct(int id)
        {
            var product = await unitOfWork.Repository<Product>().GetById(id);
            if (product == null)
            {
                return NotFound();
            }

            unitOfWork.Repository<Product>().Remove(product);
            await unitOfWork.Complete();

            return Ok();
        }

        //Latest
        [HttpGet("Latest")]
        public async Task<ActionResult<IEnumerable<ProductWithALLInfoDto>>> LatsetAddedProducts()
        {
            var Specification = new ProductOrderdDescSpecification();
            var Products = await unitOfWork.Repository<Product>().GetAll(Specification);
            var MapperResult = mapper.Map<IEnumerable<Product>, IEnumerable<ProductWithALLInfoDto>>(Products);
            var LatestProducts = MapperResult.Take(6);
            if (LatestProducts == null)
            {
                return NotFound();
            }

            return Ok(LatestProducts);
        }

        //Best Selling
        [HttpGet("BestSelling")]
        public async Task<ActionResult<IEnumerable<OrderItemDto>>> BestSellingProducts()
        {
            var Specification = new OrderItemsWithDescOrderSpecification();
            var OrederItems = await unitOfWork.Repository<OrderItem>().GetAll(Specification);
            var MapperResult = mapper.Map<IEnumerable<OrderItem>, IEnumerable<OrderItemDto>>(OrederItems);
            var BestSellingProducts = MapperResult.GroupBy(o=>o.Product_Id).Select(o=>o.FirstOrDefault()).Take(3);
            return Ok(BestSellingProducts);
        }

        [HttpGet("image/{id}")]
        public async Task<ActionResult<IEnumerable<ImageDto>>> GetProductImages(int id)
        {

            var AllImages = await unitOfWork.Repository<Image>().GetAll();
            var ProductImages = AllImages.Where(P => P.Pro_Id == id);
            if (ProductImages == null) return NotFound();
            var MappedImage = mapper.Map<IEnumerable<Image>, IEnumerable<ImageDto>>(ProductImages);
            return Ok(MappedImage);
        }

        [HttpPost("image")]
        public async Task<ActionResult> AddProductImage([FromForm] int proId, [FromForm] IFormFile img, [FromForm] string folderName = "products")
        {
            var imageName = DocumentSettings.UploadFile(img, folderName);
            var image = new Image() { Pro_Id = proId , Pro_Img = imageName};
            await unitOfWork.Repository<Image>().Add(image);
            await unitOfWork.Complete();
            return Ok();
        }
        
        [HttpDelete("image")]
        public async Task<ActionResult<Product>> DeleteProductImage(ImageDto imageDto)
        {
            var image = new Image()
            {
                Pro_Id = imageDto.Pro_Id,
                Pro_Img = imageDto.Pro_Img
            };
            unitOfWork.Repository<Image>().Remove(image);
            await unitOfWork.Complete();
            DocumentSettings.DeleteFile(imageDto.Pro_Img, imageDto.folderName);
            return Ok();
        }

    }
}
