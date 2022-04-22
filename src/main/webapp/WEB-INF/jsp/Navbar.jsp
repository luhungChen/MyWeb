<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
           <%if(session.getAttribute("account_ver")==null){%>
              <span class="navbar-brand"><strong><img class="mb-1 img-fluid" src="image/teemo.jpg"  width="80" height="50">&nbsp; MyWeb</strong></span>
            <%}else{ %>
              <span class="navbar-brand"><strong><img class="mb-1 img-fluid" src="image/teemo.jpg"  width="80" height="50">&nbsp; MyWeb &nbsp; Hi~ <%=session.getAttribute("account_ver") %></strong></span>
            <%} %>
             <div class="navbar-nav ms-auto">
                  <%if(session.getAttribute("account_ver")==null){ %>
                     <a class="nav-link btn btn-outline-primary btn-sm px-4 my-2 my-lg-0 ms-lg-5 text-light" href="Login">登入</a>
                     <a class="nav-link btn btn-outline-primary btn-sm px-4 my-2 my-lg-0 ms-lg-5 text-light" href="Register">註冊新帳號</a>
                  <%}else{ %>
                     <a class="nav-link btn btn-outline-primary btn-sm px-4 my-2 my-lg-0 ms-lg-5 text-light" href="Login">登出</a>  
                  <%}%>  
             </div>
          
        </div>
    </nav>
</body>
</html>