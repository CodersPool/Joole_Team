using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JooleService.Models
{
    public class SubCategory
    {
        public int id { get; set; }
        public int categoryId { get; set; }

        public string name { get; set; }

        public SubCategory(int id, int? categoryId, string name)
        {
            this.id = id;
            this.categoryId = categoryId ?? default(int);
            this.name = name;
        }
    }
}