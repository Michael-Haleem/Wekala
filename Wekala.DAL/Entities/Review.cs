using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class Review
    {
        public int Rev_Id { get; set; }
        [ForeignKey("Product")]
        public int Pro_Id { get; set; }
        public string Pro_Review { get; set; }
        public Product Product { get; set; }
    }
}
