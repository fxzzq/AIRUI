<%@ page import="java.util.List" %>
<%@ page import="java.security.Guard" %>
<%@ page import="glory.entity.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp"%>

    <section id="content_wrapper">
        <div id="topbar">
            <div class="topbar-left">
                <ol class="breadcrumb">
                    <li class="crumb-active"><a href="#">文章列表</a></li>
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
                                class="glyphicon glyphicon-file"></span> 文章列表 </span></div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <th style="width:0.1%" nowrap=""></th>
                                <%--<th style="width:1%" nowrap="">ID</th>--%>
                                <th style="width:1%" nowrap="">文章名称</th>
                                <th style="text-align: left;width:1%" nowrap="">内容</th>
                                <th style="width:1%" nowrap="">作者</th>
                                <%--<th style="width:1%" nowrap="">审批项目管理员账号</th>--%>
                                <th style="width:1%" nowrap="">创建时间</th>
                                <th style="width:1%" nowrap="">操作</th>
                                </thead>

                                <tbody>
                                <%
//

                                    List<Article> articles = (List<Article>) request.getAttribute("articles");
                                    if (articles != null) {
                                        for (int i = 0; i < articles.size(); i++) {
                                            Article article = articles.get(i);

                                %>

                                <tr>
                                    <td nowrap="" class="small"><%= i + 1%><img src="" width="50"/></td>
                                    <%--<td nowrap="" class="small"><%= userItem.getId() %><img src="" width="50"/></td>--%>
                                    <td class="small"><%= article.getTitle() %>
                                    </td>
                                    <td class="small">
                                        <a href="/Article/Details?id=<%= article.getId()%>">
                                          <%if(article.getContent().length()>20){%> <%= article.getContent().substring(0,20)%>....<%}else {%> <%= article.getContent()%><%}%>
                                        </a>
                                    </td>
                                    <%--<td nowrap="">--%>
                                        <%--<select class="multiselect" id="group_<%= userItem.getId()%>">--%>
                                            <%--<%if (userItem.getGroupId()==0) {%> <option value='0' selected="selected"> 没有加入小组 </option>  <%}%>--%>
                                        <%--<% if (groupList != null) {--%>
                                            <%--for (int j = 0; j < groupList.size(); j++) {--%>
                                                <%--Group groupItem = groupList.get(j) ; %>--%>
                                        <%--<option value="<%= groupItem.getId()%>" <% if (userItem.getGroupId() == groupItem.getId()) {%> selected="selected" <%}%> ><%= groupItem.getGroup() %></option>--%>
                                        <%--<%--%>
                                                <%--}--%>
                                            <%--}--%>
                                        <%--%>--%>
                                    <%--</select>--%>
                                    <%--</td>--%>
                                    <%--<td nowrap>--%>
                                        <%--<select class="multiselect" id="role_<%= userItem.getId()%>">--%>
                                            <%--<% if (roleList != null) {--%>
                                                <%--for (int j = 0; j < roleList.size(); j++) {--%>
                                                    <%--Role roleTtem = roleList.get(j); %>--%>

                                            <%--<option value="<%= roleTtem.getId()%>" <% if (userItem.getRoleId() == roleTtem.getId()) {%>--%>
                                                    <%--selected="selected" <%}%> > <%= roleTtem.getRole() %>--%>
                                            <%--</option>--%>

                                            <%--<%--%>
                                                    <%--}--%>
                                                <%--}--%>
                                            <%--%>--%>
                                        <%--</select>--%>
                                    <%--</td>--%>

                                    <td nowrap class="small"><%= article.getarticleByUser().getName()%></td>
                                    <td nowrap class="small"><%= article.getCreateAt()%></td>
                                    <td nowrap>
                                        <a href="/Article/Edit?id=<%= article.getId()%>">
                                            <button type="button" class="btn btn-default btn-xs">编辑</button>
                                        </a>
                                        <button type="button" class="btn btn-default btn-xs deleteBtn"
                                                data-id="<%= article.getId()%>">删除
                                        </button>
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