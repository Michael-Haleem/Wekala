using AutoMapper;
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
    public class DeliveryMethodController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
        public DeliveryMethodController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
        }


        [HttpGet]
        
        public async Task<ActionResult<IEnumerable<DeliveryMethodDto>>> GetAllDeliveryMethod()
        {
           
            var deliveryMethods = await unitOfWork.Repository<DeliveryMethod>().GetAll();
            var MapperResult = mapper.Map<IEnumerable<DeliveryMethod>, IEnumerable<DeliveryMethodDto>>(deliveryMethods);
            return Ok(MapperResult);
        }

        [HttpPost]
        public async Task<ActionResult<DeliveryMethodDto>> AddDeliveryMethod(DeliveryMethodCreatDto deliveryMethod)
        {
            var MappedResult = mapper.Map<DeliveryMethodCreatDto, DeliveryMethod>(deliveryMethod);
            await unitOfWork.Repository<DeliveryMethod>().Add(MappedResult);
            await unitOfWork.Complete();
            return Ok(deliveryMethod);
        }

        [HttpDelete]
        public async Task<ActionResult> DeleteProductReview(DeliveryMethodDto deliveryMethod)
        {
            var MappedResult = mapper.Map<DeliveryMethodDto, DeliveryMethod>(deliveryMethod);
            unitOfWork.Repository<DeliveryMethod>().Remove(MappedResult);
            await unitOfWork.Complete();
            return Ok();
        }
    }
}
