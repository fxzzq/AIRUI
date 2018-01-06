<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="sun.security.acl.GroupImpl" %>
<%@ page import="glory.entity.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp"%>


<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">任务详情</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span class="glyphicon glyphicon-file"></span> 任务详情 </span>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-1"></div>
                        <div class="col-md-8">

                            <%
                                List<User> userList = (List<User>) request.getAttribute("users");
                                Task task = (Task) request.getAttribute("task");
                                if (task != null) {


                            %>
                            <div style="margin-bottom: 20px;font-weight:bold">任务名</div>
                            <div class="content">
                                <%= task.getName()%>
                            </div>
                            <div style="margin-bottom: 30px"></div>

                            <div style="margin-bottom: 20px;font-weight:bold">任务详情</div>
                            <div class="content">
                                <%= task.getDescription()%>
                            </div>
                            <div style="margin-bottom: 30px"></div>


                            <div style="margin-bottom: 20px;font-weight:bold">发布者</div>
                            <div class="content">
                                <%
                                    for (int j = 0; j < userList.size(); j++) {
                                        User userItem = userList.get(j);
                                        if (userItem.getId() == task.getPostId()) {
                                %>
                                <%= userItem.getName()%>
                                <%}}%>
                            </div>
                            <div style="margin-bottom: 30px"></div>


                            <div style="margin-bottom: 20px;font-weight:bold">接受者</div>
                            <div class="content">
                                <%
                                    for (int j = 0; j < userList.size(); j++) {
                                        User userItem = userList.get(j);
                                        if (userItem.getId() == task.getReceiverId()) {
                                %>
                                <%= userItem.getName()%>
                                <%}}%>
                            </div>
                            <div style="margin-bottom: 30px"></div>

                            <div style="margin-bottom: 20px;font-weight:bold">任务完成情况</div>
                            <div class="content">
                                <%= task.getStatus()%>
                            </div>
                            <div style="margin-bottom: 30px"></div>

                        <%
                            }
                        %>
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





        Core.init();

    });
</script>

</body>

</html>