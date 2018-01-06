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
    <title>Login</title>
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


            <!-- Start Forgot Password In Form -->
            <form action="javascript:void(null);" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" id="form-forgot" >
                <h2>Forgot Password</h2>
                <div class="form-group">
                    <div class="form-notice">

                    </div>
                    <%--<div class="alert alert-success" role="alert">Your email has been sent.</div>--%>
                </div>
                <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email" autocomplete="off">
                </div>
                <div class="form-group">
                    <p><a href="/Passport/Login">Login </a> or <a href="/Passport/Register"> Register</a></p>
                </div>
                <div class="form-group">
                    <input type="submit" value="Send Email" class="btn btn-primary">
                </div>
            </form>
            <!-- END Forgot Password In Form -->



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
        var fromSignin = $('#form-forgot');
        var check = false;
        var email;

        $('#email').blur(function () {
            email = $.trim($('#email').val());
            if (email.length > 0) {
                $.ajax('/Passport/GetUser', {
                    data: {
                        email: email,
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
//                        alert(data.code)
                        if (data.code == 102) {
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

        fromSignin.submit(function (event) {
            email = $.trim($('#email').val());

            if (check) {
                $.ajax('/Passport/ForgotForm', {
                    data: {
                        email: email,

                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == 0) {
                            $('.form-notice').html('<div class="alert alert-success" role="alert">Your email has been sent.</div>');
                            location.replace('/Passport/Login');
                        }else {
                            $('.form-notice').html('<div class="alert alert-danger" role="alert">Failed to add message.</div>');
                        }
                    },
                    error: function () {
                        $('.form-notice').html('<div class="alert alert-danger" role="alert">Failed to add message.</div>');
                    }
                });
            }

        });

    })
</script>
