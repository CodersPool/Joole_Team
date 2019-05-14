using System.Data.Entity;
using Joole_DAL;

namespace JooleRepository.Repositories
{
    public interface IUserRepo : IRepository<tblUser>
    {

    }
    public class UserRepo : Repository<tblUser>, IUserRepo
    {
        public UserRepo(DbContext context) : base(context)
        {

        }

    }
}