using Joole.Models;
using JooleService;
using JooleService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Joole.Controllers
{
    public class SearchController : Controller
    {
        Service service = new Service();
        // GET: Search
        public ActionResult SearchPage()
        {
            return View();
        }

        public ActionResult ShowCategories()
        {
            return Json(service.ShowAllCategories(), JsonRequestBehavior.AllowGet);
        }

        //public JsonResult ShowCategories()
        //{
        //    var x = service.ShowAllCategories();
        //    return Json(x, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult AutoCompleteSubCategory(SubCategoryViewModel model)
        {
            return Json(service.AutoCompleteSubCategories(model.name, model.category_Id));
        }
        //[HttpPost]
        //public JsonResult AutoCompleteSubCategory(SubCategoryViewModel model)
        //{
        //    var x = service.AutoCompleteSubCategories(model.name, model.category_Id);
        //    return Json(service.AutoCompleteSubCategories(model.name, model.category_Id));
        //}


    }
}