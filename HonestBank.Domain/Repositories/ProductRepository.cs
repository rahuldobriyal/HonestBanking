using HonestBank.Domain.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HonestBank.Domain.Repositories
{
    public class ProductRepository : BaseRepository
    {
        public IEnumerable<Product> GetAllProducts()
        {
            return dbContext.Products.ToList();
        }
    }
}
