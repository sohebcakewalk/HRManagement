using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace HRManagementApp.Services
{
    public class User
    {
        [WebMethod]
        public string ValidateUser(string uerName, string password)
        {
            string result = "Welcome Mr. " + uerName + ". Your address is '" + uerName + "'.";
            return result;
        }
        [WebMethod]
        public string createUser(string uerName, string password)
        {
            string result = "Welcome Mr. " + uerName + ". Your address is '" + uerName + "'.";
            return result;
        }
    }    

}