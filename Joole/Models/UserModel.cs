using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Joole.Models
{
    public class UserModel
    {
        [HiddenInput]
        public int Id { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "User Name is Required.")]
        [MaxLength(50)]
        [Display(Name = "UserName: ")]
        public string User_Name { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Email is Required.")]
        [MaxLength(50)]
        [Display(Name = "Email Address: ")]
        public string User_Email { get; set; }


        public byte[] User_Image { get; set; }



        [Required(AllowEmptyStrings = false, ErrorMessage = "Password is Required.")]
        [MaxLength(500)]
        [DataType(DataType.Password)]
        [Display(Name = "Password: ")]
        public string User_Password { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Please confirm your password")]
        [MaxLength(500)]
        [DataType(DataType.Password)]
        [System.ComponentModel.DataAnnotations.Compare("User_Password", ErrorMessage = "Password Doesnt match.")]
        [Display(Name = "Confirm Password: ")]
        public string ConfirmPassword { get; set; }

        public string SuccessMessage { get; set; }

    }
}