//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HonestBank.Domain.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        public Employee()
        {
            this.Accounts = new HashSet<Account>();
            this.AccountTransactions = new HashSet<AccountTransaction>();
            this.Employee1 = new HashSet<Employee>();
        }
    
        public int EmployeeID { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public System.DateTime StartDate { get; set; }
        public Nullable<int> DesignationID { get; set; }
        public Nullable<int> AssignedBranchID { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public Nullable<int> EmployeeManagerID { get; set; }
        public bool Status { get; set; }
    
        public virtual ICollection<Account> Accounts { get; set; }
        public virtual ICollection<AccountTransaction> AccountTransactions { get; set; }
        public virtual Branch Branch { get; set; }
        public virtual Department Department { get; set; }
        public virtual Designation Designation { get; set; }
        public virtual ICollection<Employee> Employee1 { get; set; }
        public virtual Employee Employee2 { get; set; }
    }
}
