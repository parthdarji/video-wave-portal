<%@ page import="java.io.*,java.util.*, javax.servlet.*,java.sql.*" %>
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
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Upload Video</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />

        <script language="javascript" type="text/javascript">
            var xmlHttp
            var xmlHttp
            function showState(str) {
                if (typeof XMLHttpRequest != "undefined") {
                    xmlHttp = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp == null) {
                    alert("Browser does not support XMLHTTP Request")
                    return
                }
                var url = "insert_url.jsp";
                url += "?url=" + str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                }

            }
        </script>
    </head>

    <body style="margin:0px 0px 0px 0px">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 0px">
            <tr>
                <td style="width:130px;">
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>			<h2 style="float:right">ideo</h2>

                </td>
                <td>
                    <form action="#" method="post" id="search">
                        <table>
                            <tr>
                                <td>
                                    <input type="text" name="search" placeholder="Search..."/>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <select name="category" class="dropdown-select">
                                            <option value="">Category</option>
                                            <%
                                                ServletContext context = pageContext.getServletContext();
                                                String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
                                                String DB_URL = context.getInitParameter("db_url");
                                                String USER = context.getInitParameter("username");
                                                String PSW = context.getInitParameter("password");
                                                Class.forName(JDBC_DRIVER);
                                                Connection conn = null;
                                                conn = DriverManager.getConnection(DB_URL, USER, PSW);

                                                ResultSet rs3 = null;
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
            <li class="current"><a href="index.jsp"><b>Home</b></a></li>
            <li><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
            <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
            <li><a href="myAccount.jsp"><b>My Account</b></a></li>
        </ul>

        <form name="vidioform" method="post"  action="UploadFile.jsp" enctype="multipart/form-data" >
            <table border="0" align="center" style="margin:10px auto;border-bottom:1px solid #999;border-right:1px solid #999;border-left:1px solid #999" cellpadding="5" cellspacing="0">
                <tr>
                    <th style="background:url(images/menuo_login.GIF) repeat-x;color:#FFF">
                        Upload File
                    </th>
                </tr>     
                <tr>
                    <td>
                        <table border="0" align="center" cellspacing="5">  
                            <tr>
                                <td colspan="2" style="color:#666"><b>Step 2 :  Add a vidio</b></td>
                            </tr>
                            <tr>	
                                <td colspan="2" style="color:#333">Specify file: <input name="path" type="file" id="path" onchange="showState(this.value)" /></td>
                            </tr>

                            <tr>
                                <td colspan="2" align="right"><input type="submit" name="submit" value="submit" id="submitbutton" style="border-left-width: 2px; padding: 1px 13px;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
                
                <div style="background-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 360px;">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>

    </body>
</html>