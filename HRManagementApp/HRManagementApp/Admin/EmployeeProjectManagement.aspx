<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="EmployeeProjectManagement.aspx.cs" Inherits="HRManagementApp.Admin.EmployeeProjectManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <link href="../Lib/Plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    <script src="Js/EmployeeProjectManagement.js"></script>
    <script src="../Services/service.js"></script>

    <script>

        jQuery(document).ready(function () {
            let objEmpPM = new EmpProjManagement();
            objEmpPM.bindReportingTo();
            objEmpPM.bindProjectList();
            //objEmpPM.bindModuleList();
            objEmpPM.bindPositionList();
            objEmpPM.GetData();
        });



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
                    <form id="form_validation">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-line">
                                    <p>
                                        <b>User List</b>
                                    </p>
                                    <select class="form-control show-tick" data-live-search="true" id="cbxuserlist">
                                        <option value="">-- User List --</option>
                                        <%--<option value="1">Asif</option>
                                        <option value="2">Soheb</option>
                                        <option value="3">Sumit</option>
                                        <option value="4">Deniyal</option>
                                        <option value="5">Amit</option>
                                        <option value="6">Pavan</option>
                                        <option value="7">Ajay</option>
                                        <option value="8">Sohel</option>
                                        <option value="9">Jignesh</option>
                                        <option value="10">Nisarg</option>
                                        <option value="11">Darshan</option>--%>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-line">
                                    <p>
                                        <b>Project List</b>
                                    </p>
                                    <select class="form-control show-tick" data-live-search="true" id="cbxprojectlist">
                                        <option value="">-- Project List --</option>
                                        <%--<option value="1">Project A</option>
                                        <option value="2">Project B</option>
                                        <option value="3">Project C</option>
                                        <option value="4">Project D</option>
                                        <option value="5">Project E</option>--%>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-line">
                                    <p>
                                        <b>Module List</b>
                                    </p>
                                    <select class="form-control show-tick" data-live-search="true" id="cbxmodulelist" multiple>
                                        <option value="Annotation">Annotation</option>
                                        <option value="Assignment">Assignment</option>
                                        <option value="CDS">CDS</option>
                                        <option value="Clinical Data">Clinical Data</option>
                                        <option value="Data Extracttion">Data Extracttion</option>
                                        <option value="Export Comparison">Export Comparison</option>
                                        <option value="Import">Import</option>
                                        <option value="Synonmn">Synonmn</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-line">
                                    <p>
                                        <b>Position List</b>
                                    </p>
                                    <select class="form-control show-tick" data-live-search="true" id="cbxpositionlist" required>
                                        <option value="">-- Position List --</option>
                                        <%--<option value="Sr. Developer">Sr. Developer</option>
                                        <option value="Jr. Developer">Jr. Developer</option>
                                        <option value="Team Leader">Team Leader</option>
                                        <option value="Project Manager">Project Manager</option>--%>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <p>
                                            <b>Estimated Closed Date</b>
                                        </p>
                                        <input type="text" id="txtDate" class="datepicker form-control" name="closedate" required>
                                        <%--<label class="form-label">Estimated Closed Date</label>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary waves-effect" onclick="new EmpProjManagement().SaveData();">SUBMIT</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Employee Project Management -->


    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Employee Project List</h2>
                </div>
                <div class="body">
                    <table id="tblEmpProj" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
