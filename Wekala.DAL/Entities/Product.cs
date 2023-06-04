using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class Product : BaseEntity
    {
        [Required]
        public string Name { get; set; }
        public string Description { get; set; }
        [Required]
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        [ForeignKey("Brand")]
        public int Brand_Id { get; set; }
        [ForeignKey("Category")]
        public int Category_Id { get; set; }

        [ForeignKey("Store")]
        public int Store_Id { get; set; }
        public ICollection<Review> Reviews { get; set; } = new HashSet<Review>();
        public Brand Brand { get; set; }
        public Category Category { get; set; }
        public Store Store { get; set; }
        public Promotion Promotion { get; set; }
    }
}
