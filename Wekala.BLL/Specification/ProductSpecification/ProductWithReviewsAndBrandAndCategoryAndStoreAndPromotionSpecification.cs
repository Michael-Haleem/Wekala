using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.ProductSpecification
{
    public class ProductWithReviewsAndBrandAndCategoryAndStoreAndPromotionSpecification : BaseSpecification<Product>
    {
        public ProductWithReviewsAndBrandAndCategoryAndStoreAndPromotionSpecification()
        {
            AddInclude(P => P.Reviews);
            AddInclude(P => P.Brand);
            AddInclude(P => P.Category);
            AddInclude(P => P.Store);
            AddInclude(P => P.Promotion);
        }

        public ProductWithReviewsAndBrandAndCategoryAndStoreAndPromotionSpecification(int id) : base(P => P.Id == id)
        {
            AddInclude(P => P.Reviews);
            AddInclude(P => P.Brand);
            AddInclude(P => P.Category);
            AddInclude(P => P.Store);
            AddInclude(P => P.Promotion);
        }
    }
}
