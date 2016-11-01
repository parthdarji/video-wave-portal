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
        <title>Most Visited Videos</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />


        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>


        <script type="text/javascript" src="jquery.min.js"></script>



    </head>

    <body style="margin:0px 0px 0px 0px">
        <%    ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            String msg = "";
            //String uname=request.getParameter("username");
            Connection conn = null;
            Statement stmt = null;
            Statement stmt1 = null;
            Statement stmt2 = null;
            Statement stmty = null;
            ResultSet rs = null;
            //int result;
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            stmt2 = conn.createStatement();
            stmty = conn.createStatement();
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
                    <%
                        if (user != null) {
                    %>		
                    <td align="center" style="vertical-align:top;margin-left:130px;color:#060">
                        <b>welcome <%=user%></b>
                    </td>	
                    <td align="center" style="vertical-align:top;margin-left:130px">
                        <a href="logout.jsp" style="color: red">Log Out</a>
                    </td>

                    <%
                        }
                    %>	


                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td colspan="2">
                    <ul class="glossymenu">
                        <li><a href="index.jsp"><b>Home</b></a></li>
                        <li><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
                        <li class="current"><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                        <li><a href="myAccount.jsp"><b>My Account</b></a></li>
                        <li><a href="contact.jsp"><b>Contact us</b></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td width="800px" style="vertical-align:top">
                    <table border="0"  align="center" width="100%">
                        <tr>
                            <td colspan="16"><h3 align="center" style="color:#8F2303"><b>Most View Video</b></h3></td>
                        </tr>
                        <tr>
                            <%
                                int count = 0;
                                Statement stm = null;
                                stm = conn.createStatement();
                                String sqk = "select * from v_category";
                                //out.println(sqk);
                                ResultSet rsk = stm.executeQuery(sqk);
                                while (rsk.next()) {
                                    int catid = rsk.getInt("id");
                                    //out.println("cat is is:"+catid);
                                    String catname = rsk.getString("categoryname");
                                    String sqj = "select max(view) from v_vidioview where categoryid='" + catid + "'";
                                    //out.println(sqj);
                                    ResultSet rst = stmt3.executeQuery(sqj);
                                    while (rst.next()) {
                                        int view = rst.getInt(1);
                                        //out.println(view);
                                        Statement stmb = null;
                                        stmb = conn.createStatement();
                                        String sqe = "select * from v_vidioview where view='" + view + "' and categoryid='" + catid + "'";
                                        //out.println(sqe);
                                        ResultSet rsg = stmb.executeQuery(sqe);
                                        while (rsg.next()) {

                                            int rate = rsg.getInt("rate");
                                            int detid = rsg.getInt("vidiodetailid");

                                            //out.println("most view id is:"+detid);
                                            String sql1 = "select * from v_vidiodetail where id='" + detid + "'";
                                            //out.println(sql1);
                                            ResultSet rs1 = stmt1.executeQuery(sql1);
                                            while (rs1.next()) {
                                                count = count + 1;
                                                //out.println("value of count is"+count);
                                                if (count > 4) {
                                                                    //out.println("hi");
                            %>
                        </tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr>

                            <%
                                    count = 0;
                                }
                                int viid = rs1.getInt("id");
                                String title = rs1.getString("title");
                                String dat = rs1.getString("date");
                                String desc = rs1.getString("description");
                                String thumbnail = rs1.getString("thumbnail");
                                String thumb = "video//image//" + thumbnail;
                            %>

                            <td>
                                <a href="play.jsp?vid=<%=viid%>&category=<%=catid%>" style="float:left">
                                    <img src=<%=thumb%> width="200" height="150"/>
                                </a>

                            </td>
                            <td>

                                <div style="margin-bottom:40px"><h2 style="color:#090"><%=title%></h2>
                                </div>
                            </td>

                            <%

                                            }

                                        }
                                    }
                                }
                            %>
                        </tr>
                    </table>

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
                                    <td><input type="text" name="username" id="text1"/></td>
                                </tr>
                                <tr>
                                    <td style="color: #c62d1f;">Password</td>
                                    <td>:-</td>
                                    <td><input type="password" name="password"  id="text1"/></td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <input type="submit" name="submit" value="submit" id="submitbutton" style="border-left-width: 1px; padding: 1px 13px;">
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
                    
                    <div style="background-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 290px;">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>

    </body>
</html>
