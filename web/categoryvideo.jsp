<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

    int uid = 0;
    String username1 = null;
    try {
        uid = (Integer) session.getAttribute("userid");
        username1 = (String) session.getAttribute("username");
    } catch (Exception e) {
    }
    //int vid = Integer.parseInt(request.getParameter("vid"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Category Video</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />
        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>
    </head>

    <body style="margin:0px 0px 0px 0px">
        <%
            int count = 0;
            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            //String filePath = context.getInitParameter("file-upload");
            int cid = Integer.parseInt(request.getParameter("cid"));
            Class.forName(JDBC_DRIVER);
            Connection conn = null;
            Statement stmt5 = null;
            Statement stmt6 = null;

            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt5 = conn.createStatement();
            stmt6 = conn.createStatement();

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
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td colspan="2">
                    <ul class="glossymenu">
                        <li class="current"><a href="index.jsp"><b>Home</b></a></li>
                        <li><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
                        <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                        <li><a href="myAccount.jsp"><b>My Account</b></a></li>
                         <li><a href="contact.jsp"><b>Contact us</b></a></li>
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

                        String sql2 = "SELECT * FROM  v_category where id=" + cid;
                        rs2 = stmt2.executeQuery(sql2);
                        while (rs2.next()) {
                            int categoryid = rs2.getInt("id");
                            String categoryname = rs2.getString("categoryname");
                            out.println("<table border='0' width='700px'  height='20px'><tr><td style='border-bottom:1px solid #ccc;color:#3e7327'><a style='color:#f24437' href=\"categoryvideo.jsp?cid=" + categoryid + " \"><h3>" + categoryname + "</h3></a></td></tr></table><table border='0'><tr>");
                            String sql1 = "SELECT * FROM v_vidiodetail where categoryid=" + categoryid + " order by id";
                            rs1 = stmt1.executeQuery(sql1);
                            while (rs1.next()) {
                                int vid = rs1.getInt("id");
                                String title = rs1.getString("title");
                                String thumbnail = rs1.getString("thumbnail");
                                String thumb = "video//image//" + thumbnail;
                                count += 1;

                    %>                                        
                </td>
                <td>

                    <a href="play.jsp?vid=<%=vid%>&category=<%=categoryid%>" style="float:left">
                        <img src=<%=thumb%> width="200" height="150"/>
                    </a>
                    <h4 style="float:bottom;color:#060"><%=title%></h4>
                </td>
                <%
                    if (count >= 5) {
                        count = 0;
                %></tr><tr><td><br /><br /></td></tr><%
                            }
                        }
                        out.println("</tr></table>");
                    }
                %>    

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
