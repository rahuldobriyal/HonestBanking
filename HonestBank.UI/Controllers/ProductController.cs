using HonestBank.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HonestBank.UI.Controllers
{
    public class ProductController : Controller
    {
        private ProductRepository repository = null;
        public ProductController()
        {
            repository = new ProductRepository();
        }
        public ActionResult List()
        {
            return View(repository.GetAllProducts());
        }
	}
}