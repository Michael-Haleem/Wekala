using System.ComponentModel.DataAnnotations.Schema;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Dtos
{
    public class ReviewReturnDto
    {
        public int Rev_Id { get; set; }
  
        public int Pro_Id { get; set; }
        public string Pro_Review { get; set; }
    }
}
