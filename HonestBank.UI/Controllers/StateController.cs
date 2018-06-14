using HonestBank.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HonestBank.UI.Controllers
{
    public class StatesController : Controller
    {
        private StateRepository repository = null;
        public StatesController()
        {
            repository = new StateRepository();
        }
        public ActionResult List(string searchText = null)
        {
            return View(repository.GetAllStates(searchText));
        }
	}
}