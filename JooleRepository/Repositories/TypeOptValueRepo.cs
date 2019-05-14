using System.Data.Entity;
using Joole_DAL;

namespace JooleRepository.Repositories
{
    public interface ITypeOptValueRepo : IRepository<tblTypeOptValue>
    {

    }
    public class TypeOptValueRepo : Repository<tblTypeOptValue>, ITypeOptValueRepo
    {
        public TypeOptValueRepo(DbContext context) : base(context)
        {

        }

    }
}