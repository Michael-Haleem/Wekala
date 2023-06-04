using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.BLL.Interfaces;
using Wekala.BLL.Specification.OrderSpecification;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Services
{
    public class OrderService : IOrderService
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly ICartRepository cartRepository;
        private readonly IPaymentService paymentService;

        public OrderService(IUnitOfWork unitOfWork, ICartRepository cartRepository, IPaymentService paymentService)
        {
            this.unitOfWork = unitOfWork;
            this.cartRepository = cartRepository;
            this.paymentService = paymentService;
        }
            
        public async Task<Order> CreateOrder(string buyerEmail, string cartId, int deliveryMethodId ,string ShipTo_Name ,string ShipTo_Street,string ShipTo_City,string ShipTo_Country)
        {
            // 1. Get Cart From Cart Repository
            var cart = await cartRepository.GetCart(cartId);
            // 2. Get Selected Item at Cart From Products Repo
            var orderItems = new List<OrderItem>();

            foreach (var item in cart.Items)
            {
                var Product = await unitOfWork.Repository<Product>().GetById(item.Product_Id);
                var AllImages = await unitOfWork.Repository<Image>().GetAll();
                var ProductImage = AllImages.Where(P => P.Pro_Id == Product.Id).FirstOrDefault();
                var OrderItem = new OrderItem() { Product_Id = Product.Id, Product_Name = Product.Name, Product_Price = Product.Price, Product_Quantity = Product.Quantity, Product_Image = ProductImage.Pro_Img };
                orderItems.Add(OrderItem);
            }

            //3. Get delivery Method From DeliveryMethod Repository
            var deliveryMethod = await unitOfWork.Repository<DeliveryMethod>().GetById(deliveryMethodId);
            //4. Calculate subtotal
            var subtotal = orderItems.Sum(item => item.Product_Price * item.Product_Quantity);
            // Check If Order Exists
            var spec = new OrderWithItemByPaymentIntentSpecifications(cart.PaymentIntentId);
            var existingOrder = await unitOfWork.Repository<Order>().GetById(spec);
            if (existingOrder != null)
            {
                unitOfWork.Repository<Order>().Remove(existingOrder);
                await paymentService.CreateOrUpdatePaymentIntent(cartId);
            }
            //5. Create Order
            var order = new Order() { Email = buyerEmail , ShipTo_Name = ShipTo_Name, ShipTo_Street = ShipTo_Street, ShipTo_City = ShipTo_City , ShipTo_Country = ShipTo_Country, OrderItems = orderItems,SubTotal = subtotal, PaymentType= "Visa", DeliveryMethod = deliveryMethod, PaymentIntentId = cart.PaymentIntentId};
            await unitOfWork.Repository<Order>().Add(order);
            //6. Save To Database
            int result = await unitOfWork.Complete();
            if (result <= 0) return null;

            return order;
        }

        public async Task<IEnumerable<DeliveryMethod>> GetDeliveryMethods()
        {
            return await unitOfWork.Repository<DeliveryMethod>().GetAll();
        }

        public async Task<Order> GetOrderByIdForUser(int orderId, string buyerEmail)
        {
            var spec = new OrderWithItemsAndDeliveryMethodSpecifications(orderId, buyerEmail);

            var order = await unitOfWork.Repository<Order>().GetById(spec);

            return order;
        }

        public async Task<IEnumerable<Order>> GetOrdersForUser(string buyerEmail)
        {
            var spec = new OrderWithItemsAndDeliveryMethodSpecifications(buyerEmail);
            var orders = await unitOfWork.Repository<Order>().GetAll(spec);

            return orders;
        }
    }
}
