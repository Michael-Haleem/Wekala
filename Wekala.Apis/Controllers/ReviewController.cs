using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.DAL.Contexts;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewController : ControllerBase

    {

        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
        public ReviewController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
            
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<IEnumerable<ReviewDto>>> GetProductReviews(int id)
        {


            var AllReviews = await unitOfWork.Repository<Review>().GetAll();
            var ProductReviews = AllReviews.Where(P => P.Pro_Id == id);
            if (ProductReviews == null) return NotFound();
            var MappedReview = mapper.Map<IEnumerable<Review>, IEnumerable<ReviewDto>>(ProductReviews);
            return Ok(MappedReview);
        }


        [HttpPost]
        [Authorize(Roles = "User")]

        public async Task<ActionResult<ReviewDto>> AddProductReview(ReviewDto reviewDto)
        {
            var MappedResult = mapper.Map<ReviewDto, Review>(reviewDto);
            await unitOfWork.Repository<Review>().Add(MappedResult);
            await unitOfWork.Complete();
            return Ok(reviewDto);
        }


        //[HttpDelete]
        //[Authorize(Roles = "User")]

        //public async Task<ActionResult<ReviewDto>> DeleteProductReview(ReviewDto reviewDto)
        //{

        //    var reviews = await unitOfWork.Repository<Review>().GetAll();
        //    var review = reviews.FirstOrDefault(p => p.Pro_Id == reviewDto.Pro_Id && p.Pro_Review == reviewDto.Pro_Review);

        //    if (review == null)
        //    {
        //        return NotFound();

        //    }
        //    unitOfWork.Repository<Review>().Remove(review);
        //    await unitOfWork.Complete();
        //    return Ok();
        //}


        [HttpDelete]
        public async Task<ActionResult<Product>> DeleteProductReview(ReviewReturnDto reviewDto)
        {
            var MappedResult = mapper.Map<ReviewReturnDto, Review>(reviewDto);
            unitOfWork.Repository<Review>().Remove(MappedResult);
            await unitOfWork.Complete();
            return Ok();
        }



    }
}
