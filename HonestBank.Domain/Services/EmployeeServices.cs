using HonestBank.Domain.ModelData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HonestBank.Domain.Services
{
    public class EmployeeServices : Services
    {
        private string sqlQueryString = null;
        public IEnumerable<EmployeeModel> GetAllEmployees(string searchText)
        {
            sqlQueryString = "SELECT E.EmployeeID,E.FirstName,E.LastName,E.StartDate JoiningDate,E.EndDate LeavingDate,CASE WHEN E.Status=1 THEN 'Active' ELSE 'Inactive' END AS Status,DD.Name DesignationName,B.Name AssignedBranchName," +
                                        "D.Name DepartmentName,M.FirstName + ' ' + M.LastName ManagerName FROM Employee E JOIN Branch B ON E.AssignedBranchID = B.BranchID" +
                                    " JOIN Department D ON E.DepartmentID = D.DepartmentID JOIN Designation DD ON E.DesignationID = DD.DesignationID LEFT JOIN Employee M ON E.EmployeeManagerID = M.EmployeeID";
            if(searchText != null)
            {
                sqlQueryString += " WHERE E.FirstName LIKE '%"+searchText+"%' OR E.LastName LIKE '%"+searchText+"%'";
            }

            IEnumerable<EmployeeModel> list = dbContext.Database.SqlQuery<EmployeeModel>(sqlQueryString).ToList();
            return list;// dbContext.Database.SqlQuery<EmployeeModel>(sqlQueryString).ToList();
        }

        public IEnumerable<ManagerModel> GetAllManagers()
        {
            sqlQueryString = "SELECT EmployeeID ManagerID,FirstName + ' ' + LastName Name FROM Employee E JOIN Designation D ON E.DesignationID = D.DesignationID" +
                " WHERE D.Name LIKE '%Manager%'";
            return dbContext.Database.SqlQuery<ManagerModel>(sqlQueryString).ToList();
        }
    }
}
