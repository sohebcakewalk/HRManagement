<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HRManagementApp.Default" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CakeWalk Careers</title>
    <link href="Lib/Plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="Lib/Plugins/bootstrap/css/bootstrap-theme.css" rel="stylesheet" />

    <link href="Lib/Plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
     <script src="Lib/Plugins/jquery-datatable/jquery.dataTables.js"></script>    

    <script src="Services/service.js"></script>
    <script src="User/Js/jobslisting.js"></script>

</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Cakewalk IT</a>&nbsp;
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <%--<li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>--%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <br />
    <br />

    <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Careers </h1>




                    <table id="tblJobslisting" class="table table-bordered table-striped table-hover js-basic-example ">
                    </table>




                </div>
            </div>
        </div>


    

    <!-- jQuery -->
    <script src="Lib/Plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Lib/Plugins/Bootstrap/js/bootstrap.min.js"></script>

    <!-- Scrolling Nav JavaScript -->
    <script src="Lib/Plugins/jquery/jquery.min.js"></script>
    <script src="Lib/Plugins/jquery/scrolling-nav.js"></script>
    <script src="Lib/Plugins/jquery/jquery.easing.min.js"></script>


    <script>

        jQuery(document).ready(function () {

            //  new Tasks().GetTasks();

            //console.log("Document ready");

            new JobListing().GetJobsList();

        });



    </script>



</body>

</html>
