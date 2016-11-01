<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Admin Login</title>
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
            String USER_NAME = (String) request.getParameter("adminname");
            String PASSWORD = (String) request.getParameter("adminpassword");
            String submit = request.getParameter("submit");
            //Class.forName("com.mysql.jdbc.Driver");
            //out.println(submit);
            stmt = conn.createStatement();
            String sql9 = "select * from admin where adminname='" + USER_NAME + "' and adminpassword='" + PASSWORD + "'";
            rs = stmt.executeQuery(sql9);
            try {
                if (submit.compareTo("submit") == 0) {
                    if (rs != null && rs.next()) {

                        String adminame = rs.getString("adminname");
                        session.setAttribute("adminname", adminame);
                        //session.setAttribute("userid", "123456");
                        //msg="success";
                        msg = "";
                        response.sendRedirect("admin.jsp");

                    } else {
                        msg = "<font color='red'>Enter valid Information</font>";
                    }
                }
            } catch (Exception e) {
            }

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
                                    <input type="text" name="search" placeholder="Search..."/>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <select name="category" class="dropdown-select">
                                            <option value="">Category</option>
                                            <%                                            ResultSet rs3 = null;
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
                        <li><a href=""><b>Upload Video</b></a></li>
                        <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                    </ul>
                </td>
            </tr>

            <tr>                
                <td width="800px" style="vertical-align:top">
                    <br /><br />

                    <form method="post"  action="adminmain.jsp" >
                        <%=msg%>
                        <table border="1" align="center" width="80%">
                            <tr>
                                <td>
                                    <h1 style="color:#060" align="center">Admin</h1>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" align="center">
                                        <tr>
                                            <td style="color: #c62d1f;">Admin Name</td>
                                            <td>:-</td>
                                            <td align="center"><input type="text" id="text1" name="adminname" /></td>
                                        </tr>
                                        <tr>
                                            <td style="color: #c62d1f;">Password</td>
                                            <td>:-</td>
                                            <td  align="center"><input type="password" id="text1" name="adminpassword" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="right">
                                                <input type="submit" name="submit" value="submit" id="submitbutton" style="border-left-width: 2px; padding: 1px 13px;"/>
                                            </td>                                            
                                        </tr>
                                        <!--<tr>
                                            <td>
                                                <a href="createadmin.jsp">Click to add admin</a>
                                            </td>
                                        </tr>-->

                                    </table>
                                </td>
                            </tr>
                        </table>

                    </form>    
                </td>
            </tr>
        </table>
                        
                        <div style="background-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 280px;">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>
                        
    </body>
</html>
