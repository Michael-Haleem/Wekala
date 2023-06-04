using System.Net;

namespace Wekala.Apis.Dtos
{
    public class OrderToReturnDto
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string ShipTo_Name { get; set; }
        public string ShipTo_Street { get; set; }
        public string ShipTo_City { get; set; }
        public string ShipTo_Country { get; set; }
        public DateTimeOffset OrderDate { get; set; }
        public string Status { get; set; }
        public decimal SubTotal { get; set; }
        public string PaymentType { get; set; }
        public string DeliveryMethod { get; set; }
        public List<OrderItemDto> OrderItems { get; set; }
        public decimal Total { get; set; }
    }
}
