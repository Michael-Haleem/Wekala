using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.OrderSpecification
{
    public class OrderWithItemByPaymentIntentSpecifications : BaseSpecification<Order>
    {
        public OrderWithItemByPaymentIntentSpecifications(string paymentIntentId)
                        : base(Order => Order.PaymentIntentId == paymentIntentId)
        {

        }
    }
}
