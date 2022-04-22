<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="css/Stock.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<title>學習經歷</title>
</head>
<body style="background-image: url('image/background.jpg');background-repeat: no-repeat;background-attachment:fixed;background-position: center;background-size: cover;overflow:scroll;margin:0 auto;">
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
               <div class="col-sm-10">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="selectnum" onchange="print();">
                    <option>請選擇公司</option>
                    <option value="3481">群創</option>
                    <option value="2303">聯電</option>
                    <option value="2603">萬海</option>
                    <option value="4976">佳凌</option>
                  </select>
                  <br>
                  <br>
                  
                     <div id="tab-demo">
                      <ul class="tab-title">
                        <li><a href="#tab01">收盤價</a></li>
                        <li><a href="#tab02">最高價</a></li>
                        <li><a href="#tab03">最低價</a></li>
                        <li><a href="#tab04">開盤價</a></li>
                      </ul>
                      <div id="tab01" class="tab-inner" >
                        <canvas id="myChart" style="width:80%;height:60%;"></canvas>
                      </div>
                      <div id="tab02" class="tab-inner">
                        <canvas id="myChart2" style="width:80%;height:60%;"></canvas>
                      </div>
                      <div id="tab03" class="tab-inner">
                        <canvas id="myChart3" style="width:80%;height:60%;"></canvas>
                      </div>
                      <div id="tab04" class="tab-inner">
                        <canvas id="myChart4" style="width:80%;height:60%;"></canvas>
                      </div>
                     </div>
                     
                    <!--  <canvas id="myChart"></canvas>--> 
                  </div>
               </div>
             </div>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
     <script src="js/jquery-3.6.0.min.js"></script>
     <script charset="UTF-8" src="js/javascript.js"></script>
     <script charset="UTF-8" src="js/initialstockcanvas.js"></script>
</script>
</body>
</html>