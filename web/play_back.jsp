<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

    int uid = 0;
    String username1 = null;
    try {
        uid = (Integer) session.getAttribute("userid");
        username1 = (String) session.getAttribute("username");
    } catch (Exception e) {
    }
    int vid = Integer.parseInt(request.getParameter("vid"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />

        <script src="includes/swfobject.js" type="text/javascript"></script>

        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>


        <script type="text/javascript" src="jquery.min.js"></script>
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
                var url = "insertcomment.jsp";
                var comment = document.getElementById("comment").value
                url += "?comment=" + comment + "&uid=<%=uid%>" + "&vid=<%=vid%>";
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    document.getElementById("comment").innerHTML = "";
                }

            }
        </script>

        <script type="text/javascript">
            function showCustomer(str)
            {
                //document.write(<%=vid%>);
                var xmlhttp;
                if (str == "")
                {
                    document.getElementById("txtHint").innerHTML = "";
                    return;
                }
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else
                {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {

                    }
                }
                var url = "insertrating.jsp?rating=" + str + "&vid=" +<%=vid%>
                //document.write(url);
                xmlhttp.open("GET", url, true);
                xmlhttp.send();
            }
        </script>


    </head>

    <body style="margin:0px 0px 0px 0px">
        <%

            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            Class.forName(JDBC_DRIVER);
            Connection conn = null;
            conn = DriverManager.getConnection(DB_URL, USER, PSW);


        %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 0px">
            <tr>
                <td style="width:130px;">
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>			<h2 style="float:right">ideo</h2
                    ></td>
                <td>
                    <form>
                        <table>
                            <tr>
                                <td>
                                    <input type="text" name="search" id="search"  style="width:400px"/>
                                </td>
                                <td>
                                    <select name="category" id="category" style="height:22.9px">
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
                                </td>
                                <td>
                                    <input type="submit" value="search" name="search" id="search" />
                                </td>
                            </tr>
                        </table>    	

                    </form>      
                </td>
                <%
                    if (username1 != null) {
                %>		
                <td align="center" style="vertical-align:top;margin-left:130px">
                    <a href="logout.jsp" style="text-decoration:none">Log Out</a>
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
                        <li><a href="vidiodetail"><b>Upload Video</b></a></li>
                        <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                        <li><a href="myAccount.jsp"><b>My Account</b></a></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td width="800px" style="vertical-align:top">

                    <%
                        int categoryid = Integer.parseInt(request.getParameter("category"));
                        //String uname=request.getParameter("username");
                        Statement stmt = null;
                        ResultSet rs = null;
                        //int result;
                        stmt = conn.createStatement();
                        String sql = "select * from v_vidiodetail where id=" + vid + " and categoryid=" + categoryid + "";
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String path = rs.getString("vidiopath");

                    %>
                    <div id="flvplayer" style="margin:15px 0px 5px 15px"></div>
                    <script type="text/javascript">
                        var so = new SWFObject("mpw_player.swf", "swfplayer", "700", "450", "9", "#000000"); // Player loading
                        so.addVariable("flv", "video/<%=path%>"); // File Name
                        so.addVariable("jpg", "trusted.jpg"); // Preview photo
                        so.addVariable("autoplay", "false"); // Autoplay, make true to autoplay
                        so.addParam("allowFullScreen", "true"); // Allow fullscreen, disable with false
                        //so.addVariable("backcolor","000000"); // Background color of controls in html color code
                        //so.addVariable("frontcolor","ffffff"); // Foreground color of controls in html color code
                        so.write("flvplayer"); // This needs to be the name of the div id
                    </script>
                    <%
                        }
                    %>
                    <form>
                        <table style="margin:0px 0px 0px 15px" border="0">
                            <tr>
                                <th style="vertical-align:top">
                                    Rating
                                </th>
                                <td align="justify">
                                    <input type="radio" name="rating" value="1" onclick="showCustomer(this.value)"/>1
                                    <input type="radio" name="rating" value="2" onclick="showCustomer(this.value)"/>2
                                    <input type="radio" name="rating" value="3" onclick="showCustomer(this.value)"/>3
                                    <input type="radio" name="rating" value="4" onclick="showCustomer(this.value)"/>4
                                    <input type="radio" name="rating" value="5" onclick="showCustomer(this.value)" />5
                                </td>
                            </tr>
                        </table>
                    </form>
                    <form name="comment" method="post">
                        <table border="0" width="700" style="margin:0px 0px 0px 15px" cellpadding="0" cellspacing="0">
                            <tr >
                                <th align="left" style="border-bottom:1px solid #999;">Comment</th>
                            </tr>
                            <tr>
                                <%
                                    if (username1 != null) {

                                %>   	 <td><textarea name="comment" style="width:500px; height:100px;margin-top:10px" id="comment"></textarea></td>
                                    <%         } else {

                                    %>		<td><textarea name="comment" style=" width:500px; height:100px;margin-top:10px" id="comment" readonly>Plz Login</textarea></td>
                                <%             }
                                %>
                            </tr>
                            <tr>
                                <%
                                    if (username1 != null) {

                                %>   	 
                                <td align="center" >
                                    <input type="button" value="Post comment" name="Post comment" id="Post" onclick="showState(this.value)" style="margin-top:5px"/>
                                </td>
                                <%                    } else {

                                %>		
                                <td align="center" >
                                    <input type="button" value="Post comment" name="Post comment" id="Post" style="margin-top:5px" disabled="disabled"/>
                                </td>
                                <%                 }
                                %>
                            </tr>
                        </table>
                    </form>
                    <div>

                    </div>
                </td>
                <td style="vertical-align:top"> 
                    <div style="margin:10px 5px 0px 0px;">
                        <%
                            Statement stmt1 = null;
                            ResultSet rs1 = null;
                            stmt1 = conn.createStatement();
                            String sql1 = "select * from v_vidiodetail where categoryid=" + categoryid + " order by id limit 10";
                            rs1 = stmt1.executeQuery(sql1);
                            out.print("<b>Suggestion</b><table border='0' width='100%' style='margin:0px 0px 0px 0px;border-top:1px solid #ccc;'>");
                            int vid1 = 0;
                            while (rs1.next()) {
                                vid1 = rs1.getInt("id");
                                int categoryid1 = rs1.getInt("categoryid");
                                String title = rs1.getString("title");
                        %>		
                        <tr>
                            <td style="width:100px;">
                                <a href="play.jsp?vid=<%=vid1%>&category=<%=categoryid1%>">
                                    <img src="trusted.jpg" width="100" height="100"/>
                                </a>
                            </td>         
                            <td>
                                <h4 style="float:left;color:#666"><%=title%></h4>
                            </td>
                        </tr> 
                        <%
                            }
                            out.print("</table>");
                        %>
                    </div>	     
                </td>
            </tr>
            <tr>
                <td>
                    <%
                        Statement stmt2 = null;
                        ResultSet rs2 = null;
                        stmt2 = conn.createStatement();
                        String sql2 = "SELECT username,comment FROM v_comment INNER JOIN v_userinfo ON v_comment.userid=v_userinfo.id where v_comment.vid=" + vid;
                        rs2 = stmt2.executeQuery(sql2);
                        out.print("<table border='0' style='margin:0px 0px 10px 15px' cellspacing='5px'>");
                        while (rs2.next()) {
                    %>
                    <tr>
                        <td style=""><%=rs2.getString("comment")%></td>
                    </tr>
                    <tr>
                        <td style="color:#B06126"><%=rs2.getString("username")%></td>
                    </tr>  	            

                    <%
                        }
                    %>   
                    </table> 
                </td>
            </tr>    
        </table>

    </body>
</html>