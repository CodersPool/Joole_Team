using Joole_DAL;
using System.Data.Entity;


namespace JooleRepository.Repositories
{
    public interface ISubCategoryRepo : IRepository<tblSubCategory>
    {

    }
    public class SubCategoryRepo : Repository<tblSubCategory>, ISubCategoryRepo
    {
        public SubCategoryRepo(DbContext context) : base(context)
        {

        }
    }
}
