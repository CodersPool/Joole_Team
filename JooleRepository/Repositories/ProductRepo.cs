using System.Data.Entity;
using Joole_DAL;

namespace JooleRepository.Repositories
{
    public interface IProductRepo : IRepository<tblProduct>
    {

    }
    public class ProductRepo : Repository<tblProduct>, IProductRepo
    {
        public ProductRepo(DbContext context) : base(context)
        {

        }

    }
}