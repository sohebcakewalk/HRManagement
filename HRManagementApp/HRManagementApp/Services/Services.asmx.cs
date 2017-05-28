﻿using System;
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

        [WebMethod(EnableSession = true)]
        public bool ValidateUser(string userName, string password)
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
                        Session["candidateuser"] = string.Format("{0}|{1}",user.FirstOrDefault().id, user.FirstOrDefault().emialid);
                    }
                }
                catch (Exception)
                {
                    throw;
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
                    var user = db.UserManagements.Where(x => x.email == userName && x.password == password);
                    if (user.Any ())
                    {
                        flag = true;
                        Session["adminuser"] = string.Format("{0}|{1}", user.FirstOrDefault().userId, user.FirstOrDefault().email);
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
            return flag;
        }
        [WebMethod(EnableSession = true)]
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
                catch (Exception)
                {
                    throw;
                }

            }

            return flag;
        }


        [WebMethod(EnableSession = true)]
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
                catch (Exception)
                {
                    throw;
                }
            }
            return flag;
        }


        [WebMethod(EnableSession = true)]
        public string roles()
        {
            List<UserRole> roleList = new List<UserRole>();
            using (HREntities db = new HREntities())
            {
                try
                {
                    roleList = db.UserRoles.ToList();

                }
                catch (Exception)
                {
                    throw;
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
                catch (Exception )
                {
                    throw;
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
                catch (Exception)
                {
                    throw;
                }
            }

            return JsonConvert.SerializeObject(gradeList);
        }

        [WebMethod(EnableSession = true)]
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



        [WebMethod(EnableSession = true)]
        public bool SaveTask(string Taskname, string gitUrl, int timeTaken,string recordid)
        {
            bool flagSucess = false;

            using (HREntities db = new HREntities())
            {

                if (recordid == "")
                {
                    Task tsk = new Task()
                    {
                        taskName = Taskname,
                        gitUrl = gitUrl,
                        timeTaken = timeTaken,
                        createdDate = DateTime.UtcNow
                    };

                    if (Session["user"] != null)
                    {

                        string currentUser = Session["user"].ToString();

                        if (currentUser != null)
                        {
                            tsk.userId = long.Parse(currentUser.Split('|')[0]);

                        }
                    }


                    db.Tasks.Add(tsk);
                }else
                {
                    long Taskid = long.Parse(recordid);

                    var data = db.Tasks.Where(j => j.taskId == Taskid);
                    if (data.Any())
                    {
                        var d = data.FirstOrDefault();
                        d.taskName = Taskname;
                        d.gitUrl = gitUrl;
                        d.timeTaken = timeTaken;


                    }

                }

                db.SaveChanges();


                flagSucess = true;
            }


            return flagSucess;
        }

        [WebMethod(EnableSession = true)]
        public string GetEmpProjManagementList()
        {
            try
            {
                using (HREntities db = new HREntities())
                {
                    var data = (from a in db.EmployeeProjectManagements
                                join m1 in db.Clients on a.clientid equals m1.clientId
                                join m2 in db.Projects on a.projectid equals m2.projectId                                
                                select new ModelEmpProjManagement
                                {
                                    id = a.id,
                                    userid = a.userid,
                                    clientid = a.clientid,
                                    clientName = m1.clientname,
                                    projectid = a.projectid,
                                    projectName = m2.projectName,
                                    modules = a.modules,
                                    branchid = a.branchid,
                                    position = a.position,
                                    estimatedclosedate = a.estimatedclosedate,
                                    createddate = DateTime.UtcNow

                                });
                    return JsonConvert.SerializeObject(data.ToList());
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [WebMethod(EnableSession = true)]
        public string UserManagement()
        {
            using (HREntities db = new HREntities())
            {
                try
                {
                    var data = (from a in db.UserManagements
                                select new Models.UserManage
                                {
                                    userId = a.userId,
                                    firstName = a.firstName,
                                    LastName = a.LastName,
                                    email = a.email,
                                    gender = a.gender,
                                    phone = a.phone,
                                    dob = a.dob,
                                    address1 = a.address1,
                                    address2 = a.address2,
                                    createDate = a.createDate,
                                    status = true,
                                    roles = a.roles,
                                    grade = a.grade,
                                    gradeChangeDate = a.gradeChangeDate,
                                    registeredBy = a.registeredBy,
                                    branchId = a.branchId,
                                    reportingTo = a.reportingTo

                                });
                    return JsonConvert.SerializeObject(data.ToList<Models.UserManage>());
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }

        [WebMethod(EnableSession = true)]
        public bool SaveEmpProjManagement(int userid, int projectid, string modules, string position, DateTime estimatedclosedate)
        {
            bool flagSucess = false;

            try
            {
                using (HREntities db = new HREntities())
                {
                    EmployeeProjectManagement tsk = new EmployeeProjectManagement();

                    var cId = db.Projects.Where(a => a.projectId == projectid).Select(a => a.clientId ).FirstOrDefault();
                    var bId = db.UserManagements.Where(a => a.userId == userid).Select(a => a.branchId ).FirstOrDefault();

                    tsk.userid = userid;
                    tsk.clientid = cId;
                    tsk.projectid = projectid;
                    tsk.modules = modules;
                    tsk.branchid = bId;
                    tsk.position = position;
                    tsk.estimatedclosedate = estimatedclosedate;
                    tsk.status = "Added";
                    tsk.updatedby = 2;
                    tsk.createddate = DateTime.UtcNow;

                    db.EmployeeProjectManagements.Add(tsk);
                    db.SaveChanges();
                    flagSucess = true;
                }
            }
            catch (Exception)
            {


                throw;
            }
            
            return flagSucess;

        }

        [WebMethod]
        public string projectList()
        {
            List<Project> projectList = new List<Project>();
            using (HREntities db = new HREntities())
            {
                try
                {
                    projectList = db.Projects.OrderBy(a=>a.projectName).ToList();

                }
                catch (Exception ex)
                {

                }
            }
            return JsonConvert.SerializeObject(projectList);
        }

        [WebMethod]
        public string moduleList()
        {
            List<ProjectModule> moduleList = new List<ProjectModule>();
            using (HREntities db = new HREntities())
            {
                try
                {
                    moduleList = db.ProjectModules.OrderBy(a => a.modulename).ToList();

                }
                catch (Exception ex)
                {

                }
            }
            return JsonConvert.SerializeObject(moduleList);
        }


    }

}




