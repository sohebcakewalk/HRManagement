//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HRManagementApp.Services
{
    using System;
    using System.Collections.Generic;
    
    public partial class EmployeeProjectManagement
    {
        public long id { get; set; }
        public Nullable<long> userid { get; set; }
        public Nullable<long> clientid { get; set; }
        public Nullable<long> projectid { get; set; }
        public string modules { get; set; }
        public Nullable<long> branchid { get; set; }
        public string position { get; set; }
        public Nullable<System.DateTime> estimatedclosedate { get; set; }
        public string status { get; set; }
        public Nullable<long> updatedby { get; set; }
        public Nullable<System.DateTime> createddate { get; set; }
    }
}
