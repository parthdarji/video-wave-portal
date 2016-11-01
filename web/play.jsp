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
        <title>Play</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />

        <!-- <script src="includes/swfobject.js" type="text/javascript"></script>-->
        <link href="video-js/video-js.css" rel="stylesheet" type="text/css" />
        <!-- video.js must be in the <head> for older IEs to work. -->
        <script src="video-js/video.js"></script>

        <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
        <script>
            videojs.options.flash.swf = "video/video-js.swf";
        </script>

        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>


        <script type="text/javascript" src="jquery.min.js"></script>
        <script language="javascript" type="text/javascript">
            var xmlHttp = new XMLHttpRequest();
            
            // var xmlHttp;
            function showState(str) {
                if (typeof XMLHttpRequest != "undefined") {
                    xmlHttp = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp == null) {
                    alert("Browser does not support XMLHTTP Request");
                    return;
                }
                var url = "insertcomment.jsp";
                var comment = document.getElementById("comment").value;
                url += "?comment=" + comment + "&uid=<%=uid%>" + "&vid=<%=vid%>";
                xmlHttp.onreadystatechange = function() {
                    /*    if ((xmlHttp.readyState == 4) || (xmlHttp.status == 200)) {
                     //  aler("HIiiiii");
                     
                     document.getElementById("comment_box").innerHTML = xmlHttp.responseText;
                     
                     
                     }*/
                    if (xmlHttp.readyState == 4) {
                        if (xmlHttp.status == 200) {
                            // alert(document.getElementById("comment_box").value);
                            document.getElementById("comment_box").innerHTML = xmlHttp.responseText;
                            document.getElementById("comment_box").style.color = "#8F2303";

                        }
                        else {
                            alert("fail");
                        }

                    }


                };
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
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
                        alert('Thanks for rating');
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
        <table  width="100%" cellpadding="0" cellspacing="0" border="0">
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
                        int categoryid = Integer.parseInt(request.getParameter("category"));
                        //String uname=request.getParameter("username");
                        String thumbnail = null;
                        String thumb = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        //int result;
                        stmt = conn.createStatement();
                        String path = "";
                        String sql = "select * from v_vidiodetail where id=" + vid + " and categoryid=" + categoryid + "";
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            path = rs.getString("vidiopath");
                            thumbnail = rs.getString("thumbnail");
                            thumb = "video//image//" + thumbnail;
                            System.out.println(path);
                            String sql8 = "select * from v_vidioview where vidiodetailid='" + vid + "'";
                            ResultSet rs8 = stmt6.executeQuery(sql8);
                            if (rs8.next()) {
                                int count = rs8.getInt("view");
                                int inc = count + 1;
                                String sql6 = "update v_vidioview set view='" + inc + "' where vidiodetailid='" + vid + "'";
                                stmt6.executeUpdate(sql6);
                    %><!--<b style="color:#6C3"><//%=count%> views </b>-->
                    <%
                    } else {
                        String sql5 = "insert into v_vidioview(vidiodetailid,view,categoryid) values('" + vid + "',1,'" + categoryid + "') ";
                        stmt5.executeUpdate(sql5);
                    %><!--<b style="background-color:#6C3">view : 1 time</b>-->
                    <%
                        }
                    %>

                    <div  style="margin:15px 0px 5px 15px"></div>       
                    <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="625" height="300" poster=<%=thumb%> data-setup="{}">
                        <source src="<%="video/" + path%>" type='video/webm' />
                        <source src="<%="video/" + path%>" type='video/mp4' />
                        <source src="<%="video/" + path%>" type='video/ogg' />
                        <source src="<%="video/" + path%>" type='video/flv' />
                        <source src="<%="video/" + path%>" type='video/3gp' />

                        <!--   <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track>--><!-- Tracks need an ending tag thanks to IE9 -->
                        <!--  <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track>--><!-- Tracks need an ending tag thanks to IE9 -->
                    </video>
                    <div>
                        <h3 style="color: rgb(0, 102, 0); border-left-width: 0px; margin-left: 23px; margin-top: 10px;"><%=rs.getString("title")%></h3>
                        <h4 style="color: rgb(0, 102, 51); margin-left: 26px; margin-top: -20px; margin-bottom: 0px;"><%=rs.getString("description")%></h4>
                        <%   String sql9 = "select * from v_vidioview where vidiodetailid='" + vid + "'";
                            ResultSet rs9 = stmt6.executeQuery(sql9);
                            if (rs9.next()) {
                        %>     

                        <!a style="margin-left: 531px;" href="www.facebook.com" target="_blank"><!img src="images/f1.png"/> <!/a>   
                        <h4 style="margin-left: 562px; margin-top: -20px; color: red; margin-bottom: 1px;"><%=rs9.getInt("view")%> views</h4>

                        <%
                            }
                        %>
                    </div>

                    <!--          <div id="flvplayer" style="margin:15px 0px 5px 15px"></div>
                              <script type="text/javascript">
                                  var so = new SWFObject("mpw_player.swf", "swfplayer", "700", "450", "9", "#000000"); // Player loading
                                  so.addVariable("flv", "video/<//%=path%>"); // File Name
                                  so.addVariable("jpg", "trusted.jpg"); // Preview photo
                                  so.addVariable("autoplay", "false"); // Autoplay, make true to autoplay
                                  so.addParam("allowFullScreen", "true"); // Allow fullscreen, disable with false
                                  //so.addVariable("backcolor","000000"); // Background color of controls in html color code
                                  //so.addVariable("frontcolor","ffffff"); // Foreground color of controls in html color code
                                  so.write("flvplayer"); // This needs to be the name of the div id
                              </script>-->
                    <%
                        }
                    %>
                    <form>
                        <table style="margin:0px 0px 0px 15px;" border="0" width="87%">
                            <tr>
                                <th style="vertical-align:top" align="left" width="11">
                                    <b> Rating</b>
                                </th>
                                <td align="justify">
                                    <input type="radio" name="rating" value="1" onclick="showCustomer(this.value)"/>1
                                    <input type="radio" name="rating" value="2" onclick="showCustomer(this.value)"/>2
                                    <input type="radio" name="rating" value="3" onclick="showCustomer(this.value)"/>3
                                    <input type="radio" name="rating" value="4" onclick="showCustomer(this.value)"/>4
                                    <input type="radio" name="rating" value="5" onclick="showCustomer(this.value)" />5
                                </td>
                                <td style="" align="right">
                                   <!-- <a href="http://localhost:8080/vidio/video/<%=path%>">Download</a>-->

                                    <a href="http://localhost:8084/vidio/video/<%=path%>">Download</a>
                                </td>
                            </tr>
                        </table>
                    </form>

                    <form name="comment" method="POST"  >
                        <table  border="0" width="700" style="margin:0px 0px 0px 15px" cellpadding="0" cellspacing="0">
                            <tr>
                                <th align="left" style="border-bottom:1px solid #999;"><b>Comment</b></th>
                            </tr>
                            <tr>
                                <%
                                    if (username1 != null) {

                                %>   	 <td><textarea name="comment" style="width:500px; height:100px;margin-top:10px" id="comment" onchange="showState(this.value)"></textarea></td>
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
                                    <input type="button" value="Post comment" name="Post comment" id="Post" style="margin-top:5px" onclick="showState(this.value)"  disabled="disabled"/>
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
                            while (rs1.next()) {
                                int vid1 = rs1.getInt("id");
                                int categoryid1 = rs1.getInt("categoryid");
                                String title = rs1.getString("title");
                                thumbnail = rs1.getString("thumbnail");
                                thumb = "video//image//" + thumbnail;
                        %>		
                        <tr>
                            <td style="width:100px;">
                                <a href="play.jsp?vid=<%=vid1%>&category=<%=categoryid1%>">
                                    <img src=<%=thumb%> width="150" height="100"/>
                                </a>
                            </td>         
                            <td>
                                <h4 style="float:left;color:#060"><%=title%></h4>
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

            </tr>



            <%
                Statement stmt2 = null;
                ResultSet rs2 = null;
                stmt2 = conn.createStatement();
                String sql2 = "SELECT username,comment FROM v_comment INNER JOIN v_userinfo ON v_comment.userid=v_userinfo.id where v_comment.vid=" + vid;

                rs2 = stmt2.executeQuery(sql2);
                out.print("<table border='0' style='margin:0px 0px 10px 15px' cellspacing='5px' >");
                while (rs2.next()) {
            %>

            <div id="comment_box" style="width: 520px; padding-left: 23px; border: 2px dashed rgb(76,76,76); background-color: rgba(248,248,248,0.2); margin-top: 15px; ">



                <h4 style="color: #8F2303"> <%=rs2.getString("comment")%></h4>



                <p class="comment-author"><%=rs2.getString("username")%></p>

            </div>
            </br> 


            <%

                }

            %>  


<div style="background-size: 50px;background-color: #AEA697">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>


        </table> 
    </body>
</html>