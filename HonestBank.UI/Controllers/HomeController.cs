using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HonestBank.UI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Honest Bank Web Application for Admin";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contact : Softway Solutions for support";

            return View();
        }
    }
}