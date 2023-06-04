using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Interfaces
{
    public interface ICartRepository
    {
        Task<Cart> GetCart(string cartId);
        Task<Cart> UpdateCart(Cart cart);
        Task<bool> DeleteCart(string cartId);
    }
}
