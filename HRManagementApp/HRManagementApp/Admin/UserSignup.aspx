<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="HRManagementApp.Admin.UserSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <script src="adminUser.js"></script>
    <script src="../Services/service.js"></script>
    <script>
        $(document).ready(function () {
            let objAdmin = new AdminUser();           
            objAdmin.bindRoles();
            objAdmin.bindGrades();
            objAdmin.bindBranch();
            objAdmin.bindReportingTo();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>MULTI COLUMN
                            </h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <form id="wizard_with_validation1">


                        <div class="row clearfix">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" name="name" class="form-control" required>
                                        <label class="form-label">First Name*</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" name="surname" class="form-control" required>
                                        <label class="form-label">Last Name*</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="email" name="email" class="form-control" required>
                                        <label class="form-label">Email*</label>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="row clearfix">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="password" class="form-control" name="password" id="password" required>
                                        <label class="form-label">Password*</label>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="password" class="form-control" name="confirm" required>
                                        <label class="form-label">Confirm Password*</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-line">
                                        <textarea name="address" cols="30" rows="3" class="form-control no-resize" required></textarea>
                                        <label class="form-label">Address*</label>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row clearfix">                             
                            <div class="col-md-3">
                                <div class="form-group ">
                                    <div class="form-line">
                                        <input type="text" class="datepicker form-control" id="txtDate" placeholder="Please choose birth date...">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" class="form-control" placeholder="status">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-line">
                                        <select id="drpGrade" class="form-control show-tick" >
                                            <option value="">-- Grades --</option>
                                        </select>  
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-line">
                                        <select id="drpBranch" class="form-control show-tick">
                                            <option value="">-- Branches --</option>
                                        </select>                                       
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row clearfix">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-line">
                                         <select id="drpRole" class="form-control show-tick">
                                             <option value="">-- Roles --</option>
                                         </select> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-line">
                                        <select class="form-control show-tick"  id="drpReporting">
                                            <option value="">-- Reporting To --</option>
                                            <%--<option value="Sr. Developer">Sr. Developer</option>
                                            <option value="Jr. Developer">Jr. Developer</option>
                                            <option value="Team Leader">Team Leader</option>
                                            <option value="Project Manager">Project Manager</option>--%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>  
</asp:Content>
