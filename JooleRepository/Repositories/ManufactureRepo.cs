using System.Data.Entity;
using Joole_DAL;

namespace JooleRepository.Repositories
{
    public interface IManufactureRepo : IRepository<tblManufacturer>
    {

    }
    public class ManufactureRepo : Repository<tblManufacturer>, IManufactureRepo
    {
        public ManufactureRepo (DbContext context) : base(context)
        {

        }

    }
}