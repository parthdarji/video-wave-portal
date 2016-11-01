<%@ page import="java.sql.*" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
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
        <title>Search Video</title>
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
            Statement stmt4 = null;
            Statement stmt5 = null;
            Statement stmt8 = null;
            Statement stmt9 = null;
            Statement stmt10 = null;
            Statement stmt11 = null;
            ResultSet rs = null;
            //int result;
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();
            stmt4 = conn.createStatement();
            stmt5 = conn.createStatement();
            stmt8 = conn.createStatement();
            stmt9 = conn.createStatement();
            stmt10 = conn.createStatement();
            stmt11 = conn.createStatement();
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
                                <%
                                    if (user != null) {
                                %>		
                                <td align="center" style="margin-left: 130px; color: #060; padding-left: 500px; border-top-width: 0px; padding-top: 1px; padding-bottom: 40px;">
                                    <b> Welcome <%=user%></b>
                                </td>	
                                <td align="center" style="vertical-align:top;margin-left:130px">
                                    <a href="logout.jsp" style="color: red">Log Out</a>
                                </td>

                                <%
                                    }
                                %>	
                            </tr>
                        </table>
                    </form>


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
                    </ul>
                </td>
            </tr>
            <tr>
                <td width="800px" style="vertical-align:top">
                    <table border="0" align="left" style="margin-left:15px">
                        <%
                            out.println("<h2 style='color:#900000'>Requested Search<hr></h2>");
                            String find = request.getParameter("category");
                            String s = request.getParameter("search");
                            if (s.compareTo("") != 0 && find.compareTo("") != 0) {
                                StringTokenizer st = new StringTokenizer(s);

                                String sqo = "";
                                String temp = "";
                                while (st.hasMoreElements()) {
                                    //out.println("words are seprated");
                                    String output = st.nextElement().toString();
                                    if (sqo.compareTo("") == 0) {
                                        sqo = "title like '%" + output + "%'";
                                    } else {
                                        sqo = sqo + " or title like '%" + output + "%'";
                                    }
                                }
//						out.println(sql);	
                                if (sqo.compareTo("") != 0) {
                                    String sqh = "select * from v_vidiodetail where categoryid='" + find + "' and " + sqo;
                                    ResultSet rs4 = stmt4.executeQuery(sqh);
                                    while (rs4.next()) {
                                        //count=count+1;	
                                        int vid = rs4.getInt("id");
                                        String title = rs4.getString("title");
                                        String path = rs4.getString("vidiopath");
                                        String desc = rs4.getString("description");
                                        String dat = rs4.getString("date");
                                        String thumbnail = rs4.getString("thumbnail");
                                        String thumb = "video//image//" + thumbnail;
                        %>
                        <tr>
                            <td width="10%">
                                <a href="play.jsp?vid=<%=vid%>&category=<%=find%>" style="float:left">
                                    <img src=<%=thumb%> width="200" height="150"/>
                                </a>
                            </td>
                            <td width="70%">
                                <div style="margin-bottom:40px"><h2 style="color:#090"><%=title%></h2>
                                    <b>Description:</b><%=desc%><br />
                                    <%
                                        String sq3 = "select * from v_vidioview where vidiodetailid='" + vid + "'";
                                        //out.println(sq3);
                                        ResultSet rs5 = stmt5.executeQuery(sq3);
                                        while (rs5.next()) {
                                            //out.println("hi");
                                            String rating = rs5.getString("rate");
                                    %>
                                    <!-- <b>Rate:</b><//%=rating%><br />-->
                                    <%
                                        }
                                    %>
                                    <b>Date:</b><%=dat%>
                                </div>
                            </td>
                        </tr>


                        <%
                                }
                            }
                            //out.println(sql);
                                        /*ResultSet rs=stmt.executeQuery(sql);
                             while(rs.next())
                             {
                             out.println(rs.getString(2)+"<br/>");	
                             }*/
                        } else if (find.compareTo("") != 0) {
                            //out.println("only category selected");
                            String sqz = "select * from v_vidiodetail where categoryid='" + find + "'";
                            ResultSet rs8 = stmt8.executeQuery(sqz);
                            while (rs8.next()) {
                                //count=count+1;	
                                int vid = rs8.getInt("id");
                                String title = rs8.getString("title");
                                String path = rs8.getString("vidiopath");
                                String desc = rs8.getString("description");
                                String dat = rs8.getString("date");
                                String thumbnail = rs8.getString("thumbnail");
                                String thumb = "video//image//" + thumbnail;
                        %>
                        <tr>
                            <td width="10%">
                                <a href="play.jsp?vid=<%=vid%>&category=<%=find%>" style="float:left">
                                    <img src=<%=thumb%> width="200" height="150"/>
                                </a>
                            </td>
                            <td width="70%">
                                <div style="margin-bottom:40px"><h2 style="color:#090"><%=title%></h2>
                                    <b>Description:</b><%=desc%><br />
                                    <%
                                        String sqx = "select * from v_vidioview where vidiodetailid='" + vid + "'";
                                        //out.println(sq3);
                                        ResultSet rs9 = stmt9.executeQuery(sqx);
                                        while (rs9.next()) {
                                            //out.println("hi");
                                            String rating = rs9.getString("rate");
                                    %>
                                    <!--   <b>Rate:</b><//%=rating%><br />-->
                                    <%
                                        }
                                    %>
                                    <b>Date:</b><%=dat%>
                                </div>
                            </td>
                        </tr>


                        <%
                            }
                        } else if (s.compareTo("") != 0) {
                            StringTokenizer st = new StringTokenizer(s);
                            //out.println("<h2 style='color:#879600'>Requested Search</h2>");
                            String sqo = "";
                            String temp = "";
                            while (st.hasMoreElements()) {
                                //out.println("words are seprated");
                                String output = st.nextElement().toString();
                                if (sqo.compareTo("") == 0) {
                                    sqo = "title like '%" + output + "%'";
                                } else {
                                    sqo = sqo + " or title like '%" + output + "%'";
                                }
                            }
                            //						out.println(sql);	
                            if (sqo.compareTo("") != 0) {
                                String sqv = "select * from v_vidiodetail where " + sqo;
                                ResultSet rs10 = stmt10.executeQuery(sqv);
                                while (rs10.next()) {
                                    //count=count+1;	
                                    int vid = rs10.getInt("id");
                                    String fnd = rs10.getString("categoryid");
                                    String title = rs10.getString("title");
                                    String path = rs10.getString("vidiopath");
                                    String desc = rs10.getString("description");
                                    String dat = rs10.getString("date");
                                    String thumbnail = rs10.getString("thumbnail");
                                    String thumb = "video//image//" + thumbnail;
                        %>
                        <tr>
                            <td width="10%">
                                <a href="play.jsp?vid=<%=vid%>&category=<%=fnd%>" style="float:left">
                                    <img src=<%=thumb%> width="200" height="150"/>
                                </a>
                            </td>
                            <td width="70%">
                                <div style="margin-bottom:40px"><h2 style="color:#090"><%=title%></h2>
                                    <b>Description:</b><%=desc%><br />
                                    <%
                                        String sqb = "select * from v_vidioview where vidiodetailid='" + vid + "'";
                                        //out.println(sq3);
                                        ResultSet rs11 = stmt11.executeQuery(sqb);
                                        while (rs11.next()) {
                                            //out.println("hi");
                                            String rating = rs11.getString("rate");
                                    %>
                                    <!-- <b>Rate:</b><//%=rating%><br />-->
                                    <%
                                        }
                                    %>
                                    <b>Date:</b><%=dat%>
                                </div>
                            </td>
                        </tr>


                        <%
                                    }

                                }
                            }
                        %>
                    </table>    
                    <%

                    %>
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
                                        <input type="submit" name="submit" value="submit"  id="submitbutton" style="border-left-width: 2px; padding: 1px 13px;"/>
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

                            <div style="background-size: 50px;background-color: #AEA697">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>
                            
    </body>
</html>
