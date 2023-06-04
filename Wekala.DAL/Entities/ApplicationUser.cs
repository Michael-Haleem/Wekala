using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wekala.DAL.Entities
{
    public class ApplicationUser : IdentityUser
    {
        [Required , MinLength(3) , MaxLength(20)]
        public string FirstName { get; set; }
        [Required , MinLength(3) , MaxLength(20)]
        public string LastName { get; set; }
        [Required]
        public string Street { get; set; }
        [Required]

        public string City { get; set; }
        [Required]
        public string Country { get; set; }
        [Required]
        public string UserType { get; set; }

        public ICollection<Order> Orders { get; set; } = new HashSet<Order>();
        public ICollection<Store> Stores { get; set; } = new HashSet<Store>();
    }
}
