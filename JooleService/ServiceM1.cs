using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JooleRepository;
using Joole_DAL;
using JooleRepository.Repositories;

namespace JooleService
{
    
    public partial class Service
    {
        //public static readonly JooleXYZEntities1 context = new JooleXYZEntities1();
        //UnitOfWorks uow = new UnitOfWorks(context);

        public Service()
        {
            
        }
        public bool SignUp(tblUser userEntity)
        {
            this.uow.User.Insert(userEntity);
            //this.uow.userRepo.Insert(userEntity);
            this.uow.SaveChanges();
            return true;
        }

        public IEnumerable<tblUser> GetUsers()
        {
            return uow.User.GetAll();
            
        }

        public tblUser GetUser(int id)
        {
            return uow.User.GetById(id);
        }

        public void InsertUser(tblUser user)
        {
           
            Context.tblUsers.Add(user);
            uow.SaveChanges();
        }

        public void UpdateUser(tblUser user)
        {
            throw new NotImplementedException();
        }

        public void DeleteUser(long id)
        {
            throw new NotImplementedException();
        }

       
    }
}
