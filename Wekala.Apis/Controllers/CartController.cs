using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wekala.BLL.Interfaces;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private readonly ICartRepository cartRepository;

        public CartController(ICartRepository cartRepository)
        {
            this.cartRepository = cartRepository;
        }

        [HttpGet]
        public async Task<ActionResult<Cart>> GetBasket(string cartId)
        {
            var basket = await cartRepository.GetCart(cartId);
            return Ok(basket ?? new Cart(cartId));
        }

        [HttpPost]
        public async Task<ActionResult<Cart>> UpdateBasket(Cart cart)
        {
            await cartRepository.UpdateCart(cart);
            return Ok(cart);
        }

        [HttpDelete]
        public async Task<ActionResult<bool>> DeleteBasket(string cartId)
        {
            return await cartRepository.DeleteCart(cartId);
        }
    }
}
