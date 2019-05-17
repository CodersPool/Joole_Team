using Joole.Models;
using Joole_DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JooleRepository;
using JooleRepository.Repositories;
using JooleService;
using JooleService.Models;

namespace Joole.Controllers
{
    public class UserAccountController : Controller
    {
        Service service = new Service();
        // GET: UserAccount
        public ActionResult Login()
        {
            return View();
        }

       
        [HttpPost]
        public ActionResult Login(UserModel userModel)
        {
                tblUser userEntity = new tblUser();
                
                foreach(var u in service.GetUsers())
                {
                    if (userModel.User_Name == u.Username && userModel.User_Password == u.Password)
                    {
                        return RedirectToAction("SearchPage", "Search");
                    }
                }
                return View();
        }

        //SignUp Get Action
        public ActionResult SignUp()
        {
            UserModel objUserModel = new UserModel();
            return View(objUserModel);
        }

        //SignUp Post Action
        [HttpPost]
        public ActionResult SignUp(UserModel objUserModel)
        {
            if (ModelState.IsValid)
            {

             Joole_DAL.tblUser objUser = new Joole_DAL.tblUser();
                objUser.Username = objUserModel.User_Name;
                objUser.Email = objUserModel.User_Email;
                objUser.Password = objUserModel.User_Password;
                //objUser.User_Image = Convert.ToBoolean(objUserModel.User_Image);
                

            if (service.SignUp(objUser)){
                    objUserModel.SuccessMessage = "Success...";
                    return RedirectToAction("UserView", "Products", new { objUserModel = objUser.UserId });
                }

                else {
                    return RedirectToAction("Login");
                } 
                
                
                
            }
            return RedirectToAction("Login");
        }


    }
}