using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HonestBank.Domain.Repositories;
using HonestBank.Domain.Services;

namespace HonestBank.UI.Controllers
{
    public class NavController : Controller
    {
        private AdminServices services = null;
        public NavController()
        {
            services = new AdminServices();
        }

        public PartialViewResult Menu()
        {
            return PartialView(services.GetAdminTaskCategories());
        }
	}
}