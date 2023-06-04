using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Interfaces
{
    public interface IOrderService
    {
        Task<Order> CreateOrder(string buyerEmail, string cartId, int deliveryMethodId, string ShipTo_Name, string ShipTo_Street, string ShipTo_City, string ShipTo_Country);

        Task<IEnumerable<Order>> GetOrdersForUser(string buyerEmail);

        Task<Order> GetOrderByIdForUser(int orderId, string buyerEmail);

        Task<IEnumerable<DeliveryMethod>> GetDeliveryMethods();
    }
}
