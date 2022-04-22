<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="icon" href="http://henrymyweb.ddns.net:8001/favicon.ico"/>
<link rel="bookmark" href="http://henrymyweb.ddns.net:8001/favicon.ico" />
<link rel="stylesheet" href="css/Homepage.css">

<title>首頁</title>
</head>
<body style="background-image: url('image/background.jpg');background-repeat: no-repeat;background-attachment: fixed;background-position: center;background-size: cover;overflow:scroll;height:100%">
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
                      <div class="Zi_box_1">
                        <div>
                          <span style="font-family:cursive;color: rgb(255, 255, 255);font-size: 5em;text-shadow: rgb(150, 150, 150) 1px 3px 0px, rgb(171, 168, 168) 1px 13px 5px;">HELLO WORLD</span>
                          <br>
                          <span style="font-family:cursive;color: rgb(255, 255, 255);font-size: 5em;text-shadow: rgb(150, 150, 150) 1px 3px 0px, rgb(171, 168, 168) 1px 13px 5px;">歡迎來到 Luhung 的個人網頁</span>
                          <br>
                          <span style="font-family:cursive;color: rgb(255, 255, 255);font-size: 5em;text-shadow: rgb(150, 150, 150) 1px 3px 0px, rgb(171, 168, 168) 1px 13px 5px;">網站會隨時更新 歡迎常常來參觀</span>
                        </div>                   
                      </div>
                   </div>
                   
               </div>
            </div>
     </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/javascript.js"></script>
<script>
    
</script>
</body>

</html>