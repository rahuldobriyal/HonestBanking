using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HonestBank.Domain.Data;

namespace HonestBank.Domain.Repositories
{
    public class BaseRepository
    {
        public BankingDBEntities dbContext = null;
        public BaseRepository()
        {
            dbContext = new BankingDBEntities();
        }
    }
}
