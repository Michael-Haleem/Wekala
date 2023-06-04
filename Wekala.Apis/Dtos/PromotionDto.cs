using System.ComponentModel.DataAnnotations.Schema;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Dtos
{
    public class PromotionDto
    {
        public decimal NewPrice { get; set; }
        public string PromotionalText { get; set; }

        
        public int Product_Id { get; set; }
        
    }
}
