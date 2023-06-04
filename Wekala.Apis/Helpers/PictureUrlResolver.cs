using AutoMapper;
using Wekala.Apis.Dtos;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Helpers
{
    public class PictureUrlResolver : IValueResolver<Image, ImageDto, string>
    {
        private readonly IConfiguration configuration;

        public PictureUrlResolver(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public string Resolve(Image source, ImageDto destination, string destMember, ResolutionContext context)
        {
            if (string.IsNullOrEmpty(destMember))
                return $"{configuration["ImgUrl"]}{source.Pro_Img}";
            return null;
        }
    }
}
