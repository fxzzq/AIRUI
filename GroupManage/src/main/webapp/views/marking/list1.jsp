<%@ page import="java.util.List" %>
<%@ page import="java.security.Guard" %>
<%@ page import="glory.entity.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp"%>

<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">项目打分管理</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span
                            class="glyphicon glyphicon-file"></span> 项目详情 </span></div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <th style="width:0.1%" nowrap=""></th>
                            <%--<th style="width:1%" nowrap="">ID</th>--%>
                            <th style="width:1%" nowrap="">项目ID</th>
                            <th style="text-align: left;width:1%" nowrap="">项目名称</th>
                            <th style="width:1%" nowrap="">组名</th>
                            <th style="width:1%" nowrap="">得分</th>
                            <th style="width:1%" nowrap="">操作</th>
                            </thead>

                            <tbody>
                            <%


                                List<ProgramDetails> articles = (List<ProgramDetails>) request.getAttribute("articles");
                               List<Marking>         marking = (List<Marking>) request.getAttribute("marking");

                                if (articles != null ) {
                                    for (int i = 0; i < articles.size(); i++) {
                                        ProgramDetails article = articles.get(i);

                                       Marking markings=marking.get(i);



                            %>

                            <tr>
                                <td nowrap="" class="small"><%= i + 1%><img src="" width="50"/></td>
                                <td class="small"><%= article.getId() %></td>
                                <td class="small"><%= article.getProgramname()%></td>
                                <td nowrap class="small"><%= article.getGroupname()%></td>
                                <td nowrap class="small">   <%--<%= "系统功能:"+markings.getSystemfunctiongrade()+" 技术难度:"+markings.getTechdifficultygrade()+" 整体性能:"+markings.getOverallperformancegrade()+" 页面设计:"+markings.getPagelayoutgrade()+" /总分: "+(markings.getSystemfunctiongrade()+markings.getTechdifficultygrade()+markings.getOverallperformancegrade()+markings.getPagelayoutgrade())/4%>--%>
                                 <%--   <% if (markings.getMarkingByProgramId()==null) {%>

                                    <%
                                    }

                                    else{
                                    %>
                                    <%= "系统功能:"+markings.getSystemfunctiongrade()+" 技术难度:"+markings.getTechdifficultygrade()+" 整体性能:"+markings.getOverallperformancegrade()+" 页面设计:"+markings.getPagelayoutgrade()+" /总分: "+(markings.getSystemfunctiongrade()+markings.getTechdifficultygrade()+markings.getOverallperformancegrade()+markings.getPagelayoutgrade())/4%>
                                    <%
                                    }
                                    %>--%>

                                </td>
                                <td nowrap>
                                    <a href="/Marking/Edit1?id=<%= article.getId()%>">
                                        <button type="button" class="btn btn-default btn-xs">打分</button>
                                    </a>

                                </td>
                            </tr>

                            <%
                                    }
                                }
                            %>

                            </tbody>
                        </table>

                        <div>
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

        $('.deleteBtn').click(function () {

            var id = $(this).attr("data-id");

            $.ajax('/Article/DeleteForm', {
                data: {
                    id: id,
                },
                type: 'post',
                datype: 'json',
                success: function (data) {
                    if (data.code == 0) {

                        location.reload();
                    } else {
                        alert("删除失败")
                    }
                },
                error: function () {
                    alert("删除失败")
                }

            });
        });
        Core.init();
    });
</script>

</body>

</html>