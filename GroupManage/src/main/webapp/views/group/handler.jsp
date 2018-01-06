<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="glory.entity.User" %>
<%@ page import="glory.entity.Group" %>
<%@ page import="java.util.List" %>
<%@ page import="sun.security.acl.GroupImpl" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp"%>

    <section id="content_wrapper">
        <div id="topbar">
            <div class="topbar-left">
                <ol class="breadcrumb">
                    <li class="crumb-active"><a href="#">创建小组</a></li>
                    <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                    <li class="crumb-link"><a href="/">首页</a></li>
                    <%--<li class="crumb-trail">创建小组</li>--%>
                </ol>
            </div>
        </div>
        <div id="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading"><span class="panel-title"> <span class="glyphicon glyphicon-file"></span> 创建小组</span>
                        </div>
                        <div class="panel-body">
                            <form class="cmxform" id="altForm" action="javascript:void(null);">
                                <%
                                    List<Group> groupList = (List<Group>) request.getAttribute("groups");
                                    List<User> userList = (List<User>) request.getAttribute("users");
                                    int filter = (int) request.getAttribute("filter");
                                    if (filter!=0){
                                %>

                                <div class="form-group">
                                    <label class="control-label">要编辑的分组</label>
                                    <select class="form-control" id="editDepart" >
                                        <option value=""></option>
                                        <%
//                                            System.out.print(Integer.parseInt(filter));
//                                            System.out.print(filter);
                                            if (groupList != null) {
                                                for (int i = 0; i < groupList.size(); i++) {
                                                    Group groupItem = groupList.get(i);

                                        %>
                                                  <option value="<%= groupItem.getId()%>" <%if (filter ==groupItem.getId()){%> selected="selected" <%}%> ><%= groupItem.getGroupName()%></option>
                                       <% }}%>

                                    </select>

                                </div>
                                <%--<div class="alert alert-danger">不选择编辑的分组则为添加分组!</div>--%>
                                <%}%>
                                <div class="form-group">
                                    <label class="control-label">小组名称</label>
                                    <input id="name" name="name" type="text" class="form-control" autocomplete="off" <% if (filter == 0){%> required=""  <%}%>>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">组长</label>
                                    <select class="form-control" id="editLeader" REQUIRED>
                                        <option value=""></option>
                                    <%
                                        if (userList != null ) {
                                            for (int i = 0; i < userList.size(); i++) {
                                                User userItem = userList.get(i);
//                                                if (groupList != null) {
//                                                    for (int j = 0; j < groupList.size(); j++) {
//                                                        Group groupItem = groupList.get(j);

                                    %>
                                    <%--<input id="role" name="role" type="text" class="form-control" autocomplete="off" required="">--%>
                                        <%--<option value="<%= userItem.getId()%>" <%if (userItem.getId()==groupItem.getLeaderId()){%> selected="selected" <%}%> ><%= userItem.getId()+". "+userItem.getUsername() %></option>--%>
                                        <option value="<%= userItem.getId()%>"     ><%= userItem.getId()+". "+userItem.getName() %></option>
                                    <%
//                                       }}
                                            }}
                                    %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input class="submit btn bg-purple pull-right" type="submit" id="subBtn" value="Submit">
                                </div>
                            </form>
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


        var submitHandler= $('#altForm');


        submitHandler.submit(function () {
            var name = $('#name').val();
            var grouptId=$('#editDepart').val();
            var leaderId=$('#editLeader').val();

            if (grouptId==null){
           //创建分组
                $.ajax('/Group/CreateGroupForm',{
                    data:{
                        groupName:name,
                        leaderId:leaderId

                    },
                    type:'post',
                    dataType:'json',
                    success:function (data) {

                        if (data.code == 0) {
                            alert("添加成功")
                            location.replace("/Group/List")
                        } else {
                            alert("添加失败")
                        }
                    },
                    error:function () {
                        alert("添加失败")
            }
                })

            }else  {
                //编辑分组
                name = name == '' ? $('#editDepart').find("option:selected").text():name;
                $.ajax('/Group/EditGroupForm',{
                    data:{
                        groupName:name,
                        grouptId:grouptId,
                        leaderId:leaderId
                    },
                    type:'post',
                    dataType:'json',
                    success:function (data) {
                        if (data.code == 0) {
                            alert("编辑成功")
                           location.replace("/Group/List")
                        } else {
                            alert("编辑失败")
                        }
                    },
                    error:function () {
                        alert("编辑失败2222")
//                        location.replace("/Group/List")
                    }
                })

            }
        });

        Core.init();



    });
</script>

</body>

</html>