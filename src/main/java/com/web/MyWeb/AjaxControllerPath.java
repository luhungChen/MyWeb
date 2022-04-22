package com.web.MyWeb;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.datasource.ConnectionHolder;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxControllerPath 
{
	@Autowired
	private JdbcTemplate primaryJdbcTemplate;
	@Autowired
	private JavaMailSender jms;
	
	@PostMapping("/checkpassword")
    public void Login_confirm(HttpServletRequest request,HttpServletResponse response) 
	{
		System.out.println(request.getRemoteAddr());
		System.out.println(request.getHeader("user-agent"));
		
		int result=0;
        try
		  {
        	String sql = "SELECT 1 FROM USER WHERE account=? AND password=?";
            try
            {
            	result = primaryJdbcTemplate.queryForObject(sql,new Object[]{request.getParameter("account"),request.getParameter("password")},java.lang.Integer.class);
            }catch(EmptyResultDataAccessException e)
            {
            	
            }
            PrintWriter writer = null;
		    response.setContentType("text/html;charset=BIG5");
		    if(result==1)
		    {
		    	 result = 0;
		    	 String sql_tmp = "SELECT 1 FROM USER WHERE account=? AND password=? AND status=1";
		    	 try
		         {
		             result = primaryJdbcTemplate.queryForObject(sql_tmp,new Object[]{request.getParameter("account"),request.getParameter("password")},java.lang.Integer.class);
		         }catch(EmptyResultDataAccessException e)
		         {
		            	
		         }
		    	 if(result==1)
		    	 {
		    	     writer = response.getWriter();
			         writer.print("success_"+request.getParameter("account")); 
				     writer.flush();
				     writer.close();
		    	 }else
		    	 {
		    		 writer = response.getWriter();
				     writer.print("Novalidate"); 
					 writer.flush();
					 writer.close(); 
		    	 }
		    }else
		    {
		    	 writer = response.getWriter();
			     writer.print("Noaccount"); 
				 writer.flush();
				 writer.close(); 
		    }
		  }catch(Exception e)
		  {
			  e.printStackTrace();
		  }
    }
	
	@RequestMapping("/registeraccount")
    public void Register_confirm(HttpServletRequest request,HttpServletResponse response) 
	{
		
		String sql = "SELECT 1 FROM USER WHERE account=?";
		int result=0;
		try
        {
            result = primaryJdbcTemplate.queryForObject(sql,new Object[]{request.getParameter("account")},java.lang.Integer.class);
        }catch(EmptyResultDataAccessException e)
        {
           	
        }
		try
		{
		   PrintWriter writer = response.getWriter();
	       response.setContentType("text/html;charset=BIG5");
		   if(result==0)
		   {
			 String encryption_char = "A1BCD2EFGH3IJ9KL4MNOP5QRS6TUVW7XYZ8";
			 String encryption_result="";
			 for(int i=0;i<5;i++)
				 encryption_result+= String.valueOf(encryption_char.charAt((int)((Math.random()*100)%35)));
			 String tm= request.getParameter("account")+encryption_result+request.getParameter("email");
		     MessageDigest digest = MessageDigest.getInstance("SHA-256");
		     byte[] hash = digest.digest(tm.getBytes());
		     StringBuilder hexString = new StringBuilder();
		     for (int i = 0; i < hash.length; i++) {
		            final String hex = Integer.toHexString(0xff & hash[i]);
		            if(hex.length() == 1) 
		              hexString.append('0');
		            hexString.append(hex);
		     }
			 String sql_tmp = "INSERT INTO USER (account,password,email,status,special_encryption) VALUES(?,?,?,?,?)";
		     int num = primaryJdbcTemplate.update(sql_tmp, request.getParameter("account"),request.getParameter("password"),request.getParameter("email"),0,hexString.toString());
		     if(num==1)
		     {
		        writer.print("success"); 
				writer.flush();
				writer.close(); 
		        SimpleMailMessage mailMessage= new SimpleMailMessage();
				mailMessage.setFrom("henrychen0128@gmail.com");
				mailMessage.setTo(request.getParameter("email"));
				mailMessage.setSubject("teemo");
				mailMessage.setText("Hi!! "+ request.getParameter("account")+"\n請點擊下列連結進行開通帳號手續\nhttp://henrychenweb.hopto.org:8001/Validate?account="+hexString.toString());
				jms.send(mailMessage);
		    	
		     }
		   }else
		   {
		     writer.print("sameaccount"); 
			 writer.flush();
			 writer.close(); 
		   }
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	@RequestMapping("/stockdata")
    public void get_stock_data(HttpServletRequest request,HttpServletResponse response) 
	{
		System.out.println(request.getParameter("company"));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		String reStr = "";
		try
		{
		  Date dt=sdf.parse(LocalDate.now().toString().replace("-",""));
		  Calendar rightNow = Calendar.getInstance();
		  rightNow.setTime(dt);
		  reStr = sdf.format(dt);
		  rightNow.add(Calendar.DAY_OF_YEAR,-4);
		  Date dt1=rightNow.getTime();
		  reStr = sdf.format(dt1);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
		  SSLContext ctx = SSLContext.getInstance("TLS");
          ctx.init(new KeyManager[0], new TrustManager[] {new DefaultTrustManager()}, new SecureRandom());
          SSLContext.setDefault(ctx);
          System.out.println("https://www.twse.com.tw/exchangeReport/STOCK_DAY?response=json&date="+reStr+"&stockNo="+request.getParameter("company")+"&_=1634797134546");
          URL url = new URL("https://www.twse.com.tw/exchangeReport/STOCK_DAY?response=json&date="+reStr+"&stockNo="+request.getParameter("company")+"&_=1634797134546");
          HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
          conn.setRequestMethod("GET");
          conn.setHostnameVerifier(new HostnameVerifier() 
          {
			@Override
			public boolean verify(String arg0, SSLSession arg1) {
				// TODO Auto-generated method stub
				return false;
			}
            
          });
          InputStream is =conn.getInputStream();
	      ByteArrayOutputStream baos = new ByteArrayOutputStream();
	      byte[] buffer = new byte[1024];
	      int len = 0;
	      while(-1 != (len = is.read(buffer))){
	          baos.write(buffer,0,len);
	          baos.flush();
	      }
	      JSONObject jo = new JSONObject(baos.toString());
	      String datas = "";
	      String date="";
	      String max = "";
	      String min = "";
	      String startprice = "";
	      String max_num="0";
	      for(int i =0;i<jo.getJSONArray("data").length();i++)
	      {
	    	 
	    	 JSONArray jy = new JSONArray(jo.getJSONArray("data").get(i).toString());
	    	 if(i!=(jo.getJSONArray("data").length()-1))
	    	   datas+=jy.get(6)+",";
	    	 else
	    	   datas+=jy.get(6)+"||";
	    	 if(i!=(jo.getJSONArray("data").length()-1))
		    	   date+=jy.get(0)+",";
		     else
		    	   date+=jy.get(0);
	    	 if(i!=(jo.getJSONArray("data").length()-1))
		    	   max+=jy.get(4)+",";
		     else
		    	   max+=jy.get(4)+"||";
	    	 if(i!=(jo.getJSONArray("data").length()-1))
		    	   min+=jy.get(5)+",";
		     else
		    	   min+=jy.get(5)+"||";
	    	 if(i!=(jo.getJSONArray("data").length()-1))
	    		 startprice+=jy.get(3)+",";
		     else
		    	 startprice+=jy.get(3);
	      }
	      datas += max+min+date+"||"+startprice;
	      System.out.println(datas);
	      PrintWriter writer = response.getWriter();
	      response.setContentType("text/html;charset=BIG5");       
          writer.print(datas); 
 		  writer.flush();
 		  writer.close(); 
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("/validateccount")
    public void validate_confirm(HttpServletRequest request,HttpServletResponse response) 
	{
		try
		{
		  System.out.println(request.getParameter("account"));
		  System.out.println(request.getParameter("password"));
		  System.out.println(request.getParameter("sha256code"));
		  String sql = "UPDATE USER SET STATUS = 1 WHERE account=? AND password=? AND special_encryption=?";
		  int num =0;
          try
          {
        	  num = primaryJdbcTemplate.update(sql, request.getParameter("account"),request.getParameter("password"),request.getParameter("sha256code"));
          }catch(EmptyResultDataAccessException e)
          {
          	  
          }
          PrintWriter writer = response.getWriter();
	      response.setContentType("text/html;charset=BIG5");
          if(num==1)
          {
        	 writer.print("success"); 
 			 writer.flush();
 			 writer.close(); 
          }else
          {
        	 writer.print("failure"); 
  			 writer.flush();
  			 writer.close();  
          }
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
