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
        public object ValidateUser(string userName, string password)
        {
            Boolean flag = false;
            using (HREntities db = new HREntities())
            {
                try
                {
                    var user = db.Candidates.Where(x => x.emialid == userName && x.password == password).ToList();
                    if (user.Count > 0)
                    {
                        flag = true;
                        Session["user"] = user;
                    }
                }
                catch (Exception ex)
                {

                }
            }
            return flag;
        }
        [WebMethod(EnableSession = true)]
        public bool ValidateAdminUser(string userName, string password)
        {
            Boolean flag = false;
            using (HREntities db = new HREntities())
            {
                try
                {
                    var user = db.UserManagements.Where(x => x.email == userName && x.password == password).ToList();
                    if (user.Count > 0)
                    {
                        flag = true;
                        Session["user"] = user;
                    }
                }
                catch (Exception ex)
                {

                }
            }
            return flag;
        }
        [WebMethod]
        public bool createUser(string fname, string lname, string email, string password, string phNumber, string gender)
        {
            Boolean flag = false;
            using (HREntities db = new HREntities())
            {
                try
                {
                    var Candidate = db.Set<Candidate>();
                    Candidate.Add(new Candidate { firstname = fname, lastname = lname, emialid = email, password = password, contact = phNumber, gender = gender });
                    db.SaveChanges();
                    flag = true;

                }
                catch (Exception ex)
                {

                }

            }

            return flag;
        }


        [WebMethod]
        public bool createAdminUser(string fname, string lname, string email, string password, string phNumber, string gender)
        {
            Boolean flag = false;
            using (HREntities db = new HREntities())
            {
                try
                {
                    var Candidate = db.Set<UserManagement>();
                    Candidate.Add(new UserManagement { firstName = fname, LastName = lname, email = email, password = password, phone = phNumber, gender = gender });
                    db.SaveChanges();
                    flag = true;
                }
                catch (Exception ex)
                {

                }
            }
            return flag;
        }


        [WebMethod]
        public string roles()
        {
            List<UserRole> roleList = new List<UserRole>();
            using (HREntities db = new HREntities())
            {
                try
                {
                    roleList = db.UserRoles.ToList();

                }
                catch (Exception ex)
                {

                }
            }
            return JsonConvert.SerializeObject(roleList);
        }
        [WebMethod]
        public string branches()
        {

            List<Branch> branchList = new List<Branch>();
            using (HREntities db = new HREntities())
            {
                try
                {
                    branchList = db.Branches.ToList();

                }
                catch (Exception ex)
                {

                }
            }
            return JsonConvert.SerializeObject(branchList);

        }
        [WebMethod]
        public string grades()
        {
            List<UserGrade> gradeList = new List<UserGrade>();
            using (HREntities db = new HREntities())
            {
                try
                {
                    gradeList = db.UserGrades.ToList();

                }
                catch (Exception ex)
                {

                }
            }

            return JsonConvert.SerializeObject(gradeList);
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
        public bool SaveEmpProjManagement(int userid, int clientid, int projectid, string modules, int branchid, string position, DateTime estimatedclosedate)
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
                try
                {
                    candidate = db.Candidates.Where(x => x.id == userId).FirstOrDefault();
                    if (candidate != null)
                    {
                        candidate.skillset = skillset;
                        candidate.overallexperience = experience;
                        candidate.biodatapath = biodata;
                    }
                    db.SaveChanges();

                }
                catch (Exception)
                {

                    throw;
                }
                
               
            }
            return userId;
        }
        [WebMethod(EnableSession = true)]
        public string skills()
        {
            List<Skill> skillList = new List<Skill>();
            using (HREntities db = new HREntities())
            {
                try
                {
                    skillList = db.Skills.ToList();

                }
                catch (Exception ex)
                {

                }
            }

            return JsonConvert.SerializeObject(skillList);
        }
        [WebMethod(EnableSession = true)]
        public bool createJob(string jobtitle, string skills, int noofvacancies , string remarks)
        {
            bool flagSucess = false;
            int userId = Convert.ToInt16(HttpContext.Current.Session["UserID"].ToString());
            jobPost jobpost = new jobPost();
            using (HREntities db = new HREntities())
            {
                try
                {
                    jobpost.createDate = DateTime.Now;
                    jobpost.jobTilte = jobtitle;
                    jobpost.skills = skills;
                    jobpost.noOfVacancies = noofvacancies;
                    jobpost.remarks = remarks;
                    jobpost.userId = userId;
                    jobpost.isActive = true;

                    db.jobPosts.Add(jobpost);
                    db.SaveChanges();
                    flagSucess = true;
                }
                catch (Exception)
                {

                    throw;
                }

            }
            return flagSucess;
        }
    }

}


   


