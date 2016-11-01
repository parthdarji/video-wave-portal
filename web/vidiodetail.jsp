<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

    int uid = 0;
    String username1 = null;
    try {
        uid = (Integer) session.getAttribute("userid");
        username1 = (String) session.getAttribute("username");
    } catch (Exception e) {
    }
    //int vid=Integer.parseInt(request.getParameter("vid"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Upload Video Detail</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />

        <script src="includes/swfobject.js" type="text/javascript"></script>

        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>


        <script type="text/javascript" src="jquery.min.js"></script>



    </head>

    <body style="margin:0px 0px 0px 0px">
        <%
            try {
                String uname = (String) session.getAttribute("username");

                if (uname == null) {
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
            }
            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            Connection conn = null;
            Statement stmt = null;
            Statement stmt1 = null;
            int id = 0;
            ResultSet rs = null;
            ResultSet rs1 = null;
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();

            try {
                String USER_NAME = request.getParameter("username");
                String PASSWORD = request.getParameter("password");
                String sub = request.getParameter("submit");

                int subid = 0;
                String title = "";
                int categoryid = 0;
                String vidiopath = "";
                String description = "";
                int phoneno = 0;

                title = request.getParameter("title");
                description = request.getParameter("description");
                String insert = request.getParameter("next");
                categoryid = Integer.parseInt(request.getParameter("category"));
                java.util.Date javaDate = new java.util.Date();
                long javaTime = javaDate.getTime();
                java.sql.Date sqlDate = new java.sql.Date(javaTime);
                java.sql.Time sqlTime = new java.sql.Time(javaTime);
                java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(javaTime);

                int userid = (Integer) session.getAttribute("userid");
                if (insert.compareTo("next") == 0) {
                    String sql2 = "insert into v_vidiodetail(categoryid,userid,title,description,date,time) values(" + categoryid + "," + userid + ",'" + title + "','" + description + "','" + sqlDate + "','" + sqlTime + "')";
                    out.println("insert successfully");
                    stmt.executeUpdate(sql2);
                    response.sendRedirect("upload.jsp");
                }
                stmt.close();
                rs.close();

            } catch (Exception e) {
            }

        %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 0px">
            <tr>
                <td style="width:130px;">
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>			<h2 style="float:right">ideo</h2>

                </td>
                <td>
                    <form action="search2.jsp" method="post" id="search">
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
                <%
                    if (username1 != null) {
                %>		
                <td align="center" style="vertical-align:top;margin-left:130px;color:#060">
                    <b>welcome <%=username1%></b>
                </td>	
                <td align="center" style="vertical-align:top;margin-left:130px">
                    <a href="logout.jsp" style="color: red">Log Out</a>
                </td>

                <%
                    }
                %>	

            </tr>
        </table>
        <ul class="glossymenu">
            <li><a href="index.jsp"><b>Home</b></a></li>
            <li class="current"><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
            <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
            <li><a href="myAccount.jsp"><b>My Account</b></a></li>
            <li><a href="contact.jsp"><b>Contact us</b></a></li>
        
        </ul>
        <form name="vidioform" method="post"  action="vidiodetail.jsp" >
            <table border="0" align="center" style="margin:10px auto;border-bottom:1px solid #999;border-right:1px solid #999;border-left:1px solid #999" cellpadding="5" cellspacing="0">
                <tr>
                    <th style="background:url(images/menuo_login.GIF) repeat-x;color:#FFF">
                        Create Your Listing
                    </th>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellspacing="5" cellpadding="0">
                            <tr>
                                <td colspan="2" style="color:#666"><b>Step 1 :  Write your title which you want to display</td></b>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input name="title" id="title" type="text" class="tb6"/></td>

                            </tr>
                            <tr>
                                <td colspan="2" style="color:#666"><b>Step 2 :  Select a category</b></td>
                            </tr>
                            <tr>	
                                <td colspan="2" style="color:#666"><b>Select category:</b>
                                    <select name="category" id="category" class="tb6">
                                        <option value=""></option>
                                        <%
                                            String sql1 = "select * from v_category";
                                            rs1 = stmt1.executeQuery(sql1);
                                            while (rs1.next()) {
                                        %>   
                                        <option value="<%=rs1.getInt(1)%>"><%=rs1.getString(2)%></option>					
                                        <%
                                            }
                                        %>	                				
                                    </select>
                                </td>

                            </tr>

                            <tr>
                                <td colspan="2" style="color:#666"><b>Step 3 : Describe the vidio detail which you want to shown</b></td>
                            </tr>

                            <tr>
                                <td colspan="0" style="color:#666"><b>Description:</b></td>
                                <td>
                                    <textarea name="description" style="width:400px; height:100px" class="tb6"></textarea></td>
                            </tr>

                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" name="next" value="next" class="myButton4"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
                                    
                                    <div style="background-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 160px;">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>
                                    
    </body>
</html>