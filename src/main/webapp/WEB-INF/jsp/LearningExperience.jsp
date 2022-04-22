<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="css/LearningExperence.css">
<title>學習經歷</title>
</head>
<body style="background-image: url('image/background.jpg');background-repeat: no-repeat;background-attachment: fixed;background-position: center;background-size: cover;overflow:scroll;">
   <form id="Forms" method='post'>
     <input type='hidden' name = 'account' id='account' value='<%=session.getAttribute("account_ver")%>'/>
   </form>
  
   <%@include file="Navbar.jsp" %>
    <br>
    <div class="container-fluid">
            <div class="row">
               <div class="col-sm-2" style="padding:0px;">
                   <%@include file="Drop.jsp" %>    
               </div>
               <div class="col-sm-10" style="text-align:center;">
                   <div class="container-fluid">
                      <table class="table table-striped">
                          <tr>
                            <td colspan="2"><img src="image/my_picture.jpg" width="300" height="300"></td>
                          </tr>
                          <tr>
                            <td class="form-design">國中</td>
                            <td class="form-design"><%=session.getAttribute("Junior_high_school") %></td>
                          </tr>
                          <tr>
                            <td class="form-design">高中</td>
                            <td class="form-design"><%=session.getAttribute("Senior_high_school") %></td>
                          </tr>
                          <tr>
                            <td class="form-design">大學</td>
                            <td class="form-design"><%=session.getAttribute("University") %></td>
                          </tr>
                          <tr>
                            <td class="form-design">研究所</td>
                            <td class="form-design"><%=session.getAttribute("Graduate_school") %></td>
                          </tr>
                          <tr>
                            <td class="form-design">研究所 指導教授</td>
                            <td class="form-design"><%=session.getAttribute("Graduate_school_thesis_advisor") %></td>
                          </tr>
                        </table>
                   </div>
               </div>
            </div>
     </div>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
     <script src="js/jquery-3.6.0.min.js"></script>
     <script src="js/javascript.js"></script>
</body>
</html>