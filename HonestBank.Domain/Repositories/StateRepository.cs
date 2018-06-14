using HonestBank.Domain.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HonestBank.Domain.Repositories
{
    public class StateRepository : BaseRepository
    {
        public IEnumerable<State> GetAllStates(string searchText)
        {
            if (!String.IsNullOrEmpty(searchText))
                return dbContext.States.Where(x => x.StateName.Contains(searchText)).ToList();
            else
                return dbContext.States.ToList();
        }
    }
}
