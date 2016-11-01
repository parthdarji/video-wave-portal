<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
<%@page import="javax.servlet.http.Cookie"%>

<html>
    <head>
        <title>Insert</title>
    </head>
    <body >
        <%
            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            String msg = "";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();

            String USER_NAME = request.getParameter("username");
            out.println(USER_NAME);
            String PASSWORD = request.getParameter("password");
            String submit = request.getParameter("submit");

            String fname = request.getParameter("fname");
            out.println(fname);
            String lname = request.getParameter("lname");
            String dob = request.getParameter("dob");
            String add = request.getParameter("add");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String country = request.getParameter("country");
            int postalcode = Integer.parseInt(request.getParameter("postalcode"));
            out.println(postalcode);
            String contact = request.getParameter("contact");
            String uname = request.getParameter("username");
            String pass = request.getParameter("password");
            String email = request.getParameter("email");
            String que = request.getParameter("securityq");
            String ans = request.getParameter("securitya");
            String insert = request.getParameter("submit");
            out.println(insert);
            if (insert.equals("submit")) {
                String sql = "insert into v_userinfo(fname,lname,dob,address,city,state,postalcode,country,phoneno,email,username,password,sequrityque,sequrityans) values ('" + fname + "','" + lname + "','" + dob + "','" + add + "','" + city + "','" + state + "','" + postalcode + "','" + country + "'," + contact + ",'" + email + "','" + uname + "','" + pass + "','" + que + "','" + ans + "')";
                stmt.executeUpdate(sql);
                out.println("Success Fully insert Your Form<br>");
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
