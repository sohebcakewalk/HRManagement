﻿using System;
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
    public class UserManage
    {
        public long userId { get; set; }
        public string firstName { get; set; }
        public string LastName { get; set; }
        public string email { get; set; }       
        public string gender { get; set; }
        public string phone { get; set; }
        public Nullable<System.DateTime> dob { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public string status { get; set; }
        public string roles { get; set; }
        public string grade { get; set; }
        public Nullable<System.DateTime> gradeChangeDate { get; set; }
        public Nullable<long> registeredBy { get; set; }
        public Nullable<long> branchId { get; set; }
        public Nullable<long> reportingTo { get; set; }
    }

}