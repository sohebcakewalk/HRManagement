<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="EmployeeProjectManagement.aspx.cs" Inherits="HRManagementApp.Admin.EmployeeProjectManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Employee Project Management -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Employee Project Management</h2>
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
                    <form id="form_validation" method="POST">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-line">
                                    <select class="form-control show-tick">
                                        <option value="">-- Project Selection --</option>
                                        <option value="Project A">Project A</option>
                                        <option value="Project B">Project B</option>
                                        <option value="Project C">Project C</option>
                                        <option value="Project D">Project D</option>
                                        <option value="Project E">Project E</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-line">
                                    <select class="form-control show-tick">
                                        <option value="">-- Module List --</option>
                                        <option value="Module A">Module A</option>
                                        <option value="Module B">Module B</option>
                                        <option value="Module C">Module C</option>
                                        <option value="Module D">Module D</option>
                                        <option value="Module E">Module E</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-line">
                                    <select class="form-control show-tick">
                                        <option value="">-- Position List --</option>
                                        <option value="Sr. Developer">Sr. Developer</option>
                                        <option value="Jr. Developer">Jr. Developer</option>
                                        <option value="Team Leader">Team Leader</option>
                                        <option value="Project Manager">Project Manager</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" id="txtDate" class="datepicker form-control" name="closedate" required>
                                        <label class="form-label">Estimated Closed Date</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Employee Project Management -->
</asp:Content>
