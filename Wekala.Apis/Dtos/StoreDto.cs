using System.ComponentModel.DataAnnotations.Schema;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Dtos
{
    public class StoreDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Supplier_Id { get; set; }
        public List<ProductDto>? Products { get; set; }
    }
}
