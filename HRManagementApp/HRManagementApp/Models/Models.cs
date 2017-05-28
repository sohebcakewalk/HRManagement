using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRManagementApp.Models
{
    public class Models
    {




    }



    public class ModelTask
    {
        public long TaskId { get; set; }
        public string GitUrl { get; set; }
        public DateTime ? createDate { get; set; }
        public string TaskName { get; set; }
        public long ? UserId { get; set; }
        public DateTime ? CompletedDate { get; set; }
        public long ? TimeTaken { get; set; }
    }

    public class ModelEmpProjManagement
    {
        public int id { get; set; }
        public Nullable<int> useid { get; set; }
        public Nullable<int> clientid { get; set; }
        public Nullable<int> projectid { get; set; }
        public string modules { get; set; }
        public Nullable<int> branchid { get; set; }
        public string position { get; set; }
        public Nullable<System.DateTime> estimatedclosedate { get; set; }
        public string status { get; set; }
        public Nullable<int> updatedby { get; set; }
        public Nullable<System.DateTime> createddate { get; set; }
    }

}