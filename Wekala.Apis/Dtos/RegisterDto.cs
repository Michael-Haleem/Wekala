using System.ComponentModel.DataAnnotations;

namespace Wekala.Apis.Dtos
{
    public class RegisterDto
    {
        [Required, MinLength(3), MaxLength(20)]
        public string FirstName { get; set; }
        [Required, MinLength(3), MaxLength(20)]
        public string LastName { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        [Required]
        public string Street { get; set; }
        [Required]

        public string City { get; set; }
        [Required]
        public string Country { get; set; }
        [Required]
        public string UserType { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
