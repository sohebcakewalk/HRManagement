<%@ Page Title="" Language="C#" MasterPageFile="~/User/candidateDashboard.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HRManagementApp.User._default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <link href="../Lib/Plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    <%--<script src="../Lib/Plugins/jquery/jquery.min.js"></script> --%>   
    <script src="../Services/service.js"></script>
    <script src="Js/jobslisting.js"></script>

    <script>

        jQuery(document).ready(function () {

            //new Tasks().GetTasks();
            new JobListing().GetJobsList();


        });



    </script>



    <div class="row clearfix">

        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <div class="card">

                <div class="header">
                    <h2>Job Listing</h2>
                </div>


                <div class="body">


                    <table id="tblJobslisting" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                    </table>



                </div>
                <!-- body -->


            </div>

        </div>
    </div>


    <script>

        jQuery(document).ready(function () {

            //  new Tasks().GetTasks();

            //console.log("Document ready");

            new JobListing().GetJobsList();

        });



    </script>

</asp:Content>
