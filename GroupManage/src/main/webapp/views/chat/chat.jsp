<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="glory.entity.User" %>
<%@ page import="glory.entity.Group" %>
<%@ page import="java.util.List" %>
<%@ page import="sun.security.acl.GroupImpl" %>
<%@ page import="glory.entity.Article" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp" %>

<style type="text/css">

    .room {
        height: 600px;
        line-height: 100px;
        overflow: auto;
        overflow-x: hidden;
        background: rgba(186, 189, 250, 0.15);
        margin-bottom: 20px;
        margin-top: 20px
    }
    .user_info{
        height: 60px;
    }
    .name{
        display:inline;
    }
    .time{
        display:inline;
    }
</style>

<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">聊天室</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span class="glyphicon glyphicon-file"></span> 聊天室 </span>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div style="text-align: center;font-family: '微软雅黑 Light';font-size: large">聊天室</div>

                            <div class="col-md-12 room">
                                <div></div>


                            </div>

                            <form action="javascript:void(null)">
                                <div class="col-md-10">
                                    <input id="message" name="message" type="text" class="form-control"
                                           autocomplete="off" value="" required="">
                                </div>
                                <div class="form-group">
                                    <input class=" btn bg-purple pull-right" type="button" id="subBtn" value="发送消息">
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


</div>
<!-- End #Main -->
<!-- jQuery -->
<script src="/resources/jquery/jquery-3.2.1.js"></script>
<script src="/resources/jquery/jquery_ui/jquery-ui.min.js"></script>
<script src="/resources/bootstrap-3.3.7/js/bootstrap.js"></script>


<!-- Page Plugins -->
<script src="/resources/js/main.js"></script>


<script type="text/javascript">


    jQuery(document).ready(function () {
        var me="";
        <% if (user!=null ) {%>
         me = <%= user.getId()%>
        <%}%>


        setInterval(function (args) {

            var lastMsgTime= $('.time:last').html();

            if ( typeof lastMsgTime == 'undefined' ) {
                lastMsgTime="";
            }
            $.ajax('/Chat/getMessage', {
            data: {
                lastMsgTime: lastMsgTime,
            },
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var str=JSON.parse(data.data);
                if (data.code != 0) {
                    alert("获取历史消息失败")
                }
                var html="";
                for (var i=0;i<str.length;i++){
                    if (me==str[i].chatByUser.id){
                        html+= '<div class="col-md-12  message_item text-right"> ' +
                            '<div class="user_info" ><p class="name">'+str[i].chatByUser.name+'</p> <p class="time">'+str[i].createAt+' </p></div> ' +
                            '<p class="message_content">'+str[i].content+'</p> ' +
                            '</div>';
                    }else {
                        html+= '<div class="col-md-12  message_item"> ' +
                            '<div class="user_info" ><p class="name">'+str[i].chatByUser.name+'</p> <p class="time">'+str[i].createAt+' </p></div> ' +
                            '<p class="message_content">'+str[i].content+'</p> ' +
                            '</div>';
                    }


                }

                $('.room>div:last').append(html)
                // $(".room").scrollTop('50%');

            },
            error: function () {
                alert("获取历史消息失败error")
            }
        })
        },1500);




        $('#subBtn').click(function () {
            var message = $('#message').val();

            if (message == '') {
                return;
            } else {
                console.log(message)

                $.ajax('/Chat/Send', {
                    data: {
                        message: message,
                        user_id:me
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == 0) {
                            alert("添加成功")
                            // location.reload();
                        } else {
                            alert("添加失败")
                        }
                    },
                    error: function () {
                        alert("添加失败")
                    }
                })
            }

            //
        });


        Core.init();


    });
</script>

</body>

</html>