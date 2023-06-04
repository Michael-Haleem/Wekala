namespace Wekala.Apis.Dtos
{
    public class OrderDto
    {
        public string CartId { get; set; }
        public int DeliveryMethodId { get; set; }
        public string ShipTo_Name { get; set; }
        public string ShipTo_Street { get; set; }
        public string ShipTo_City { get; set; }
        public string ShipTo_Country { get; set; }

    }
}
