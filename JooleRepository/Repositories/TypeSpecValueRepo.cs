using System.Data.Entity;
using Joole_DAL;

namespace JooleRepository.Repositories
{
    public interface ITypeSpecValueRepo : IRepository<tblTypeSpecValue>
    {

    }
    public class TypeSpecValueRepo : Repository<tblTypeSpecValue>, ITypeSpecValueRepo
    {
        public TypeSpecValueRepo(DbContext context) : base(context)
        {

        }

    }
}