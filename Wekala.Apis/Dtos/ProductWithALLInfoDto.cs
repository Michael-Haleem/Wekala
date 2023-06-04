using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Dtos
{
    public class ProductWithALLInfoDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public int Brand_Id { get; set; }
        public string BrandName { get; set; }
        public int Category_Id { get; set; }
        public string CategoryName { get; set; }
        public int Store_Id { get; set; }
        public string StoreName { get; set; }
        public decimal? NewPrice { get; set; }
        public string? PromotionalText { get; set; }
        public List<ReviewDto>? Reviews { get; set; } 
       
    }
}
