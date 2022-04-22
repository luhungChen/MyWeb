<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="css/Loginlayout.css">
<title>開通帳號</title>

</head>
<body style="background-image: url('image/background.jpg');background-repeat: no-repeat;background-attachment: fixed;background-position: center;background-size: cover;overflow:scroll;">
 <main class="form-signin">
     <div class="container">
		<div class="card">
			<div class="card-header">
				<h3>帳號開通</h3>
			</div>
			<div class="card-body">
				<form action="Enter" id="Enter" method="POST">
					<div class="form-floating mb-3">
                      <input type="text" class="form-control" name="account" id="account">
                      <label for="floatingInput">帳號</label>
                    </div>
                    <div class="form-floating">
                      <input type="password" class="form-control" name="password" id="password">
                      <label for="floatingPassword">密碼</label>
                    </div>
                    <br>
                    <div class="form-floating">
                      <button type="button" class="btn btn-secondary w-100" onclick="activer_account();">開通</button>
                    </div>
				</form>
			</div>
	    </div>
     </div>
  </main>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
function activer_account()
{
   $.ajax({
      type: 'POST',
      url: 'validateccount',
      async: true,
      data: {"account":$("#account").val(),"password":$("#password").val(),"sha256code":"<%=session.getAttribute("sha256code")%>"},
      success: (data) => {
    	  if(data=="success")
          {
    		 alert("開通成功!!");
    		 document.location.href="Login";
    	  }else
    	  {
    		 alert("開通失敗!!");  
    	  }
     }
   });
}
</script>
</body>
</html>