using System.ComponentModel.DataAnnotations.Schema;

namespace Wekala.Apis.Dtos
{
    public class ImageDto
    {
        public string Pro_Img { get; set; }
        public int Pro_Id { get; set; }
        public string folderName { get; set; } = "products";
    }
}
