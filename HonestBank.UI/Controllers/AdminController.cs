using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HonestBank.Domain.Repositories;

namespace HonestBank.UI.Controllers
{
    public class AdminController : Controller
    {
        private AdminRepository repository = null;
        public AdminController()
        {
            repository = new AdminRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        public void Delete()
        {

        }
	}
}