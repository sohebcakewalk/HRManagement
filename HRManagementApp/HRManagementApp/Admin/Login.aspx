﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HRManagementApp.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <title>Sign In | HR Management</title>
    <!-- Favicon-->
    <!--<link rel="icon" href="../../favicon.ico" type="image/x-icon">-->

    <!-- Google Fonts -->
<%--<link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css" />--%>
    <link href="../Lib/Css/Roboto.css" rel="stylesheet" />
    <link href="../Lib/Css/MaterialIcons.css" rel="stylesheet" />

    <!-- Bootstrap Core Css -->
    <link href="../Lib/Plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- Waves Effect Css -->    
    <link href="../Lib/Plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->    
    <link href="../Lib/Plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->    
    <link href="../Lib/Css/style.css" rel="stylesheet" />
   
    <script src="../Lib/Plugins/bootboxalert/bootbox.min.js"></script>


</head>

<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <h3 href="javascript:void(0);" class="animated zoomIn" style="color:#FFF !important">Cakewalk Software Consultancy</h3>
            <small class="animated fadeInLeft" style="text-align: right; padding-right: 16px;">I.T.'s Simple</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in">
                    <div class="msg">Sign in to start your session</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="username" placeholder="Username" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8 p-t-5">
                            <input type="checkbox" name="rememberme" id="rememberme" class="filled-in chk-col-pink">
                            <label for="rememberme">Remember Me</label>
                        </div>
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-pink waves-effect" type="submit">SIGN IN</button>
                        </div>
                    </div>                    
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->    
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->    
    <script src="../Lib/Plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->    
    <script src="../Lib/Plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->    
    <script src="../Lib/Plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->    
    <script src="../Lib/Js/admin.js"></script>    
    <script src="../Lib/Js/pages/examples/sign-in.js"></script>    
    <script src="Js/adminUser.js"></script>
    <script src="../Services/service.js"></script>
    <script>
        let objAdmin = new AdminUser();
        objAdmin.adminLogin();
    </script>
</body>

</html>
