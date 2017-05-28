using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Newtonsoft.Json;
using HRManagementApp.Services;
using HRManagementApp.Models;

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
        public bool ValidateUser(string userName, string password)
        {
            Boolean flag = false;
            using (HREntities db = new HREntities()) {
                var user = db.Candidates.Where(x => x.emialid == userName && x.password == password).ToList();
                if (user.Count > 0)
                {
                    flag = true;
                    Session["user"] = user;
                }
            }
            return flag;
        }
        [WebMethod]
        public string createUser(string name, string email, string password)
        {

            return name;
        }

        [WebMethod]
        public List<Models.ModelTask> GetTaskList()
        {
            try
            {
                using (HREntities db = new HREntities())
                {
                    var data = (from a in db.Tasks
                                select new Models.ModelTask
                                {
                                    TaskId = a.taskId,
                                    TaskName = a.taskName,
                                    CompletedDate = a.completedDate,
                                    createDate = a.createdDate,
                                    GitUrl = a.gitUrl,
                                    TimeTaken = a.timeTaken,

                                });

                    return data.ToList<Models.ModelTask>();

                }
            }
            catch (Exception)
            {

                throw;
            }

        }



        [WebMethod]
        public bool SaveTask(string Taskname, string gitUrl, int timeTaken)
        {
            bool flagSucess = false;

            using (HREntities db = new HREntities())
            {
                Task tsk = new Task();

                tsk.taskName = Taskname;
                tsk.gitUrl = gitUrl;
                tsk.timeTaken = timeTaken;

                db.Tasks.Add(tsk);
                db.SaveChanges();
                flagSucess = true;
            }

            return flagSucess;


        }

        [WebMethod]
        public List<ModelEmpProjManagement> GetEmpProjManagementList()
        {
            try
            {
                using (HREntities db = new HREntities())
                {
                    var data = (from a in db.EmployeeProjectManagements
                                select new ModelEmpProjManagement
                                {
                                    id = a.id,
                                    useid = a.useid,
                                    clientid = a.clientid,
                                    projectid = a.projectid,
                                    modules = a.modules,
                                    branchid = a.branchid,
                                    position = a.position,
                                    estimatedclosedate = a.estimatedclosedate,
                                    createddate = DateTime.UtcNow

                });
                    return data.ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        [WebMethod]
        public bool SaveEmpProjManagement(int userid, int clientid, int projectid,string modules,int branchid, string position, DateTime estimatedclosedate)
        {
            bool flagSucess = false;

            using (HREntities db = new HREntities())
            {
                EmployeeProjectManagement tsk = new EmployeeProjectManagement();

                tsk.useid = userid;
                tsk.clientid = clientid;
                tsk.projectid = projectid;
                tsk.modules = modules;
                tsk.branchid = branchid;
                tsk.position = position;
                tsk.estimatedclosedate = estimatedclosedate;
                tsk.status = "Added";
                tsk.updatedby = 2;
                tsk.createddate = DateTime.UtcNow;

                db.EmployeeProjectManagements.Add(tsk);
                db.SaveChanges();
                flagSucess = true;
            }

            return flagSucess;

        }


    }


   

}
