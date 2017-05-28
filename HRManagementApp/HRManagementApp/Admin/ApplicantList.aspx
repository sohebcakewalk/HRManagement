<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ApplicantList.aspx.cs" Inherits="HRManagementApp.Admin.ApplicantList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <link href="../Lib/Plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">    
    <script src="Js/ApplicantList.js"></script>
    <script src="../Services/service.js"></script>

    <script>

        jQuery(document).ready(function () {
            let objEmpPM = new ApplicantList();
            objEmpPM.GetData();
        });



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Applicant List</h2>
                </div>
                <div class="body">
                    <table id="tblAmpLst" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
