<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="HRManagementApp.User.Signin" %>

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
    <link href="../Resources/Css/Roboto.css" rel="stylesheet" />
    <link href="../Resources/Css/MaterialIcons.css" rel="stylesheet" />

    <!-- Bootstrap Core Css -->
    <link href="../Resources/Plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- Waves Effect Css -->    
    <link href="../Resources/Plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->    
    <link href="../Resources/Plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->    
    <link href="../Resources/Css/style.css" rel="stylesheet" />
</head>

<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <h3 href="javascript:void(0);" class="animated zoomIn" style="color:#FFF !important">Cakewalk Software Consultancy</h3>
            <small class="animated fadeInLeft" style="text-align: right; padding-right: 16px;">I.T.'s Simple</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" >
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
                    <div class="row m-t-15 m-b--20">
                        <div class="col-xs-6">
                            <a href="Signup.aspx">Register Now!</a>
                        </div>
                        <%--<div class="col-xs-6 align-right">
                            <a href="ForgotPassword.aspx">Forgot Password?</a>
                        </div>--%>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->    
       <script src="../Resources/Plugins/jquery/jquery.min.js"></script>
    <script  src="https://code.jquery.com/jquery-3.2.1.min.js"  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="  crossorigin="anonymous"></script> 
    <script type="text/javascript">
        var jQuery3 = $.noConflict(true);
    </script>

    <!-- Bootstrap Core Js -->    
    <script src="../Resources/Plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->    
    <script src="../Resources/Plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->    
    <script src="../Resources/Plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->    
    <script src="../Resources/Js/admin.js"></script>    
    <script src="../Resources/Js/pages/examples/sign-in.js"></script>
    <script src="user.js"></script>
    <script src="../Services/service.js"></script>
    <script>
        let objUser = new User();      
        objUser.login();
        

    </script>
</body>


</html>