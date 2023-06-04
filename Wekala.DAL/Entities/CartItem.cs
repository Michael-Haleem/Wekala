using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class CartItem
    {
        public int Product_Id { get; set; }
        public string Product_Name { get; set; }
        public decimal Product_Price { get; set; }
        public int Product_Quantity { get; set; }
        public string Product_Image { get; set; }
    }
}
