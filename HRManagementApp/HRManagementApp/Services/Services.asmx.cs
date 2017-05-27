using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Newtonsoft.Json;
using HRManagementApp.Services;


namespace HRManagementApp.Services
{
    /// <summary>
    /// Summary description for Services
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Services : System.Web.Services.WebService
    {
       [WebMethod]       
        public string getUser()
        {
            
            return "sumit";
        }
        [WebMethod(EnableSession = true)]
        public object ValidateUser(string userName, string password)
        {
            object user;
            using (HREntities db = new HREntities()) {
                user = db.Candidates.Where(x => x.emialid == userName && x.password == password).Select(x => x.id).SingleOrDefault();
                
                if (user != null) {
                    Session["UserID"] = user;
                }
            }          
            return user;
        }
        [WebMethod]
        public string createUser(string name, string email, string password)
        {
            return name;
        }
        [WebMethod]
        public object getCandidate(int id)
        {
            object candidate;
            using (HREntities db = new HREntities())
            {
                candidate = db.Candidates.Where(x => x.id == id).ToList();
                
            }
            return candidate;
        }
        [WebMethod(EnableSession = true)]
        public int updateCandidate(string skillset, int experience, string biodata)
        {
            int userId = Convert.ToInt16(HttpContext.Current.Session["UserID"].ToString());
            Candidate candidate = new Candidate();
            using (HREntities db = new HREntities())
            {
                
                candidate = db.Candidates.Where(x => x.id == userId).FirstOrDefault();
                if (candidate != null) {
                    candidate.skillset = skillset;
                    candidate.overallexperience = experience;
                    candidate.biodatapath = biodata;
                }
                db.SaveChanges();
            }
            return userId;
        }
    }
}
