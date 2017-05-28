<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="HRManagementApp.Admin.UserSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <script src="JS/adminUser.js"></script>

    <script src="../Services/service.js"></script>
    <script>
        $(document).ready(()=> {
            let objAdmin = new AdminUser();
            //objAdmin.bindRoles();
            objAdmin.bindGrades();
            objAdmin.bindBranch();
            objAdmin.bindReportingTo();
            objAdmin.signUpAdmin();
            objAdmin.GetData();
            objAdmin.bindCandidate();
            objAdmin.candidateChange();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Employee Management
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
                    <form id="sign_up">
                        <div class="row clearfix">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-line">
                                        <select class="form-control show-tick" id="drpEmployee">
                                            <option value="">-- Select User --</option>
                                            <%--<option value="Sr. Developer">Sr. Developer</option>
                                            <option value="Jr. Developer">Jr. Developer</option>
                                            <option value="Team Leader">Team Leader</option>
                                            <option value="Project Manager">Project Manager</option>--%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="name" class="form-control" id="fname" required>
                                        <label class="form-label">First Name*</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="surname" class="form-control" id="sname" required>
                                        <label class="form-label">Last Name*</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="email" name="email" class="form-control" id="email" required>
                                        <label class="form-label">Email*</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-6">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="password" class="form-control" name="password" id="password" required>
                                        <label class="form-label">Password*</label>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="password" class="form-control" name="confirm" required>
                                        <label class="form-label">Confirm Password*</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-4">
                                <div class="input-group form-float">
                                    <div class="form-line">
                                        <input type="text" class="datepicker form-control" id="txtDate" placeholder="Please choose birth date...">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group form-float">
                                    <span class="input-group-addon">
                                        <i class="material-icons">phone</i>
                                    </span>
                                    <div class="form-line">
                                        <input type="text" class="form-control" name="namecontact" minlength="10" placeholder="Contact" required id="phone">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group form-float">
                                    <input type="radio" name="gender" id="male" value="male" class="with-gap">
                                    <label for="male">Male</label>

                                    <input type="radio" name="gender" id="female" value="female" class="with-gap">
                                    <label for="female" class="m-l-20">Female</label>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-12">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <textarea name="address" cols="30" rows="2" class="form-control no-resize" required></textarea>
                                        <label class="form-label">Address*</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            
                            <div class="col-md-3">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <select id="drpGrade" class="form-control show-tick">
                                            <option value="">-- Grades --</option>
                                        </select>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <select id="drpBranch" class="form-control show-tick">
                                            <option value="">-- Branches --</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <select id="drpRole" class="form-control show-tick" multiple>
                                            <option value="1">SuperAdmin</option>
                                            <option value="2">Admin</option>
                                            <option value="3">Employee</option>
                                            <option value="4">Hr</option>
                                            <option value="5">Moderator</option>
                                        </select>
                                        <%--<select id="drpRole" class="form-control show-tick">
                                                <option value="">-- Roles --</option>
                                            </select>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <select class="form-control show-tick" id="drpReporting">
                                                <option value="">-- Reporting To --</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="row clearfix">
                            

                            <div class="col-md-6">

                                <div class="form-line">
                                    <button class="btn btn-primary m-t-15 waves-effect" type="submit">SUBMIT</button>
                                </div>

                            </div>

                        </div>


                    </form>
                </div>
            </div>
        </div>



        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Employee List</h2>
                    </div>


                    <div class="body">


                        <table id="tblEmpList" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                        </table>



                    </div>
                    <!-- body -->


                </div>

            </div>
        </div>
    </div>
</asp:Content>
