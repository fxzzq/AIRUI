<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%  

String path = request.getContextPath();  

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  

%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登录</title>
</head>
<body>
    <form id="loginForm" action="<%=basePath%>function?method=userLogin"   
                    class="form_box" method="post" role="form">  
                    <div class="form-group">  
                        <label for="username" style="color:white;">用户名</label>  
                        <input type="text" class="form-control" name="username"  
                               placeholder="用户名由6~12的英文数字组合,第一位必须为字母">  
                    </div>  
                    <div class="form-group">  
                        <label for="password" style="color:white;">密码</label>  
                        <input type="password" class="form-control" name="password"  
                               placeholder="密码由6~12的英文数字组合">  
                    </div>  
                    <div class="form-group">  
                        <h3 id="errorMsg" class="text-danger text-center"><c:out value="${errorMsg}"/></h3>  
                    </div>  
                    <div class="form-group">  
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="登录"/>  
                        <input type="reset" class="btn btn-info btn-lg btn-block" value="重置"/>  
                    </div>  
                </form>  
</body>
</html>