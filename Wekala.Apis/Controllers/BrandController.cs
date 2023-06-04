using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Specification.BrandSpecification;
using Wekala.BLL.Specification.CategorySpecification;
using Wekala.DAL.Contexts;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrandController : ControllerBase
    {
        
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
        public BrandController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
         
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<BrandWithALLInformationDto>>GetBrand(int id)
        {
            var Specification = new BrandWithAllProductsSpecification(id);
            var BrandWithSpecification = await unitOfWork.Repository<Brand>().GetById(Specification);
            var MapperResult = mapper.Map<Brand, BrandWithALLInformationDto>(BrandWithSpecification);
           return Ok(MapperResult);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BrandDto>>> GetAllBrand()
        {
            var Specification = new BrandWithAllProductsSpecification();
            var BrandWithSpecification = await unitOfWork.Repository<Brand>().GetAll(Specification);
            var MapperResult = mapper.Map<IEnumerable<Brand>, IEnumerable<BrandDto>>(BrandWithSpecification);
            return Ok(MapperResult);


        }

        [HttpPost]
        //[Authorize(Roles = "admin")]
        public async Task<ActionResult<BrandDto>> AddBrand(BrandDto brandDto)
        {
            var MappedResult = mapper.Map<BrandDto, Brand>(brandDto);
            await unitOfWork.Repository<Brand>().Add(MappedResult);
            await unitOfWork.Complete();


            return Ok(brandDto);

        }

        [HttpPut("{id}")]
        //[Authorize(Roles = "admin")]
        public async Task<IActionResult> UpdateBrand(int id, BrandDto brandDto)
        {
            if (id != brandDto.Id)
            {
                return BadRequest();
            }
            else
            {

                var MappedResult = mapper.Map<BrandDto, Brand>(brandDto);
                unitOfWork.Repository<Brand>().Update(MappedResult);

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
        }





        [HttpDelete("{id}")]
        //[Authorize(Roles = "admin")]
        public async Task<ActionResult<Brand>> DeleteBrand(int id)
        {
            var brand = await unitOfWork.Repository<Brand>().GetById(id);
            if (brand == null)
            {
                return NotFound();
            }

            unitOfWork.Repository<Brand>().Remove(brand);
            await unitOfWork.Complete();

            return Ok();
        }


    }
}
