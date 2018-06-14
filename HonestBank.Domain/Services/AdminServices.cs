using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HonestBank.Domain.Data;

namespace HonestBank.Domain.Services
{
    public class AdminServices : Services
    {
        private string sqlQueryString = null;

        public IEnumerable<AdminWorkCategory> GetAdminTaskCategories()
        {
            return dbContext.AdminWorkCategories.ToList();
        }
    }
}
