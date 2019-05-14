using System.Data.Entity;
using Joole_DAL;

namespace JooleRepository.Repositories
{
    public interface ITypeRepo : IRepository<tblType>
    {

    }
    public class TypeRepo : Repository<tblType>, ITypeRepo
    {
        public TypeRepo(DbContext context) : base(context)
        {

        }

    }
}