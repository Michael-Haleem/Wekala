using System.ComponentModel.DataAnnotations;

namespace Wekala.Apis.Dtos
{
    public class DeliveryMethodCreatDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime DeliveryTime { get; set; }
        public decimal Cost { get; set; }
    }
}
