<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
    String user = null;
    try {
        user = (String) session.getAttribute("username");
    } catch (Exception e) {
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Video Wave Streaming</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />


        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>


        <script type="text/javascript" src="jquery.min.js"></script>



    </head>

    <body style="margin:0px 0px 0px 0px" >
        <%            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            Class.forName(JDBC_DRIVER);
            Connection conn = null;
            conn = DriverManager.getConnection(DB_URL, USER, PSW);

            String msg = "";
            //String uname=request.getParameter("username");
            Statement stmt = null;
            ResultSet rs = null;
            //int result;
            stmt = conn.createStatement();
            String USER_NAME = request.getParameter("username");
            String PASSWORD = request.getParameter("password");
            String submit = request.getParameter("submit");
            //Class.forName("com.mysql.jdbc.Driver");
            //out.println(submit);	
            String sql = "select * from v_userinfo where username='" + USER_NAME + "' and password='" + PASSWORD + "'";
            rs = stmt.executeQuery(sql);
            try {
                if (submit.compareTo("submit") == 0) {
                    if (rs != null && rs.next()) {
                        String username = rs.getString("username");
                        int userid = rs.getInt("id");
                        session.setAttribute("username", username);
                        session.setAttribute("userid", userid);
                        //msg="success";
                        response.sendRedirect("index.jsp");
                    } else {
                        msg = "<font color='red'>Enter valid Information</font>";
                    }
                }
            } catch (Exception e) {
            }
            rs.close();
            stmt.close();

        %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 0px"  >
            <tr>
                <td style="width:130px;">
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>			<h2 style="float:right">ideo</h2>

                </td>
                <td>
                    <form action="search2.jsp" method="post" id="search"> 
                        <table>
                            <tr>
                                <td>

                                    <input type="text" name="search" placeholder="Search..." />
                                </td>
                                <td>
                                    <!-- <select name="category" id="category" style="height:22.9px">-->
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
                                    <input type="submit" value="Search" name="search" class="myButton"/>
                                </td>

                            </tr>
                        </table>    	

                    </form>      
                </td>
                <%
                    if (user != null) {
                %>		
                <td align="center" style="vertical-align:top;margin-left:130px;color:#060 ">
                    <b>Welcome <%=user%></b>
                </td>	
                <td align="center" style="vertical-align:top;margin-left:130px;">
                    <a href="logout.jsp" style="color: red">Log Out</a>

                </td>

                <%
                    }
                %>	
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td colspan="2">
                    <ul class="glossymenu">
                        <li class="current"><a  href="index.jsp"><b>Home</b></a></li>
                        <li><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
                        <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                        <li><a href="myAccount.jsp"><b>My Account</b></a></li>
                        <li><a href="contact.jsp"><b>Contact us</b></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td width="800px" style="vertical-align:top">

                    <%
                        Statement stmt2 = null;
                        ResultSet rs2 = null;
                        stmt2 = conn.createStatement();

                        Statement stmt1 = null;
                        ResultSet rs1 = null;
                        stmt1 = conn.createStatement();

                        String sql2 = "SELECT * FROM  v_category";
                        rs2 = stmt2.executeQuery(sql2);
                        while (rs2.next()) {
                            int categoryid = rs2.getInt("id");
                            String categoryname = rs2.getString("categoryname");
                            out.println("<table border='0' width='700px' height='20px'><tr><td style='border-bottom:1px solid #ccc;color:#3e7327'><a style='color:#f24437' href=\"categoryvideo.jsp?cid=" + categoryid + "\" ><h3>" + categoryname + " </h3></a></td></tr></table><table border='0'><tr>");

                            String sql1 = "SELECT * FROM v_vidiodetail where categoryid=" + categoryid + " order by id limit 5";
                            rs1 = stmt1.executeQuery(sql1);

                            while (rs1.next()) {

                                int vid = rs1.getInt("id");
                                String title = rs1.getString("title");
                                String description = rs1.getString("description");
                                String thumbnail = rs1.getString("thumbnail");
                                String thumb = "video//image//" + thumbnail;
                    %>
                    <td>

                        <a href="play.jsp?vid=<%=vid%>&category=<%=categoryid%>" style="float:left">
                            <img src=<%=thumb%> width="200" height="150" />

                        </a>
                        <h4 style="float:bottom;color:#060"><%=title%></h4>




                    </td>

                    <%

                            }
                            out.println("</tr></table>");

                        }
                    %>      

                </td>
                <td style="vertical-align:top">
                    <%
                        try {

                            if (user == null) {

                    %> 
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
                                    <td><!--<input type="text" name="username" id="username" style="width:135px"/>-->
                                        <input type="text" name="username" id="text1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: #c62d1f;">Password</td>
                                    <td>:-</td>
                                    <td><!--<input type="password" name="password"  id="password" style="width:135px"/>-->
                                        <input type="password" name="password"  id="text1"/>
                                    </td>
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
                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>	     
                </td>
            </tr>
        </table>
                <div style="background-size: 50px;background-color: #AEA697">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>

                
    </body>
</html>
