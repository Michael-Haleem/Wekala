using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Specification.ProductSpecification;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper mapper;

        public WeatherForecastController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            this.mapper = mapper;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts()
        {
            var products = await _unitOfWork.Repository<Product>().GetAll();
            return Ok(products);
        }

        [HttpGet("kkkk")]
        public async Task<ActionResult<IEnumerable<ProductWithALLInfoDto>>> GetProductsWithSpecification()
        {
            var Specification = new ProductWithReviewsAndBrandAndCategoryAndStoreAndPromotionSpecification();
            var ProductsWithSpecification = await _unitOfWork.Repository<Product>().GetAll(Specification);
            var MapperResult = mapper.Map<IEnumerable<Product>, IEnumerable<ProductWithALLInfoDto>>(ProductsWithSpecification);
            return Ok(MapperResult);
        }

    }
}