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


}