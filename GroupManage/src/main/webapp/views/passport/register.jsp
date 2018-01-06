<%--
  Created by IntelliJ IDEA.
  User: Monster
  Date: 2017/11/17
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>


    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <!-- Place logo.png and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="/resources/logo.png">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>


    <link rel="stylesheet" type="text/css" href="/resources/bootstrap-3.3.7/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/Animate/animate.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css">


</head>
<body class="style-2">

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <ul class="menu">
                <li class="notice"></li>

            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">


            <!-- Start Sign Up Form -->
            <!--<form action="/passport/signup" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" method="post">-->
            <form action="javascript:void(null);" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" id="form-register">
                <h2>Register</h2>
                <div class="form-group">
                    <div class="form-notice">
                        <!--<div class="alert alert-success" role="alert">Your info has been saved.</div>-->
                        <!--<div class="alert alert-info" role="alert">Your info has been saved.</div>-->
                        <!--<div class="alert alert-warning" role="alert">Your info has been saved.</div>-->
                        <!--<div class="alert alert-danger" role="alert">Your info has been saved.</div>-->
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="sr-only">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Name" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="re-password" class="sr-only">Re-type Password</label>
                    <input type="password" class="form-control" id="re-password" placeholder="Re-type Password" autocomplete="off" required>
                </div>
                <div class="form-group">
                    <label for="remember"><input type="checkbox" id="remember"> Remember Me</label>
                </div>
                <div class="form-group">
                    <p>Already registered? <a href="/Passport/Login">Login</a></p>
                </div>

                <div class="form-group">
                    <input id="submit" type="submit" value="Sign Up" class="btn btn-primary">
                </div>
            </form>
            <!-- END Sign Up Form -->



        </div>
    </div>
    <div class="row" style="padding-top: 60px; clear: both;">
        <div class="col-md-12 text-center">
            <p>
                <a href="https://gitee.com/GuangZongYaoZu/GroupManage"><small>&copy; 光宗耀组</small></a>
            </p>
        </div>
    </div>
</div>

</body>
</html>

<script src="/resources/jquery/jquery-3.2.1.js"></script>
<script src="/resources/plugins/backstretch/jquery.backstretch.min.js"></script>
<script>
    $(function () {
        $.backstretch("/resources/images/backgroundImg.jpg");
        var check = false;
        var name;
        var email;
        var password;
        var rePassword;

        var fromSignup = $('#form-register');
        $('#name').blur(function () {
            name = $.trim($('#name').val());
            if (name.length > 20) {
                $('.form-notice').html('<div class="alert alert-danger" role="alert">Your name is too long.</div>');
                check = false;
                return false;
            }
            check = true;
        });


        $('#email').blur(function () {
            email = $.trim($('#email').val());
            if (email.length > 0) {
                $.ajax('/Passport/CheckUserForm', {
                    data: {
                        email: email,
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == 0) {
                            $('.form-notice').html('<div class="alert alert-danger" role="alert">Email is invalid or already taken.</div>');
                            check = false;
                            return false;
                        }else {
                            $('.form-notice').html('');
                            check = true;
                        }
                    },
                    error: function () {
                    }
                });
            }
        });

        fromSignup.submit(function (event) {
            password = $.trim($('#password').val());
            rePassword = $.trim($('#re-password').val());
            if (!check) {
                return false;
            } else if (password !== rePassword) {
                $('.form-notice').html('<div class="alert alert-danger" role="alert">Passwords does not match.</div>');
                return false;
            } else {
                $.ajax('/Passport/RegisterForm', {
                    data: {
                        name: name,
                        email: email,
                        password: password,
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == 0) {
                            $('.form-notice').html('<div class="alert alert-success" role="alert">Sign up was successful.</div>');
                            location.href = "/Passport/Login";
                            header('Content-Type: text/html; charset=utf-8');
                        }
                    },
                    error: function () {
                        $('.form-notice').html('<div class="alert alert-danger" role="alert">Sign up has failed.</div>');
                    }
                });
            }
        });

    })
</script>