using HonestBank.Domain.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HonestBank.Domain.ModelData;
using AutoMapper;
using System.Data.Entity.Validation;

namespace HonestBank.Domain.Repositories
{
    public class BranchRepository : BaseRepository
    {

        public IEnumerable<BranchModel> GetAllBranches()
        {
            return Mapper.Map<IEnumerable<BranchModel>>(dbContext.Branches.ToList());
        }

        public void AddBranch(BranchModel branch)
        {
            if (branch != null)
            {
                Branch editedBranch = Mapper.Map<Branch>(branch);
                dbContext.Branches.Add(editedBranch);
                dbContext.SaveChanges();

            }
        }

        public void UpdateBranch(BranchModel branch)
        {
            if (branch != null)
            {
                Branch editedBranch = Mapper.Map<Branch>(branch);
                dbContext.Entry(editedBranch).State = EntityState.Modified;
                dbContext.SaveChanges();
            }
        }
    }
}
