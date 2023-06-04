namespace Wekala.Apis.Dtos
{
    public class CategoryWithALLInformationDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public List<ProductWithALLInfoDto> Products { get; set; }
    }
}
