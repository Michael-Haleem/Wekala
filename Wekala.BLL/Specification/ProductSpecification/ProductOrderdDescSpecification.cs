using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.ProductSpecification
{
    public class ProductOrderdDescSpecification : BaseSpecification<Product>
    {
        public ProductOrderdDescSpecification()
        {
            AddInclude(P => P.Reviews);
            AddInclude(P => P.Brand);
            AddInclude(P => P.Category);
            AddInclude(P => P.Store);
            AddInclude(P => P.Promotion);
            ApplyOrderByDescending(P => P.Id);
        }
    }
}
