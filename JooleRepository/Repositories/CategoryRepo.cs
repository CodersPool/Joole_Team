using Joole_DAL;
using System.Data.Entity;


namespace JooleRepository.Repositories
{
    public interface ICategoryRepo : IRepository<tblCategory>
    {

    }
    public class CategoryRepo : Repository<tblCategory>, ICategoryRepo
    {
        public CategoryRepo(DbContext context) : base(context)
        {

        }

    }
}
