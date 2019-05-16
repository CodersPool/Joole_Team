using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Joole.Models
{
    public class SubCategoryViewModel
    {
        public int category_Id { get; set; }
        public string name { get; set; }

        public SubCategoryViewModel()
        {

        }
        public SubCategoryViewModel(int category_Id, string name)
        {
            this.category_Id = category_Id;
            this.name = name;
        }

    }
}