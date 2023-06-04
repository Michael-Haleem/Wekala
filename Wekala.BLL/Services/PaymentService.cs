using Microsoft.Extensions.Configuration;
using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Specification.OrderSpecification;
using Wekala.DAL.Entities;
using Product = Wekala.DAL.Entities.Product;

namespace Wekala.BLL.Services
{
    public class PaymentService : IPaymentService
    {
        private readonly IConfiguration configuration;
        private readonly ICartRepository cartRepository;
        private readonly IUnitOfWork unitOfWork;

        public PaymentService(IConfiguration configuration,
                              ICartRepository cartRepository,
                              IUnitOfWork unitOfWork)
        {
            this.configuration = configuration;
            this.cartRepository = cartRepository;
            this.unitOfWork = unitOfWork;
        }
        public async Task<Cart> CreateOrUpdatePaymentIntent(string cartId)
        {
            StripeConfiguration.ApiKey = configuration["StripeSettings:Secretkey"];

            var cart = await cartRepository.GetCart(cartId);

            if (cart == null) return null;

            var shippingPrice = 0m;

            if (cart.DeliveryMethodId.HasValue)
            {
                var deliveryMethod = await unitOfWork.Repository<DeliveryMethod>().GetById(cart.DeliveryMethodId.Value);
                shippingPrice = deliveryMethod.Cost;
            }

            foreach (var item in cart.Items)
            {
                var product = await unitOfWork.Repository<Product>().GetById(item.Product_Id);
                if (item.Product_Price != product.Price)
                    item.Product_Price = product.Price;
            }

            var service = new PaymentIntentService();
            PaymentIntent intent;
            if (string.IsNullOrEmpty(cart.PaymentIntentId))
            {
                var options = new PaymentIntentCreateOptions()
                {
                    Amount = (long)cart.Items.Sum(i => i.Product_Quantity * (i.Product_Price * 100)) + (long)(shippingPrice * 100),
                    Currency = "usd",
                    PaymentMethodTypes = new List<string>() { "card" }
                };

                intent = await service.CreateAsync(options);

                cart.PaymentIntentId = intent.Id;
                cart.ClientSecret = intent.ClientSecret;

            }
            else
            {
                var options = new PaymentIntentUpdateOptions()
                {
                    Amount = (long)cart.Items.Sum(i => i.Product_Quantity * (i.Product_Quantity * 100)) + (long)(shippingPrice * 100),
                };

                await service.UpdateAsync(cart.PaymentIntentId, options);
            }
            cart.ShippingPrice = shippingPrice;

            await cartRepository.UpdateCart(cart);

            return cart;
        }

        public async Task<Order> UpdateOrderPaymentSucceded(string paymentIntentId)
        {
            var spec = new OrderWithItemByPaymentIntentSpecifications(paymentIntentId);

            var order = await unitOfWork.Repository<Order>().GetById(spec);

            if (order == null) return null;

            order.Status = OrderStatus.PaymentReceived;

            unitOfWork.Repository<Order>().Update(order);

            await unitOfWork.Complete();

            return order;
        }

        public async Task<Order> UpdateOrderPaymentFailed(string paymentIntentId)
        {
            var spec = new OrderWithItemByPaymentIntentSpecifications(paymentIntentId);

            var order = await unitOfWork.Repository<Order>().GetById(spec);

            if (order == null) return null;

            order.Status = OrderStatus.PaymentFailed;

            unitOfWork.Repository<Order>().Update(order);

            await unitOfWork.Complete();

            return order;
        }
    }
}
