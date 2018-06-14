using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HonestBank.Domain.Data;
using System.Threading.Tasks;

namespace HonestBank.Domain.Services
{
    public class Services
    {
        protected BankingDBEntities dbContext = null;
        public Services()
        {
            dbContext = new BankingDBEntities();
        }
    }
}
