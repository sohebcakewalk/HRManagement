<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="HRManagementApp.User.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Sign Up | MyApp - Material Design</title>
        

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

<body class="signup-page" >

    <div class="signup-box">
        <div class="logo">
            <h3 href="javascript:void(0);" class="animated zoomIn" style="color:#FFF !important">Cakewalk Software Consultancy</h3>
            <small class="animated fadeInLeft" style="text-align: right; padding-right: 16px;">I.T.'s Simple</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_up">
                    <div class="msg">Register a new membership</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="namesurname" placeholder="Name Surname" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="email" placeholder="Email Address" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" minlength="6" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="confirm" minlength="6" placeholder="Confirm Password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" name="terms" id="terms" class="filled-in chk-col-pink">
                        <label for="terms">I read and agree to the <a href="javascript:void(0);">terms of usage</a>.</label>
                    </div>
                    <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit">SIGN UP</button>
                    <div class="m-t-25 m-b--5 align-center">
                        <a href="Signin.aspx">You already have a membership?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="../Resources/Plugins/jquery/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <!-- Bootstrap Core Js -->
    <script src="../Resources/Plugins/bootstrap/js/bootstrap.js"></script>
    <!-- Waves Effect Plugin Js -->
    <script src="../Resources/Plugins/node-waves/waves.js"></script>
    <!-- Validation Plugin Js -->
    <script src="../Resources/Plugins/jquery-validation/jquery.validate.js"></script>
    <!-- Custom Js -->
    <script src="../Resources/Js/admin.js"></script>    
    <script src="../Resources/Js/pages/examples/sign-up.js"></script> 
    <script src="../app.js"></script>
       <script src="user.js"></script>
    <script src="../Services/service.js"></script>
     <script>
        let objUser = new User();      
         objUser.signUp();
        

    </script>
</body>

</html>