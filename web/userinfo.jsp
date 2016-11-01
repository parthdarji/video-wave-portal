<%-- 
    Document   : userinfo
    Created on : 20 Apr, 2014, 9:57:09 AM
    Author     : Parth
--%>

<%@page import="sun.security.x509.X500Name"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>UserInfo</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />


        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>


        <script type="text/javascript" src="jquery.min.js"></script>



    </head>

    <body style="margin:0px 0px 0px 0px">
        <%

            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            String msg = "";
            //String uname=request.getParameter("username");
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            //int result;
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();
            String USER_NAME = request.getParameter("username");
            String PASSWORD = request.getParameter("password");
            String submit = request.getParameter("submit");
            //Class.forName("com.mysql.jdbc.Driver");
            //out.println(submit);	
            String sql6 = "select * from v_userinfo where username='" + USER_NAME + "' and password='" + PASSWORD + "'";
            rs = stmt.executeQuery(sql6);
            try {
                if (submit.compareTo("submit") == 0) {
                    if (rs != null && rs.next()) {
                        String username = rs.getString("username");
                        int userid = rs.getInt("id");
                        session.setAttribute("username", username);
                        session.setAttribute("userid", userid);
                        //msg="success";
                        response.sendRedirect("home.jsp");
                    } else {
                        msg = "<font color='red'>Enter valid Information</font>";
                    }
                }
            } catch (Exception e) {
            }
            rs.close();
            stmt.close();

        %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 0px">
            <tr>
                <td style="width:130px;">
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>			<h2 style="float:right">ideo</h2>

                </td>
                <td>
                    <form name="search"  action="search2.jsp" method="post" id="search">
                        <table>

                            <td>
                                <input type="text" name="search" placeholder="Search..." />
                            </td>
                            <td>
                                <div class="dropdown">
                                    <select name="category" class="dropdown-select">
                                        <option value="">Category</option>
                                        <%                            ResultSet rs3 = null;
                                            Statement stmt3 = null;
                                            stmt3 = conn.createStatement();
                                            String sql3 = "SELECT * FROM  v_category";
                                            rs3 = stmt3.executeQuery(sql3);
                                            while (rs3.next()) {
                                                int categoryid = rs3.getInt("id");
                                                String categoryname = rs3.getString("categoryname");
                                        %>
                                        <option value="<%=categoryid%>"><%=categoryname%></option>
                                        <%
                                            }
                                        %>		
                                    </select>
                                </div>
                            </td>
                            <td>
                                <input type="submit" value="Search" name="search" class="myButton" />
                            </td>

                        </table>    	

                    </form>      
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td colspan="2">
                    <ul class="glossymenu">
                        <li class="current"><a href="index.jsp"><b>Home</b></a></li>
                        <li><a href=""><b>Upload Video</b></a></li>
                        <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                    </ul>
                </td>
            </tr>
            <tr>

                <td width="800px" style="vertical-align:top">
                    <%
                        String user = request.getParameter("user");
                        int id = Integer.parseInt(user);
                        Statement stmt1 = null;
                        ResultSet rs4 = null;
                        stmt1 = conn.createStatement();
                        rs4 = stmt1.executeQuery("select * from v_vidiodetail where userid='" + user + "'");
                        out.println("<table border='1' width='700px'><th <td style='border-bottom:1px solid #ccc;color:#5b8a3c'><h2>Video Name</h2></th>");
                        while (rs4.next()) {
                            //System.out.println(rs.getInt("user"));
                            String title = rs4.getString("title");
                            out.println("<tr><td style='border-bottom:1px solid #ccc;color:#666'><h3>" + title + "</h3></td></tr>");
                            System.out.println(id);

                        }
                        out.println("</table>");
                    %>
                </td>
            </tr>

        </table>

    </body>
</html>
