using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.CategorySpecification
{
    public class CategoryWithAllProductsSpecification:BaseSpecification<Category>
    {
        public CategoryWithAllProductsSpecification()
        {
            //AddInclude(C => C.Products);
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Brand)}");
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Store)}");
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Promotion)}");
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Reviews)}");


        }
        public CategoryWithAllProductsSpecification(int id):base(C=>C.Id==id)
        {
            //AddInclude(C => C.Products);
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Brand)}");
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Store)}");
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Promotion)}");
            AddInclude($"{nameof(Category.Products)}.{nameof(Product.Reviews)}");



        }
    }

}
