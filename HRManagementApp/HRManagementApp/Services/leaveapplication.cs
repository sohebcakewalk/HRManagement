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
    
    public partial class leaveapplication
    {
        public int id { get; set; }
        public Nullable<System.DateTime> createddate { get; set; }
        public Nullable<int> userid { get; set; }
        public string leavetype { get; set; }
        public Nullable<System.DateTime> leavefrom { get; set; }
        public Nullable<System.DateTime> leavetodate { get; set; }
        public Nullable<int> totaldays { get; set; }
        public Nullable<int> approvedby { get; set; }
        public string status { get; set; }
        public Nullable<long> branchId { get; set; }
    }
}
