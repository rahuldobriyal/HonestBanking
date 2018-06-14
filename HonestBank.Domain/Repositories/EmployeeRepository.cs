using HonestBank.Domain.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HonestBank.Domain.ModelData;
using System.Data.Entity;

namespace HonestBank.Domain.Repositories
{
    public class EmployeeRepository : BaseRepository
    {
        public IEnumerable<Employee> GetEmployeesList()
        {
            return dbContext.Employees.ToList();
        }

        public void AddEmployee(EmployeeModel employee)
        {
            Employee emp = new Employee();
            emp.FirstName = employee.FirstName;
            emp.LastName = employee.LastName;
            if (employee.JoiningDate == null)
            {
                emp.StartDate = DateTime.Now;
            }
            emp.StartDate = employee.JoiningDate;
            emp.EndDate = null;
        }

        public void EditEmployee(Employee employee)
        {
            if (employee != null)
            {
                dbContext.Entry(employee).State = EntityState.Modified;
                dbContext.SaveChanges();
            }
        }

        public void AddEmployee(Employee employee)
        {
            if(employee != null)
            {
                dbContext.Employees.Add(employee);
                dbContext.SaveChanges();
            }
        }
    }
}
