<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>User Detail</title>
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
            Statement stmt8 = null;
            Statement stmt9 = null;
            Statement stmt10 = null;

            ResultSet rs = null;
            //int result;
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();
            stmt8 = conn.createStatement();
            stmt9 = conn.createStatement();
            stmt10 = conn.createStatement();
            String USER_NAME = request.getParameter("username");
            String PASSWORD = request.getParameter("password");
            String submit = request.getParameter("submit");

            //else
            //{
            //out.println("data are not inserted");
            //}
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
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>
                    <h2 style="float:right">ideo</h2>
                </td>

                <td>
                    <form name="search"  action="search2.jsp" method="post" id="search">
                        <table>
                            <tr>
                                <td>
                                    <input type="text" name="search" placeholder="Search..." />
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <select name="category" class="dropdown-select">
                                            <option value="">Category</option>
                                            <%                                                ResultSet rs3 = null;
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
                            </tr>
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
                        <li><a href="videodetail.jsp"><b>Upload Video</b></a></li>
                        <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td width="800px" style="vertical-align:top">
                    <table border="0"  align="center" width="100%">
                        <tr>
                            <td colspan="16"><h2 align="center" style="color:#063"><b>Users</b></h2></td>
                        </tr>
                        <tr>
                            <%
                                ResultSet rs4 = null;
                                Statement stmt4 = null;
                                stmt4 = conn.createStatement();
                                String sql4 = "SELECT * FROM  v_userinfo";
                                rs4 = stmt4.executeQuery(sql4);
                            %>
                            <td width="800px" style="vertical-align:top">
                                <table border="1" align="center" width="100%" >                                    
                                    <tr>                                        
                                        <th style="color: #810e05">First_Name</th>
                                        <th style="color: #810e05">Last_Name</th>
                                        <th style="color: #810e05">User_Name</th>
                                        <th style="color: #810e05">Email</th>
                                        <th style="color: #810e05">Phone No.</th>
                                        <th style="color: #810e05">City</th>
                                        <th style="color: #810e05">State</th>
                                        <th style="color: #810e05">Country</th>
                                        <th style="color: #810e05">Delete</th>
                                    </tr>

                                    <%
                                        while (rs4.next()) {
                                    %>
                                    <tr>                                        
                                        <td><%=rs4.getString("fname")%></td>
                                        <td><%=rs4.getString("lname")%></td>
                                        <td><a href="userinfo.jsp?user=<%=rs4.getInt("id")%>" /><%=rs4.getString("username")%></td>
                                        <td><%=rs4.getString("email")%></td>
                                        <td><%=rs4.getString("phoneno")%></td>
                                        <td><%=rs4.getString("city")%></td>
                                        <td><%=rs4.getString("state")%></td>
                                        <td><%=rs4.getString("country")%></td>
                                        <td><a href="delete1.jsp?deleteid=<%=rs4.getDouble("id")%>" />Delete</td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </td>

                        </tr>

                    </table>
                </td>
            </tr>
        </table>
                                
                                  <div style="bbackground-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 150px;">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>
                                
    </body>
</html>
