using JooleService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using Joole_DAL;
using JooleRepository;

namespace JooleService
{
    public partial class Service
    {
        public static readonly Joole_TeamEntities Context = new Joole_TeamEntities();
        UnitOfWork uow = new UnitOfWork(Context);
        public List<SubCategory> AutoCompleteSubCategories(string input, int categoryId)
        {
            var list = uow.SubCategory.GetAll().Where(s => s.CategoryID.Equals(categoryId) && s.SubCategoryName.ToLower().Contains(input.ToLower())).
                Select(s => new SubCategory(s.SubCategoryID, s.CategoryID, s.SubCategoryName)).ToList();
            return list;
        }

        public List<Category> ShowAllCategories()
        {
            var list = uow.Category.GetAll().Select(cat => new Category(cat.CategoryID, cat.CategoryName)).ToList();
            return list;
        }
    }
}