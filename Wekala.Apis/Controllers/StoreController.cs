using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Specification.ProductSpecification;
using Wekala.BLL.Specification.StoreSpecification;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;

        public StoreController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ProductWithALLInfoDto>> GetStore(int id)
        {
            var Specification = new StoreWithSupplierAndProductsSpecification(id);
            var StoreWithSpecification = await unitOfWork.Repository<Store>().GetById(Specification);
            var MappedResult = mapper.Map<Store, StoreDto>(StoreWithSpecification);
            if (MappedResult == null) return NotFound();
            return Ok(MappedResult);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<StoreDto>>> GetAllStores()
        {
            var specification = new StoreWithSupplierAndProductsSpecification();
            var StoresWithSpecification = await unitOfWork.Repository<Store>().GetAll(specification);
            var MappedResult = mapper.Map<IEnumerable<Store>, IEnumerable<StoreDto>>(StoresWithSpecification);
            if (MappedResult == null) return NotFound();
            return Ok(MappedResult);
        }

        [HttpPost]
        public async Task<ActionResult<StoreDto>> AddStore(StoreDto storeDto)
        {
            var MappedResult = mapper.Map<StoreDto, Store>(storeDto);
            if (MappedResult == null) return NotFound();
            await unitOfWork.Repository<Store>().Add(MappedResult);
            await unitOfWork.Complete();
            return Ok(storeDto);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateStore(int id, StoreDto storeDto)
        {
            if (id != storeDto.Id)
            {
                return BadRequest();
            }

            var MappedResult = mapper.Map<StoreDto, Store>(storeDto);
            unitOfWork.Repository<Store>().Update(MappedResult);

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
        public async Task<ActionResult<Product>> DeleteStore(int id)
        {
            var store = await unitOfWork.Repository<Store>().GetById(id);
            if (store == null)
            {
                return NotFound();
            }

            unitOfWork.Repository<Store>().Remove(store);
            await unitOfWork.Complete();

            return Ok();
        }
    }
}
