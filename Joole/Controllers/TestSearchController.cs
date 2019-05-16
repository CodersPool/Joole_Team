using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Joole.Models;

namespace Joole.Controllers
{
    public class TestSearchController : Controller
    {
        // GET: TestSearch
        public ActionResult TestSearchPage(int id=0)
        {

            tblSubCategory subModel = new tblSubCategory();
            using (DbModels db = new DbModels())
            {
                subModel.CategoriesCollection = db.tblCategories.ToList<tblCategory>();
            }
            return View(subModel);
        }
    }
}