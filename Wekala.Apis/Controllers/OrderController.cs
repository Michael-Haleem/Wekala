using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Security.Claims;
using Wekala.Apis.Dtos;
using Wekala.BLL.Interfaces;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class OrderController : ControllerBase
    {
        private readonly IOrderService orderService;
        private readonly IMapper mapper;

        public OrderController(IOrderService orderService, IMapper mapper)
        {
            this.orderService = orderService;
            this.mapper = mapper;
        }

        [HttpPost]
        public async Task<ActionResult<OrderToReturnDto>> CreateOrder(OrderDto orderDto)
        {
            var buyerEmail = User.FindFirstValue(ClaimTypes.Email);
            var order = await orderService.CreateOrder(buyerEmail, orderDto.CartId, orderDto.DeliveryMethodId, orderDto.ShipTo_Name,orderDto.ShipTo_Street, orderDto.ShipTo_City, orderDto.ShipTo_Country);
            if (order == null) return BadRequest(error:"An Error Occured During Creating");
            var MappedResult = mapper.Map<Order, OrderToReturnDto>(order);
            return Ok(MappedResult);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<OrderToReturnDto>>> GetOrdersForUser()
        {
            var buyerEmail = User.FindFirstValue(ClaimTypes.Email);
            var orders = await orderService.GetOrdersForUser(buyerEmail);
            var MapperResult = mapper.Map<IEnumerable<Order>, IEnumerable<OrderToReturnDto>>(orders);
            return Ok(MapperResult);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<OrderToReturnDto>> GetOrderForUser(int id)
        {
            var buyerEmail = User.FindFirstValue(ClaimTypes.Email);
            var order = await orderService.GetOrderByIdForUser(id, buyerEmail);
            var MapperResult = mapper.Map<Order, OrderToReturnDto>(order);
            return Ok(MapperResult);
        }

        [HttpGet("deliveryMethod")]
        public async Task<ActionResult<IEnumerable<DeliveryMethod>>> GetDeliveryMethods()
        {
            return Ok(await orderService.GetDeliveryMethods());
        }
    }
}
