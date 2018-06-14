using HonestBank.Domain.ModelData;
using HonestBank.Domain.Repositories;
using HonestBank.Domain.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HonestBank.UI.Models;
using HonestBank.Domain.Data;

namespace HonestBank.UI.Controllers
{
    public class EmployeeController : Controller
    {
        private EmployeeRepository repository = null;
        private EmployeeServices services = null;
        private DepartmentRepository deptRepository = null;
        private BranchRepository branchRepository = null;
        private DesignationRepository desigRepository = null;
        public EmployeeController()
        {
            repository = new EmployeeRepository();
            services = new EmployeeServices();
            deptRepository = new DepartmentRepository();
            branchRepository = new BranchRepository();
            desigRepository = new DesignationRepository();
        }
        public ActionResult List(string searchText = null)
        {
            IEnumerable<EmployeeModel> empList = services.GetAllEmployees(searchText);
            return View(empList);
        }

        public ViewResult Edit(EmployeeModel employee)
        {
            ViewBag.Departments = new SelectList(deptRepository.GetAllDepartments(), "DepartmentID", "Name",employee.DepartmentName);
            ViewBag.Branches = new SelectList(branchRepository.GetAllBranches(), "BranchID", "Name",employee.AssignedBranchName);
            ViewBag.Managers = new SelectList(services.GetAllManagers(), "ManagerID", "Name",employee.ManagerName);
            ViewBag.Designations = new SelectList(desigRepository.GetAllDesignations(), "DesignationID", "Name",employee.DesignationName);
            return View(employee);
        }

        [HttpPost]
        public ActionResult EditEmployee(EmployeeModel employee, FormCollection form)
        {
            if (ModelState.IsValid)
            {
                Employee editedEmployee = new Employee();
                editedEmployee.EmployeeID = employee.EmployeeID;
                editedEmployee.FirstName = employee.FirstName;
                editedEmployee.LastName = employee.LastName;
                editedEmployee.StartDate = employee.JoiningDate;
                editedEmployee.EndDate = employee.LeavingDate;
                editedEmployee.DesignationID = Convert.ToInt32(form["Designations"]);
                editedEmployee.DepartmentID = Convert.ToInt32(form["Departments"]);
                editedEmployee.EmployeeManagerID = Convert.ToInt32(form["Managers"]);
                editedEmployee.AssignedBranchID = Convert.ToInt32(form["Branches"]);
                if (editedEmployee.EmployeeID == 0)
                {
                    repository.AddEmployee(editedEmployee);
                    TempData["alertMessage"] = String.Format("Employee added suceessfully as : {0} {1}", editedEmployee.FirstName,editedEmployee.LastName);
                }
                else
                {
                    repository.EditEmployee(editedEmployee);
                    TempData["alertMessage"] = String.Format("Employee details saved succesfully for {0} {1}", editedEmployee.FirstName,editedEmployee.LastName);
                }
                    return RedirectToAction("List");
            }
            else
                return RedirectToAction("Edit",employee);

        }

        public RedirectToRouteResult Add()
        {
            EmployeeModel model = new EmployeeModel() { 
            EmployeeID = 0,
            JoiningDate = DateTime.Now};
            return RedirectToAction("Edit",model);
        }

        public void Delete(int EmployeeID)
        {
            //repository.DeleteEmployee(EmployeeID);
            //TempData["alertMessage"] = String.Format("");
        }
    }
}