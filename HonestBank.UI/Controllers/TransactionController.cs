using HonestBank.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HonestBank.UI.Controllers
{
    public class TransactionController : Controller
    {
        private TransactionRepository repository = null;
        public ActionResult List()
        {
            ViewBag.SearchCategory = new SelectList(new List<SelectListItem>{
                  new SelectListItem { Selected = true, Text = "Transaction ID", Value = "TransactionID"},
                new SelectListItem {Selected = false, Text = "Transaction Date", Value = "TransactionDate"},
                new SelectListItem{ Selected = false,Text = "Account ID", Value = "AccountID"},
            },"Value","Text"); 
            return View();
        }
	}
}