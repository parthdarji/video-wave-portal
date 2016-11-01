<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<!--/*<script language="javascript" type="text/javascript">   
 var xmlHttp   
 var xmlHttp 
function showState(str){  
       if (typeof XMLHttpRequest != "undefined"){ 
   xmlHttp= new XMLHttpRequest(); 
       } 
       else if (window.ActiveXObject){ 
   xmlHttp= new ActiveXObject("Microsoft.XMLHTTP"); 
       } 
if (xmlHttp==null){ 
    alert ("Browser does not support XMLHTTP Request") 
return 
}  
var url= "check.jsp"; 
//document.write(user);
//document.write(psw); 
url += "?username="+str+"&password="+str; 
xmlHttp.onreadystatechange = stateChange; 
xmlHttp.open("GET", url, true); 
xmlHttp.send(null); 
} 
 function stateChange(){    
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){    
 document.getElementById("error").innerHTML=xmlHttp.responseText
/* document.write(msg);
 if(msg.match("success"))
	{
		window.location("success.jsp");
	}
 else
 	{
 		//document.getElementById("error").innerHTML=msg
	}*/
 }
}    
</script>*/-->
</head>

<body>
<%
	
	ServletContext context = pageContext.getServletContext();
	String JDBC_DRIVER=context.getInitParameter("jdbc_driver");
	String DB_URL=context.getInitParameter("db_url");
	String USER = context.getInitParameter("username");
	String PSW=context.getInitParameter("password");					
	String msg="";
	//String uname=request.getParameter("username");
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	//int result;
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL,USER,PSW);
	stmt = conn.createStatement();
	String USER_NAME = request.getParameter("username");
	String PASSWORD = request.getParameter("password");
	String submit = request.getParameter("submit");
	Class.forName("com.mysql.jdbc.Driver");
	//out.println(submit);	
	String sql="select * from v_userinfo where username='"+USER_NAME+"' and password='"+PASSWORD+"'";
	rs = stmt.executeQuery(sql);
	try
	{
		if(submit.compareTo("submit")==0)
		{
			if(rs!=null && rs.next())
			{
				String username=rs.getString("username"); 
				int userid=rs.getInt("id");
				session.setAttribute("username",username);
				session.setAttribute("userid",userid);
				//msg="success";
				response.sendRedirect("index.jsp");			
			}
		else
			{
				msg="<font color='red'>Enter valid Information</font>";
			}
		out.println(msg);
		}
	}catch(Exception e){}
	rs.close();
   	stmt.close();
    conn.close();  
	  
%>

<form method="post" action="login.jsp">
<table border="0" id="table">
	<tr>
		<td style="color: #c62d1f;">UserName</td>
		<td>:-</td>
		<td><input type="text" name="username" id="username"/></td>
	</tr>
	<tr>
		<td style="color: #c62d1f;">Password</td>
		<td>:-</td>
		<td><input type="password" name="password"  id="password"/></td>
	</tr>
 	<tr>
		<td colspan="3" align="center"><input type="submit" name="submit" value="submit"></td>
	</tr>
    <tr>
    	<td colspan="3">
        	<a href="forgot.jsp">Forget Your Password?</a>
        </td>     
    </tr>
    <tr>
    	<td colspan="3">
        	<a href="registration.jsp">Registration From</a>
        </td>
    </tr>        	
</table>
</form>
</body>
</html>
