<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="HRManagementApp.Admin.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <link href="../Lib/Plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    <%--<script src="../Lib/Plugins/jquery/jquery.min.js"></script> --%>   
    <script src="../Services/service.js"></script>
    <script src="Js/tasks.js"></script>
    <script>

        jQuery(document).ready(()=> {

            new Tasks().GetTasks();

        });



    </script>

    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <input type="hidden" id="hdRecordid" />
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Task Management</h2>
                </div>
                <div class="body">




                    <%--<form id="form_validation">--%>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="taskName" id="txttaskName" required>
                                <label class="form-label">Task Name</label>
                            </div>
                        </div>


                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="gitUrl" id="txtgitUrl" required>
                                <label class="form-label">Github Url</label>
                            </div>
                        </div>
                        <%--<div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="txtDate" id="txtDate" required>
                                <label class="form-label">Date</label>
                            </div>
                        </div>--%>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="txttimetaken" id="txttimetaken" required>
                                <label class="form-label">Time Taken in minutes</label>
                            </div>
                        </div>

                      


                        <button class="btn btn-primary waves-effect"   onclick="new Tasks().SaveTask();">SUBMIT</button>



                    <%--</form>--%>


                </div>
                <!-- body -->
            </div>
        </div>

    </div>


    <div class="row clearfix">

        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <div class="card">

                <div class="header">
                    <h2>Tasks List</h2>
                </div>

                
                <div class="body">


                    <table id="tblTasks" class="table table-bordered table-striped table-hover js-basic-example ">

                    </table>

                    

                </div><!-- body -->


            </div>

        </div>
    </div>
    

    


    



</asp:Content>
