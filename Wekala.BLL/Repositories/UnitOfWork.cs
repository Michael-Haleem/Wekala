using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wekala.BLL.Interfaces;
using Wekala.DAL.Contexts;
using Wekala.DAL.Entities;

namespace Wekala.BLL.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly WekalaDBContext _context;
        private Hashtable _repositories;

        public UnitOfWork(WekalaDBContext context)
        {
            _context = context;
        }
        public async Task<int> Complete()
        {
            return await _context.SaveChangesAsync();
        }

        public IGenericRepository<TEntity> Repository<TEntity>() where TEntity : class
        {
            if (_repositories == null)
                _repositories = new Hashtable();

            var type = typeof(TEntity).Name;

            if (!_repositories.ContainsKey(type))
            {
                var repository = new GenericRepository<TEntity>(_context);
                _repositories.Add(type, repository);
            }

            return (IGenericRepository<TEntity>)_repositories[type];
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
