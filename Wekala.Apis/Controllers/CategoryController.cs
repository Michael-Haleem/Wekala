using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Repositories;
using Wekala.BLL.Specification;
using Wekala.BLL.Specification.CategorySpecification;
using Wekala.BLL.Specification.ProductSpecification;
using Wekala.DAL.Contexts;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {


        


        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;


        public CategoryController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<CategoryWithALLInformationDto>> GetCategory(int id)
        {
            var Specification = new CategoryWithAllProductsSpecification(id);
            var CategoryWithSpecification = await unitOfWork.Repository<Category>().GetById(Specification);
            var MapperResult = mapper.Map<Category, CategoryWithALLInformationDto>(CategoryWithSpecification);
            return Ok(MapperResult);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<CategoryDto>>> GetAllCategory()
        {
            var Specification = new CategoryWithAllProductsSpecification();
            var CategoryWithSpecification = await unitOfWork.Repository<Category>().GetAll(Specification);
            var MapperResult = mapper.Map<IEnumerable<Category>,IEnumerable<CategoryDto>>(CategoryWithSpecification);
            return Ok(MapperResult);


        }

        [HttpPost]
       // [Authorize(Roles ="admin")]
        public async Task<ActionResult<CategoryDto>> AddCategory(CategoryDto categoryDto)
        {
            var MappedResult = mapper.Map<CategoryDto, Category>(categoryDto);
            await unitOfWork.Repository<Category>().Add(MappedResult);
            await unitOfWork.Complete();
            

            return Ok(categoryDto);
        }

        [HttpPut("{id}")]
        //[Authorize(Roles = "admin")]
        public async Task<IActionResult> UpdateCategory(int id, CategoryDto categoryDto)
        {
            if (id != categoryDto.Id)
            {
                return BadRequest();
            }
            else
            {

                var MappedResult = mapper.Map<CategoryDto, Category>(categoryDto);
                unitOfWork.Repository<Category>().Update(MappedResult);

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
       // [Authorize(Roles = "admin")]
        public async Task<ActionResult<Category>> DeleteCategory(int id)
        {
            var category = await unitOfWork.Repository<Category>().GetById(id);
            if (category == null)
            {
                return NotFound();
            }

            unitOfWork.Repository<Category>().Remove(category);
            await unitOfWork.Complete();

            return Ok();
        }


    }
}
