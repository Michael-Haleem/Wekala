namespace Wekala.Apis.Dtos
{
    public class OrderItemDto
    {
        public int Product_Id { get; set; }
        public string Product_Name { get; set; }
        public decimal Product_Price { get; set; }
        public int Product_Quantity { get; set; }
        public string Product_Image { get; set; }
    }
}
