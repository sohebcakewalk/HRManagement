﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class HREntities : DbContext
    {
        public HREntities()
            : base("name=HREntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Attendance> Attendances { get; set; }
        public DbSet<Branch> Branches { get; set; }
        public DbSet<Candidate> Candidates { get; set; }
        public DbSet<Client> Clients { get; set; }
        public DbSet<EmployeeProjectManagement> EmployeeProjectManagements { get; set; }
        public DbSet<EmployeeSalary> EmployeeSalaries { get; set; }
        public DbSet<interview> interviews { get; set; }
        public DbSet<JobsAppliedFor> JobsAppliedFors { get; set; }
        public DbSet<leaveapplication> leaveapplications { get; set; }
        public DbSet<ModulesInRole> ModulesInRoles { get; set; }
        public DbSet<performanceappraisal> performanceappraisals { get; set; }
        public DbSet<ProjectModule> ProjectModules { get; set; }
        public DbSet<Skill> Skills { get; set; }
        public DbSet<UiModule> UiModules { get; set; }
        public DbSet<UserGrade> UserGrades { get; set; }
        public DbSet<UserManagement> UserManagements { get; set; }
        public DbSet<UserRole> UserRoles { get; set; }
        public DbSet<UserSkillset> UserSkillsets { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Task> Tasks { get; set; }
        public DbSet<jobPost> jobPosts { get; set; }
    }
}
