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
    
    public partial class performanceappraisal
    {
        public int id { get; set; }
        public Nullable<System.DateTime> apprisaldate { get; set; }
        public Nullable<System.DateTime> approvaldate { get; set; }
        public Nullable<int> userid { get; set; }
        public string financialyear { get; set; }
        public Nullable<int> hrrating { get; set; }
        public Nullable<int> clientrating { get; set; }
        public Nullable<int> superiorrating { get; set; }
        public Nullable<decimal> appraisalpercentage { get; set; }
        public string approveappraisal { get; set; }
        public Nullable<System.DateTime> apraisalfromdate { get; set; }
        public string dispute { get; set; }
        public Nullable<int> moderaterid { get; set; }
        public string status { get; set; }
        public string remarks { get; set; }
        public Nullable<System.DateTime> createddate { get; set; }
    }
}
