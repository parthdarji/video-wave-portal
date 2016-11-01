<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Category</title>
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
                            <tr>
                                <td>
                                    <input type="text" name="search" placeholder="Search..."/>
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


                    <form name="category" method="post"  action="" >
                        <table border="30"  align="left" style="margin-left:400px; margin-top:130px">
                            <tr>
                                <td>
                                    <table border="0" align="center">
                                        <tr>
                                            <td  align="center"><a href="addcategory.jsp"><input name="add" type="button" value="add" class="myButton1" /></a></td>
                                            <td  align="center"><a href="updatecategory.jsp"><input name="update" type="button" value="update" class="myButton1" /></a></td>
                                            <td  align="center"><a href="deletecategory.jsp"><input name="delete" type="button" value="delete" class="myButton1" /></a></td>

                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
                <td style="vertical-align:top"> 
                    <div style="float:right;margin:10px 5px 0px 0px">
                        <form method="post" action="index.jsp">
                            <%=msg%>
                            <table border="0" id="table" cellpadding="5px" cellspacing="0" style="border-left:0px solid #F97720;border-right:0px solid #AEA697;border-bottom:0px solid #F97720">
                                <tr>
                                    <th colspan="3" style="background:url(images/menuo_login.GIF);color:#FFF;height:20px">
                                        Login
                                    </th>
                                </tr>
                                <tr>
                                    <td style="color: #c62d1f;">UserName</td>
                                    <td>:-</td>
                                    <td><input type="text" name="username" id="text1"/></td>
                                </tr>
                                <tr>
                                    <td style="color: #c62d1f;">Password</td>
                                    <td>:-</td>
                                    <td><input type="password" name="password"  id="text1"/></td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <input type="submit" name="submit" value="submit" id="submitbutton" style="border-left-width: 2px; padding: 1px 13px;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <a style="color: red" href="forgot.jsp">Forget Your Password?</a>
                                    </td>     
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <a href="registration.jsp">Registration From</a>
                                    </td>
                                </tr>        	
                            </table>
                        </form>
                    </div>	     
                </td>
            </tr>
        </table>
<div style="background-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 230px;">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>
                            
    </body>
</html>
