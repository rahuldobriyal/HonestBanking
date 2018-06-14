using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace HonestBank.Domain.ModelData
{
    public class EmployeeModel
    {
        [Editable(false)]
        public int EmployeeID { get; set; }

        [Required(ErrorMessage="Please enter a first name")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "Please enter a last name")]
        public string LastName { get; set; }

        [Display(Name="Designation Name")]
        public string DesignationName { get; set; }

        [Display(Name = "Assigned Branch Name")]
        public string AssignedBranchName { get; set; }

        [Display(Name = "Department Name")]
        public string DepartmentName { get; set; }

        [Display(Name = "Manager Name")]
        public string ManagerName { get; set; }

        [Display(Name = "Leaving Date")]
        public Nullable<System.DateTime> LeavingDate { get; set; }

        [Display(Name = "Joining Date")]
        public System.DateTime JoiningDate { get; set; }

        [Required(ErrorMessage="Status has to be active/Inactive")]
        public string Status { get; set; }

    }

    public class ManagerModel
    {
        [Editable(false)]
        public int ManagerID { get; set; }
        public string Name { get; set; }
    }
}
