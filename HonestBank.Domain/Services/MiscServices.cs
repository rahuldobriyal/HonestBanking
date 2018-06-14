using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HonestBank.Domain.Data;

namespace HonestBank.Domain.Services
{
    public class MiscServices : Services
    {
        public IEnumerable<State> GetAllStates()
        {
            IEnumerable<State> statesList = null;
            statesList = dbContext.States.ToList();
            return statesList;
        }
    }
}
