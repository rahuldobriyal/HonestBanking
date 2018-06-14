using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HonestBank.Domain.ModelData;
using HonestBank.Domain.Repositories;
using HonestBank.Domain.Services;

namespace HonestBank.UI.Controllers
{
    public class BranchController : Controller
    {
        private BranchRepository repository = null;
        private MiscServices miscServices = null;
        public BranchController()
        {
            repository = new BranchRepository();
        }
        //
        // GET: /Branch/
        public ViewResult List()
        {
            return View(repository.GetAllBranches());
        }

        public ViewResult Edit(BranchModel branch)
        {
            miscServices = new MiscServices();
            ViewBag.States = new SelectList(miscServices.GetAllStates(),"StateCode","StateName",branch.State);
            return View(branch);
        }

        public ActionResult EditBranch(BranchModel branch, FormCollection form)
        {
            branch.State = form["States"].ToString();
            if (ModelState.IsValid)
            {
                if (branch.BranchID == 0)
                {
                    repository.AddBranch(branch);
                    TempData["alertMessage"] = String.Format("Branch: {0} added suceessfully", branch.Name);
                }
                else
                {
                    repository.UpdateBranch(branch);
                    TempData["alertMessage"] = String.Format("Branch: {0} updated suceessfully", branch.Name);
                }
                return RedirectToAction("List");
            }
            TempData["errorMessage"] = "Some Error Occured ! Please try again after sometime. If the error persists, contact Adminitrator.";
            return RedirectToAction("Edit",branch); 
        }

        public ActionResult Add()
        {
            return RedirectToAction("Edit", new BranchModel() { BranchID = 0 });
        }
	}
}