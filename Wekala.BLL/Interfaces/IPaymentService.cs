using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Interfaces
{
    public interface IPaymentService
    {
        Task<Cart> CreateOrUpdatePaymentIntent(string cartId);

        Task<Order> UpdateOrderPaymentSucceded(string paymentIntentId);

        Task<Order> UpdateOrderPaymentFailed(string paymentIntentId);
    }
}
