using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HonestBank.Domain.Data;

namespace HonestBank.Domain.Repositories
{
    public class DesignationRepository : BaseRepository
    {
        public IEnumerable<Designation> GetAllDesignations()
        {
            return dbContext.Designations.ToList();
        }

    }
}
