using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class Order : BaseEntity
    {
        public string Email { get; set; }
        public string ShipTo_Name { get; set; }
        public string ShipTo_Street { get; set; }
        public string ShipTo_City { get; set; }
        public string ShipTo_Country { get; set; }
        public OrderStatus Status { get; set; } = OrderStatus.Pending;
        public decimal SubTotal { get; set; }
        public string PaymentType { get; set; }
        public DateTimeOffset OrderDate { get; set; } = DateTimeOffset.Now;

        [ForeignKey("ApplicationUser")]
        public string User_Id { get; set; }

        [ForeignKey("DeliveryMethod")]
        public int DeliveryMethod_Id { get; set; }
        public string PaymentIntentId { get; set; }
        public ApplicationUser ApplicationUser { get; set; }
        public ICollection<OrderItem> OrderItems { get; set; } = new HashSet<OrderItem>();
        public DeliveryMethod DeliveryMethod { get; set; }

        public decimal GetTotal()
            => SubTotal + DeliveryMethod.Cost;

        public Order()
        {

        }
    }
}
