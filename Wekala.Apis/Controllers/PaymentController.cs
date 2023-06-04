using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Stripe;
using Wekala.BLL.Interfaces;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentService paymentService;
        private readonly ILogger<PaymentController> logger;
        private const string whSecret = "whsec_2d5e2343e617d6d441cf5c2aa74a33f138c0f72a056286a46284d5677412254a";

        public PaymentController(IPaymentService paymentService, ILogger<PaymentController> logger)
        {
            this.paymentService = paymentService;
            this.logger = logger;
        }
        [Authorize]
        [HttpPost("{cartId}")]
        public async Task<ActionResult<Cart>> CreateOrUpdatePaymentIntent(string cartId)
        {
            var basket = await paymentService.CreateOrUpdatePaymentIntent(cartId);

            if (basket == null) return BadRequest(error:"Problem with your basket");

            return Ok(basket);
        }

        [HttpPost("webhook")]
        public async Task<ActionResult> StripeWebhook()
        {
            var json = await new StreamReader(HttpContext.Request.Body).ReadToEndAsync();
            try
            {
                var stripeEvent = EventUtility.ConstructEvent(json,
                    Request.Headers["Stripe-Signature"], whSecret);

                PaymentIntent intent;
                Order order;
                switch (stripeEvent.Type)
                {
                    case Events.PaymentIntentSucceeded:
                        logger.LogInformation("Payment Succeded");
                        intent = (PaymentIntent)stripeEvent.Data.Object;
                        order = await paymentService.UpdateOrderPaymentSucceded(intent.Id);
                        break;
                    case Events.PaymentIntentPaymentFailed:
                        intent = (PaymentIntent)stripeEvent.Data.Object;
                        order = await paymentService.UpdateOrderPaymentFailed(intent.Id);
                        logger.LogInformation("Payment Failed", order.Id);
                        logger.LogInformation("Payment Failed", intent.Id);
                        break;
                }
                return new EmptyResult();
            }
            catch (StripeException e)
            {
                return BadRequest(error:e.Message);
            }
        }
    }
}
