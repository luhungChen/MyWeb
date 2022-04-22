<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
                   <div class="accordion" id="accordionExampleOne" >
                       <div class="accordion-item">
                          <h2 class="accordion-header" id="headingOne" style="background-color:#BEBEBE!important;;">
                            <button style="background-color:#BEBEBE;" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" >
                                                          自我簡介
                            </button>
                          </h2>                         
                          <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne">
                             <div class="accordion-body dropdownmenuoption">
                                <%if(session.getAttribute("account_ver")==null){ %>
                                   <a href="Login">學習經歷</a>
                                <%}else{ %>
                                   <a href="javascript:enterurl('LearningExperience')">學習經歷</a>
                                <%} %>
                             </div>
                              <div class="accordion-body dropdownmenuoption">
                                <%if(session.getAttribute("account_ver")==null){ %>
                                   <a href="Login">程式語言專長</a>
                                <%}else{ %>
                                   <a href="javascript:enterurl('ProgramLanguage')">程式語言專長</a>
                                <%} %>
                             </div>
                             <div class="accordion-body dropdownmenuoption">
                                <%if(session.getAttribute("account_ver")==null){ %>
                                   <a href="Login">專案歷程</a>
                                <%}else{ %>
                                   <a href="javascript:enterurl('Project')">專案歷程</a>
                                <%} %>
                             </div>
                          </div>
                       </div>
                    </div>
                    <div class="accordion" id="accordionExampleTwo">
                       <div class="accordion-item">
                          <h2 class="accordion-header" id="headingTwo">
                            <button style="background-color:#BEBEBE;" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" >
                                                           程式作品相關
                            </button>
                          </h2>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingOne">
                             <div class="accordion-body dropdownmenuoption">
                                <strong>Java</strong>
                             </div>
                             <div class="accordion-body dropdownmenuoption">
                                <strong>Python</strong>
                             </div>
                             <div class="accordion-body dropdownmenuoption">
                             <%if(session.getAttribute("account_ver")==null){ %>
                                   <a href="Login">專案歷程</a>
                                <%}else{ %>
                                   <a href="javascript:enterurl('Stock')">(Machine learning) Stock Analyze</a>
                                <%} %>
                                
                             </div>
                          </div>
                       </div>
                    </div>
                    <div class="accordion" id="accordionExampleThree">
                       <div class="accordion-item">
                          <h2 class="accordion-header" id="headingThree">
                            <button style="background-color:#BEBEBE;" class="accordion-button collapsed"  type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                                         自我興趣分享
                            </button>
                          </h2>
                          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingOne">
                             <div class="accordion-body dropdownmenuoption">
                                <strong>鋼彈模型</strong>
                             </div>
                            
                          </div>
                       </div>
                    </div>
</body>
</html>