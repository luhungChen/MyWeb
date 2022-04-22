
function login_confirm()
 {
  	$.ajax({
          type: 'POST',
          url: 'checkpassword',
          async: true,
          data: {"account":$("#account").val(),"password":$("#password").val()},
          success: (data) => {
          	if(data.split("_")[0]=="success")
          	{
          		document.getElementById("account_ver").value = data.split("_")[1];
          		$('#submitform').submit();
          	}
          	else if(data=="Novalidate")
          	{
          	   alert("此帳密尚未激活!!");
          	}else
          	{
          	   alert("無此帳密!!");
          	}
          }
      });
  }

  function enterurl(path)
  { 
	$("#Forms").attr("action",path);
	$("#Forms").submit();
  }

  function register_confirm()
  {
	$.ajax({
        type: 'POST',
        url: 'registeraccount',
        async: true,
        data: {"account":$("#account").val(),"password":$("#password").val(),"email":$("#email").val()},
        success: (data) => {
        	if(data=="success")
          	{
          		alert("註冊成功 請幾分鐘後 到信箱進行開通帳號手續 !!");
          	}else if(data="sameaccount")
          	{
          		alert("此帳號已使用過!!");
          	}else
          	{
          		alert("系統錯誤!!");
          	}
        }
    });
   }
  
  $(function(){
	    var $li = $('ul.tab-title li');
	        $($li. eq(0) .addClass('active').find('a').attr('href')).siblings('.tab-inner').hide();
	    
	        $li.click(function(){
	            $($(this).find('a'). attr ('href')).show().siblings ('.tab-inner').hide();
	            $(this).addClass('active'). siblings ('.active').removeClass('active');
	        });
	    });
  function print()
  {
 	 makepicture(chart1,"myChart","#收盤價");
 	 makepicture(chart2,"myChart2","#最高價");
 	 makepicture(chart3,"myChart3","#最低價");
 	 makepicture(chart4,"myChart4","#開盤價");
  }
  function makepicture(chart,id,title)
  {
 	 $.ajax({
          type: 'POST',
          url: 'stockdata',
          async: true,
          data: {"company":document.getElementById("selectnum").value},
          success: (datafromajax) => {
         	  var datass="";
         	  if(title=="#收盤價")
         	  {
                  datass =datafromajax.split("||")[0].split(",");
         	  }
         	  else if(title=="#最高價")
              {
         		datass =datafromajax.split("||")[1].split(",");

           
              }
         	  else if(title=="#最低價")
         	  {
         		 datass =datafromajax.split("||")[2].split(",");
         		x =datafromajax.split("||")[2].split(",");
         		x.sort();
         		alert(x[0]);
         	  }
         	  else if(title=="#開盤價")
         		 datass =datafromajax.split("||")[4].split(",");
               var labelss=datafromajax.split("||")[3].split(",");
               
               var dataObject = {
                       labels: labelss,
                       datasets: [{
                           label: title,
                           data: datass,
                           backgroundColor: chartColors.blue,
                           borderColor: chartColors.blue,
                           pointHoverBackgroundColor:chartColors.yellow
                       }]          
                   };
               chart.data = dataObject;
               chart.update();
          }
      });	 
    
  }


