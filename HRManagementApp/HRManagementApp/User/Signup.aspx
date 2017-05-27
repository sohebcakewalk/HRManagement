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
</head>

<body class="signup-page">

    <div class="signup-box">
        <div class="logo">
            <h3 href="javascript:void(0);" class="animated zoomIn" style="color:#FFF !important">Cakewalk Software Consultancy</h3>
            <small class="animated fadeInLeft" style="text-align: right; padding-right: 16px;">I.T.'s Simple</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_up" method="POST">
                    <div class="msg">Register a new membership</div>

                    <div class="row">
                    <div class="col-md-6" style="margin-bottom: 0px !important;">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="material-icons">person</i>
                            </span>
                            <div class="form-line">
                                <input type="text" class="form-control" name="namefirstname" placeholder="First Name" required autofocus>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6" style="margin-bottom: 0px !important;">
                        <div class="input-group">
                            <%--<span class="input-group-addon">
                                <i class="material-icons">person</i>
                            </span>--%>
                            <div class="form-line">
                                <input type="text" class="form-control" name="namelastname" placeholder="Last Name" required>
                            </div>
                        </div>
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
                    
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">phone</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="namecontact" minlength="10"  placeholder="Contact" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="radio" name="gender" id="male" class="with-gap">
                        <label for="male">Male</label>

                        <input type="radio" name="gender" id="female" class="with-gap">
                        <label for="female" class="m-l-20">Female</label>
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
    <script src="../Lib/Plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core Js -->
    <script src="../Lib/Plugins/bootstrap/js/bootstrap.js"></script>
    <!-- Waves Effect Plugin Js -->
    <script src="../Lib/Plugins/node-waves/waves.js"></script>
    <!-- Validation Plugin Js -->
    <script src="../Lib/Plugins/jquery-validation/jquery.validate.js"></script>
    <!-- Custom Js -->
    <script src="../Lib/Js/admin.js"></script>    
    <script src="../Lib/Js/pages/examples/sign-up.js"></script>     
</body>

</html>