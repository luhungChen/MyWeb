package com.web.MyWeb;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.List;
import java.util.Vector;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.Bean.LearningExper;



@Controller
public class PostControllerPath 
{
	@Autowired
	private JdbcTemplate primaryJdbcTemplate;
	
	@RequestMapping("/Homepage")
    public String welcome(HttpServletRequest request,HttpServletResponse response) 
	{
		
		System.out.println(request.getRemoteAddr());
		System.out.println(request.getHeader("user-agent"));
		HttpSession session = request.getSession();
	    session.setAttribute("account_ver",request.getParameter("account_ver"));
        return "Homepage";
    }
	@RequestMapping("/Login")
    public String login(HttpServletRequest request,HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		session.invalidate();
        return "Login";
    }
	@RequestMapping("/Register")
    public String Register(HttpServletRequest request,HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
        return "Register";
    }
	@RequestMapping("/LearningExperience")
    public String LearningExperience(HttpServletRequest request,HttpServletResponse response) 
	{
		String sql = "SELECT junior_high_school,senior_high_school,university,graduate_school,graduate_school_thesis_advisor FROM learning_experience WHERE account=?";
		List <LearningExper>l=  primaryJdbcTemplate.query(sql, new MyRowMapper(),request.getParameter("account"));
		HttpSession session = request.getSession();
		session.setAttribute("Junior_high_school",l.get(0).getJunior_high_school());
		session.setAttribute("Senior_high_school",l.get(0).getSenior_high_school());
		session.setAttribute("University",l.get(0).getUniversity());
		session.setAttribute("Graduate_school",l.get(0).getGraduate_school());
		session.setAttribute("Graduate_school_thesis_advisor",l.get(0).getGraduate_school_thesis_advisor());
		session.setAttribute("account_ver", request.getParameter("account"));
		return "LearningExperience";
    }
	@RequestMapping("/ProgramLanguage")
    public String ProgramLanguage(HttpServletRequest request,HttpServletResponse response) 
	{
		System.out.println(request.getParameter("account"));
		HttpSession session = request.getSession();
		session.setAttribute("account_ver", request.getParameter("account"));
		return "ProgramLanguage";
    }
	@GetMapping("/Validate")
    public String Validate(HttpServletRequest request,String account) 
	{
		if(account.equals("")||account.length()!=64)
		{
			return "Forbidden";
		}
		HttpSession session = request.getSession();
		session.setAttribute("sha256code", account);
        return "Validate";
    }
	@RequestMapping("/Project")
    public String Project(HttpServletRequest request,HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("account"));
		session.setAttribute("account_ver", request.getParameter("account"));
		return "Project";
    }
	@RequestMapping("/Stock")
    public String Stock(HttpServletRequest request,HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("account"));
		session.setAttribute("account_ver", request.getParameter("account"));
		return "Stock";
    }
}
