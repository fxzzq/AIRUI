<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="glory.entity.User" %>
<%@ page import="glory.entity.Group" %>
<%@ page import="java.util.List" %>
<%@ page import="sun.security.acl.GroupImpl" %>
<%@ page import="glory.entity.Article" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp"%>


<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">文章详情</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span class="glyphicon glyphicon-file"></span> 添加文章 </span>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-1"></div>
                        <div class="col-md-8">

                            <%

                               Article articleDetails = (Article) request.getAttribute("article");
                                if (articleDetails != null) {


                            %>
                            <div style="text-align: center;font-family: '微软雅黑 Light';font-size: large;font-weight:bold"><%= articleDetails.getTitle()%></div>
                            <div style="text-align: right;font-family: '微软雅黑 Light';font-size: large">
                                <%= articleDetails.getarticleByUser().getName()%>
                                <%= articleDetails.getCreateAt()%>
                            </div>
                            <div style="margin-bottom: 20px"></div>
                            <div class="content">
                                <%= articleDetails.getContent()%>
                            </div>

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