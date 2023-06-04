using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.OrderSpecification
{
    internal class OrderWithItemsAndDeliveryMethodSpecifications : BaseSpecification<Order>
    {
        public OrderWithItemsAndDeliveryMethodSpecifications(string buyerEmail) : base(O => O.Email == buyerEmail)
        {
            AddInclude(O => O.OrderItems);
            AddInclude(O => O.DeliveryMethod);

        }

        public OrderWithItemsAndDeliveryMethodSpecifications(int orderId, string buyerEmail) :
                                                         base(O => (O.Email == buyerEmail && O.Id == orderId))
        {
            AddInclude(O => O.OrderItems);
            AddInclude(O => O.DeliveryMethod);
        }
    }
}
