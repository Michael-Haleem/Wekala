using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Specification.ProductSpecification;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PromotionController : ControllerBase
    {

        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
        public PromotionController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
        }


        [HttpPost]
        [Authorize(Roles = "Supplier")]

        public async Task<ActionResult<PromotionDto>> AddProductPromotion(PromotionDto reviewDto)
        {
            var MappedResult = mapper.Map<PromotionDto, Promotion>(reviewDto);
            await unitOfWork.Repository<Promotion>().Add(MappedResult);
            await unitOfWork.Complete();
            return Ok(MappedResult);
        }


        [HttpDelete]
        [Authorize(Roles = "Supplier")]
        public async Task<ActionResult<Promotion>> DeletePromotion(PromotionDto promotionDto)
        {
            var promotions = await unitOfWork.Repository<Promotion>().GetAll();
            var promotion= promotions.FirstOrDefault(P=>P.Product_Id==promotionDto.Product_Id);

            if (promotion == null)
            {
                return NotFound();
            }

            unitOfWork.Repository<Promotion>().Remove(promotion);
            await unitOfWork.Complete();

            return Ok();
        }

        [HttpGet]
        
        public async Task<ActionResult<IEnumerable<ProductWithALLInfoDto>>> GetAllProductsWithPromotion()
        {
            var Specification = new ProductWithReviewsAndBrandAndCategoryAndStoreAndPromotionSpecification();
            var ProductsWithSpecification = await unitOfWork.Repository<Product>().GetAll(Specification);
            var ProductsWithPromotion=ProductsWithSpecification.Where(p=>p.Promotion!=null).ToList<Product>();
            var MapperResult = mapper.Map<IEnumerable<Product>, IEnumerable<ProductWithALLInfoDto>>(ProductsWithPromotion);
            return Ok(MapperResult);
        }

    }
}
