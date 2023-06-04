using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.OrderSpecification
{
    public class OrderItemsWithDescOrderSpecification : BaseSpecification<OrderItem>
    {
        public OrderItemsWithDescOrderSpecification()
        {
            ApplyOrderByDescending(O => O.Product_Quantity);
        }
    }
}
