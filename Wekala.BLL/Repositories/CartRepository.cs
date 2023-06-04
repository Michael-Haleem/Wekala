using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Wekala.BLL.Interfaces;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Repositories
{
    public class CartRepository : ICartRepository
    {
        private readonly IDatabase database;

        public CartRepository(IConnectionMultiplexer redis)
        {
            database = redis.GetDatabase();
        }

        public async Task<Cart> GetCart(string cartId)
        {
            var cart = await database.StringGetAsync(cartId);
            return cart.IsNullOrEmpty ? null : JsonSerializer.Deserialize<Cart>(cart);
        }

        public async Task<Cart> UpdateCart(Cart cart)
        {
            var created = await database.StringSetAsync(cart.Id, JsonSerializer.Serialize(cart), TimeSpan.FromDays(30));
            if (!created) return null;
            return await GetCart(cart.Id);
        }

        public async Task<bool> DeleteCart(string cartId)
        {
            return await database.KeyDeleteAsync(cartId);
        }
    }
}
