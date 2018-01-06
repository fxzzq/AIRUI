<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="glory.entity.ProgramDetails" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/simplemde/simplemde.min.css">

<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">打分页面</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span class="glyphicon glyphicon-file"></span> 打分页面 </span>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div style="text-align: center;font-family: '微软雅黑 Light';font-size: large">打分页面</div>
                            <form action="javascript:void(null)">
                                <div class="form-notice"></div>
                                <div class="form-group">

                                    <%
                                        ProgramDetails article = (ProgramDetails) session.getAttribute("article");
                                       //ProgramDetails article2 = (ProgramDetails) request.getAttribute("article2");

                                      /*  if (article2 !=null){
                                            request.setAttribute("article3", article2);
                                        }*/
                                    %>


                                    <label class="control-label">项目名称</label>
                                    <input id="programname" name="title" disabled="disabled"  type="text" class="form-control" autocomplete="off" value="<% if(article!=null){%><%=article.getProgramname()%> <%}%>" required="">
                                    <label class="control-label">组名</label>
                                    <input id="groupname" name="title" disabled="disabled"  type="text" class="form-control" autocomplete="off" value="<% if(article!=null){%><%=article.getGroupname()%> <%}%>" required="">

                                </div>

                                <div class="form-group">
                                    <label class="article-content">评分指标</label>
                                 <%--   <textarea id="article-content" name="content" required=""><% if(article!=null){%><%=article.getContent()%><%}%></textarea>--%>

                                    <table  class="table table-hover">
                                        <thead></thead>
                                        <tbody>
                                        <tr>
                                            <td nowrap="">系统功能
                                                <select class="multiselect" id="sysfun" style="float:right" >
                                                     <option value='10' selected="selected">10</option>
                                                    <option value="20">20</option>
                                                    <option value="30">30</option>
                                                    <option value="40">40</option>
                                                    <option value="50">50</option>
                                                    <option value="60">60</option>
                                                    <option value="70">70</option>
                                                    <option value="80">80</option>
                                                    <option value="90">90</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="">技术难度
                                                <select class="multiselect"  id="sysfun2" style="float:right" >
                                                    <option value='10' selected="selected">10</option>
                                                    <option value="20">20</option>
                                                    <option value="30">30</option>
                                                    <option value="40">40</option>
                                                    <option value="50">50</option>
                                                    <option value="60">60</option>
                                                    <option value="70">70</option>
                                                    <option value="80">80</option>
                                                    <option value="90">90</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td nowrap="">整体性能
                                                <select class="multiselect" id="sysfun3" style="float:right" >
                                                    <option value='10' selected="selected">10</option>
                                                    <option value="20">20</option>
                                                    <option value="30">30</option>
                                                    <option value="40">40</option>
                                                    <option value="50">50</option>
                                                    <option value="60">60</option>
                                                    <option value="70">70</option>
                                                    <option value="80">80</option>
                                                    <option value="90">90</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="">页面设计
                                                <select class="multiselect" id="sysfun4" style="float:right" >
                                                    <option value='10' selected="selected">10</option>
                                                    <option value="20">20</option>
                                                    <option value="30">30</option>
                                                    <option value="40">40</option>
                                                    <option value="50">50</option>
                                                    <option value="60">60</option>
                                                    <option value="70">70</option>
                                                    <option value="80">80</option>
                                                    <option value="90">90</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>


                                <div class="form-group">
                                    <input class=" btn bg-purple pull-right" type="button" id="subBtn" value="确定提交打分">
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
    jQuery(document).ready(function () {
        $('#subBtn').click(function (){
            var programname = $('#programname').val();
            var groupname  =$('#groupname').val();
             /*获取下拉选择的值*/
            var str1 = $("#sysfun option:selected").val();
            var str2 = $("#sysfun2 option:selected").val();
            var str3 = $("#sysfun3 option:selected").val();
            var str4 = $("#sysfun4 option:selected").val();

            var id =<%=article.getId()%>
            if(id!=null){
                   $.ajax('/Marking2/SubmitGradeForm',{
                       data:{
                           programname:programname,
                           groupname:groupname,
                           num2:str2,
                           num3:str3,
                           num4:str4,
                           num1:str1
                       },
                       type:'post',
                       dataType:'json',
                       async:false,
                       success:function (data) {
                           if (data.code == 0) {
                               alert("成功完成打分")
                               location.replace("/Marking/List1");
                           } else {
                               alert("打分失败1")
                           }
                       },
                       error:function () {
                           alert("打分失败2")
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