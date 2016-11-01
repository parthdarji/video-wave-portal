<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Forgot PassWord</title>
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
                var url = "getUser.jsp";
                url += "?username=" + str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    document.getElementById("securityque").innerHTML = xmlHttp.responseText
                    document.getElementById("securityque").style.color = "red"

                }

            }
        </script>
    </head>

    <body style="margin:0px 0px 0px 0px">
        <%
            String username = request.getParameter("username");
            String answer = request.getParameter("sequrityans");

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
            </tr>
        </table>
        <ul class="glossymenu">
            <li class="current"><a href="index.jsp"><b>Home</b></a></li>
            <li><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
            <li><a href=""><b>Most Viewed</b></a></li>
            <li><a href="myAccount.jsp"><b>My Account</b></a></li>
        </ul>
<form method="post" action = "password.jsp" style='margin-left: 500px; margin-top: 18px;'>
        <%
            Statement stmt = null;
            ResultSet rs = null;
            String msg = "";

            stmt = conn.createStatement();
            String sql = "select password,id from v_userinfo where username='" + username + "' and sequrityans='" + answer + "'";
            //out.println(sql);
            String u = "";
            rs = stmt.executeQuery(sql);
            if (username != null) {
                try {
                    if (rs.next()) {

                      //  out.println("<form method='post' action = 'password.jsp' style='margin-left: 500px; margin-top: 18px;'> ");
                        u = rs.getString("id");

                       // String psw = rs.getString("password");

                        //  out.print("<b>Your Password is=" + psw + "</b>");
                       
                       out.println("<b>Enter new password</b><input type='password' name='password' value='' class='tb6'/><br/>");
                       out.println("<b>Confirm Password</b><input type='password' name='confirm password'value='' class='tb6'style='margin-left: 12px;'/><br/>");
                       out.println("<input type='submit' name='submit' value='submit' style ='background-color:#b2b8ad'/>");
                         //    out.println("</form>");
                        //  response.setHeader("Refresh", "3;URL=index.jsp");

                    } else {
                        out.println("Enter correct Information");
                    }

                } catch (Exception e) {
                }
                rs.close();
                stmt.close();
            } else {
        %>
        </form>

        <form action="forgot.jsp" method="get">
            <table border="0" align="center" style="margin:10px auto;border-bottom:1px solid #999;border-right:1px solid #999;border-left:1px solid #999" cellpadding="5" cellspacing="0">    	<tr>
                    <th colspan="2"style="background:url(images/menuo_login.GIF) repeat-x;color:#FFF">Enter The Follwing Detail</th>
                </tr>
                <tr>
                    <td>
                        Enter Your Username:
                    </td>
                    <td>
                        <input type="text" name="username" onchange="showState(this.value)" class="tb6"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Your security question is
                    </td>
                    <td>
                        <div id="securityque" style=""></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        Enter your Answer
                    </td>
                    <td>
                        <input type="text" name="sequrityans" class="tb6" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="submit" id="submitbutton" style="border-left-width: 2px; padding: 1px 13px;"/>
                    </td>
                </tr>
            </table>                                    
        </form>
        <%
            }
        %>
    </body>
</html>