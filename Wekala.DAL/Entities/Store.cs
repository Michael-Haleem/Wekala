using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class Store : BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string Country { get; set; }

        [ForeignKey("ApplicationUser")]
        public string Supplier_Id { get; set; }
        public ApplicationUser ApplicationUser { get; set; }

        public ICollection<Product> Products { get; set; } = new HashSet<Product>();
    }
}
