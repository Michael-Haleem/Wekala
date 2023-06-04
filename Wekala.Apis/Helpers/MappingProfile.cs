using AutoMapper;
using Wekala.Apis.Dtos;
using Wekala.DAL.Entities;

namespace Wekala.Apis.Helpers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Product, ProductWithALLInfoDto>()
                    .ForMember(D => D.BrandName, O => O.MapFrom(P => P.Brand.Name))
                    .ForMember(D => D.CategoryName, O => O.MapFrom(P => P.Category.Name))
                    .ForMember(D => D.StoreName, O => O.MapFrom(P => P.Store.Name))
                    .ForMember(D => D.NewPrice, O => O.MapFrom(P => P.Promotion.NewPrice))
                    .ForMember(D => D.PromotionalText, O => O.MapFrom(P => P.Promotion.PromotionalText));



            CreateMap<Review, ReviewDto>();

            CreateMap<Review, ReviewDto>().ReverseMap();

            CreateMap<Product, ProductDto>().ReverseMap();



            CreateMap<Image, ImageDto>()
                       .ForMember(D => D.Pro_Img, O => O.MapFrom<PictureUrlResolver>());
            CreateMap<ApplicationUser, RegisterDto>().ReverseMap();

            CreateMap<Category, CategoryWithALLInformationDto>();
            CreateMap<Category, CategoryDto>().ReverseMap();
            

            CreateMap<Brand, BrandWithALLInformationDto>().ReverseMap();
            CreateMap<Brand, BrandDto>().ReverseMap();
            


            CreateMap<Store, StoreDto>().ReverseMap();

            CreateMap<Order, OrderToReturnDto>().ReverseMap();
            CreateMap<OrderItem, OrderItemDto>().ReverseMap();

			CreateMap<DeliveryMethod, DeliveryMethodDto>().ReverseMap();
		}
    }
}
