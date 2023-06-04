using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Specification.StoreSpecification
{
    public class StoreWithSupplierAndProductsSpecification : BaseSpecification<Store>
    {
        public StoreWithSupplierAndProductsSpecification()
        {
            AddInclude(S => S.Products);
        }

        public StoreWithSupplierAndProductsSpecification(int id):base(x => x.Id == id)
        {
            AddInclude(S => S.Products);
        }
    }
}
