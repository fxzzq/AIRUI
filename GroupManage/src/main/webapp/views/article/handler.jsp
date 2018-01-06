<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page import="glory.entity.Article" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/simplemde/simplemde.min.css">

<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">添加文章</a></li>
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
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div style="text-align: center;font-family: '微软雅黑 Light';font-size: large">添加文章</div>
                            <form action="javascript:void(null)">
                                <div class="form-notice"></div>
                                <div class="form-group">

                                    <%

                                        Article article = (Article) request.getAttribute("article");

                                    %>


                                    <label class="control-label">文章标题</label>
                                    <input id="title" name="title" type="text" class="form-control" autocomplete="off" value="<% if(article!=null){%><%=article.getTitle()%> <%}%>" required="">
                                </div>

                                <div class="form-group">
                                    <label class="article-content">内容</label>
                                    <textarea id="article-content" name="content" required=""><% if(article!=null){%><%=article.getContent()%><%}%></textarea>

                                </div>

                                <%--<div class="form-group">--%>
                                    <%--<label class="control-label">角色</label>--%>
                                    <%--<select class="form-control" id="roleId">--%>
                                        <%--<option value=""></option>--%>

                                        <%--<option value="fff">ddddd</option>--%>

                                    <%--</select>--%>
                                <%--</div>--%>
                                <div class="form-group">
                                    <input class=" btn bg-purple pull-right" type="button" id="subBtn" value="发布文章">
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
<script src="/resources/simplemde/simplemde.min.js"></script>



<!-- Page Plugins -->
<script src="/resources/js/main.js"></script>


<script type="text/javascript">

    var simplemde = new SimpleMDE({
        element: document.getElementById('article-content'),  //textarea的DOM对象
        autoDownloadFontAwesome: true,   //自动下载FontAwesome，设为false为不下载
        styleSelectedText: false,
        spellChecker: false,
         // status: false  //编辑器底部的状态栏
    });


    jQuery(document).ready(function () {

        $('#subBtn').click(function (){

            var title = $('#title').val();

            var text = simplemde.value(),

                content = simplemde.options.previewRender(text);
            var id =<% if(article!=null){%><%=article.getId()%><%}else{%>null<%}%>


            if (title==''||content==''){
                return;
            }else {
               if (id==null){
                   $.ajax('/Article/CreateForm',{
                       data:{
                           title:title,
                           content:content
                       },
                       type:'post',
                       dataType:'json',
                       success:function (data) {
                           if (data.code == 0) {
                               alert("发布成功")
                               location.replace("/Article/List");
                           } else {
                               alert("发布失败")
                           }
                       },
                       error:function () {
                           alert("发布失败")
                       }
                   })
               }else {
                   $.ajax('/Article/EditForm',{
                       data:{
                           id:id,
                           title:title,
                           content:content
                       },
                       type:'post',
                       dataType:'json',
                       success:function (data) {
                           if (data.code == 0) {
                               alert("编辑成功")
                               location.reload();
                           } else {
                               alert("编辑失败")
                           }
                       },
                       error:function () {
                           alert("添加失败")
                       }
                   })
               }


            }

            //
        });


        Core.init();



    });
</script>

</body>

</html>