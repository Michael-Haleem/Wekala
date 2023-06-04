using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class Brand : BaseEntity
    {
        [Required , MaxLength(50)]
        public string Name { get; set; }
        public string Description { get; set; }
        public ICollection<Product> Products { get; set; } = new HashSet<Product>();
    }
}
