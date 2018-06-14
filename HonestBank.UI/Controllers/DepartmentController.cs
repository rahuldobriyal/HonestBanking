using HonestBank.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HonestBank.UI.Controllers
{
    public class DepartmentController : Controller
    {
        private DepartmentRepository repository = null;
        public DepartmentController()
        {
            repository = new DepartmentRepository();
        }

        public ActionResult List()
        {
            return View(repository.GetAllDepartments());
        }
	}
}