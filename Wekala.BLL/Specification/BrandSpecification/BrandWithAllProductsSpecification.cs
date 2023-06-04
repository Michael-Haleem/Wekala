using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.BrandSpecification
{
    public class BrandWithAllProductsSpecification:BaseSpecification<Brand>
    {
        public BrandWithAllProductsSpecification()
        {
            //AddInclude($"{nameof(Category.Products)}.{nameof(Product.Brand)}");
            //AddInclude($"{nameof(Category.Products)}.{nameof(Product.Store)}");
            //AddInclude($"{nameof(Category.Products)}.{nameof(Product.Promotion)}");
            //AddInclude($"{nameof(Category.Products)}.{nameof(Product.Reviews)}");
            AddInclude(b => b.Products);
        }
        public BrandWithAllProductsSpecification(int id):base(B=>B.Id==id)
        {
			//AddInclude($"{nameof(Category.Products)}.{nameof(Product.Brand)}");
			//AddInclude($"{nameof(Category.Products)}.{nameof(Product.Store)}");
			//AddInclude($"{nameof(Category.Products)}.{nameof(Product.Promotion)}");
			//AddInclude($"{nameof(Category.Products)}.{nameof(Product.Reviews)}");
			AddInclude(b => b.Products);

		}
    }
}
