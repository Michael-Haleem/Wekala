using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class OrderItem : BaseEntity
    {
        public int Product_Id { get; set; }
        public string Product_Name { get; set; }
        public decimal Product_Price { get; set; }
        public int Product_Quantity { get; set; }
        public string Product_Image { get; set; }

        [ForeignKey("Order")]
        public int Order_Id { get; set; }
        public Order Order { get; set; }
    }
}
