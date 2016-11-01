<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Account</title>
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
                var url = "userAvaliable.jsp";
                url += "?username=" + str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    document.getElementById("usercheck").innerHTML = xmlHttp.responseText
                }

            }
        </script>
    </head>

    <body style="margin:0px 0px 0px 0px">
        <%
            String user = (String) session.getAttribute("username");

            //int userid=(Integer)session.getAttribute("userid");
            //out.print(userid);
            if (user == null) {
                response.setHeader("Pragma/", "No-cache");
                response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "must-revalidate");
                response.setDateHeader("Expires", 0);
                //response.setHeader("Refresh", "0; URL=login.jsp");
                response.sendRedirect("index.jsp");
            } else {
                response.setHeader("Pragma/", "No-cache");
                response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "must-revalidate");
                response.setDateHeader("Expires", 0);
        %>
        <%
            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();

            String edit = "";
            String submit = "";
            edit = request.getParameter("Edit");
            submit = request.getParameter("Submit");
            //out.print(submit);
            try {
                if (submit.compareTo("Submit") == 0) {

                    String fname = "";
                    String lname = "";
                    String address = "";
                    int postalcode = 0;
                    String city = "";
                    String state = "";
                    String country = "";
                    int contact = 0;
                    String email = "";
                    String question = "";
                    String answer = "";
                    String month = "";
                    String date = "";
                    String year = "";
                    String DOB = "";

                    try {

                        fname = request.getParameter("fname");
                        lname = request.getParameter("lname");
                        address = request.getParameter("address");
                        city = request.getParameter("city");
                        state = request.getParameter("state");
                        postalcode = Integer.parseInt(request.getParameter("postalcode"));
                        country = request.getParameter("country");
                        contact = Integer.parseInt(request.getParameter("contact"));
                        email = request.getParameter("email");
                        question = request.getParameter("question");
                        answer = request.getParameter("answer");
                        month = request.getParameter("month");
                        date = request.getParameter("date");
                        year = request.getParameter("year");
                        DOB = month + ("/") + date + ("/") + year;
                        String sql1 = "update v_userinfo set fname='" + fname + "',lname='" + lname + "',address='" + address + "',city='" + city + "',state='" + state + "',postalcode=" + postalcode + ",country='" + country + "',phoneno=" + contact + ",email='" + email + "',sequrityque='" + question + "',sequrityans='" + answer + "',dob='" + DOB + "' where username='" + user + "'";
                        stmt.executeUpdate(sql1);

                        //out.println("Update is successfull.");
                        //response.setHeader("Pragma/", "No-cache");
                        //response.setHeader("Cache-Control", "no-cache");
                        //response.setHeader("Cache-Control", "must-revalidate");
                        //response.setDateHeader("Expires",0);
                        //response.setHeader("Refresh","1; URL=login.jsp");
                    } catch (Exception e) {
                    }

                    response.setHeader("Refresh", "0; URL=myAccount.jsp");
                }
            } catch (Exception e) {
            }
            String sql = "select * from v_userinfo where username='" + user + "'";
            //out.println(sql);
            rs = stmt.executeQuery(sql);
            if (rs.next()) {

        %>

        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 0px">
            <tr>
                <td style="width:130px;">
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>			<h2 style="float:right">ideo</h2>       </td>
                <td>
                    <form method="post" id="search">
                        <table>
                            <tr>
                                <td>
                                    <input type="text" name="search" placeholder="Search..."/>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <select name="category" class="dropdown-select"">
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

            </tr>
        </table>
        <ul class="glossymenu">
            <li><a href="index.jsp"><b>Home</b></a></li>
            <li><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
            <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
            <li class="current"><a href="myAccount.jsp"><b>My Account</b></a></li>
            <li><a href="contact.jsp"><b>Contact us</b></a></li>
        </ul>
        <form  method="post" action="myAccount.jsp">
            <h3 style="margin:10px 0px 0px 115px"></h3>
            <table border="0" align="center" style="margin:10px auto;border-bottom:1px solid #999;border-right:1px solid #999;border-left:1px solid #999" cellpadding="5" cellspacing="0">
                <tr>
                    <th colspan="2" style="background:url(images/menuo_login.GIF) repeat-x;color:#FFF"><b>My Account Detail</b></th>
                </tr>
                <tr>
                    <td class="td">
                        First Name:
                    </td>
                    <td >
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="fname" id="fname" class="tb6"/>
                        <%
                            } else {
                                out.println(rs.getString("fname"));
                            }
                        %>
                    </td>
                </tr>	
                <tr>
                    <td class="td">
                        Last Name:
                    </td>
                    <td >
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="lname" id="lname" class="tb6"/>
                        <%
                            } else {
                                out.println(rs.getString("lname"));
                            }
                        %>
                    </td>
                </tr>	

                <tr>
                    <td class="td" >
                        Address:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>	
                        <textarea name="address" id="address" class="tb6"></textarea>		
                        <%
                            } else {
                                out.println(rs.getString("address"));
                            }
                        %>
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        City:
                    </td>
                    <td >
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="city" id="city" class="tb6" />             	 
                        <%
                            } else {
                                out.println(rs.getString("city"));
                            }
                        %>
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        State:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="state" id="state" class="tb6" />
                        <%
                            } else {
                                out.println(rs.getString("state"));
                            }
                        %>
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        Postal Code:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="postalcode" id="postalcode" class="tb6" />
                        <%
                            } else {
                                out.println(rs.getString("postalcode"));
                            }
                        %>
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        Country:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="country" id="country" class="tb6" />
                        <%
                            } else {
                                out.println(rs.getString("country"));
                            }
                        %>
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        Contact-No:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="contact" id="contact" class="tb6"/>
                        <%
                            } else {
                                out.println(rs.getString("phoneno"));
                            }
                        %>
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        Email-id:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="email" id="email" class="tb6"/>
                        <%
                            } else {
                                out.println(rs.getString("email"));
                            }
                        %>
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        Security Question:
                    </td>

                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <select name="question" id="question" class="tb6" onchange="return validation(this.id, this.value)">
                            <option value=""></option>
                            <option value="What is Your Mobile No.?">What is Your Mobile No.?</option>
                            <option value="What is Your First GF Name?">What is Your First GF Name?</option>
                            <option value="what is yournick name?">What is your nick name?</option>
                        </select>
                        <%
                            } else {
                                out.println(rs.getString("sequrityque"));
                            }
                        %>    
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        Your Answer:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="text" name="answer" id="answer" class="tb6" />
                        <%
                            } else {
                                out.println(rs.getString("sequrityans"));
                            }
                        %>  
                    </td>
                </tr>

                <tr>
                    <td class="td">
                        D.O.B:
                    </td>
                    <td>
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <select name="month" id="month" class="tb7" onchange="return check_psw_date()">
                            <option value="">Month</option>
                            <option value="Jan">Jan</option>
                            <option value="Feb">Feb</option>
                            <option value="March">March</option>
                            <option value="April">April</option>
                            <option value="May">May</option>
                            <option value="June">June</option>
                            <option value="July">July</option>
                            <option value="Augs">Augs</option>
                            <option value="Sept">Sept</option>
                            <option value="Oct">Oct</option>
                            <option value="Nov">Nov</option>
                            <option value="Dec">Dec</option>
                        </select>

                        <select name="date" id="date" class="tb7" onchange="return check_psw_date()">
                            <option value="">Date</option>
                            <%
                                int i;
                                for (i = 1; i <= 31; i++) {
                                    out.println("<option value='" + i + "'>" + i + "</option>");
                                }
                            %>
                        </select>

                        <select name="year" id="year" class="tb7" onchange="return check_psw_date()">
                            <option value="">Year</option>
                            <%
                                int j;
                                for (j = 1970; j <= 2011 - 8; j++) {
                                    out.println("<option value='" + j + "'>" + j + "</option>");
                                }
                            %>
                        </select> 
                        <%
                            } else {
                                out.println(rs.getString("dob"));
                            }
                        %>                                
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <%
                            if (edit != null || submit != null) {
                        %>
                        <input type="submit" name="Submit" value="Submit" id="submitbutton" style="border-left-width: 2px; padding: 1px 13px;"/>
                        <%
                        } else {
                        %>	
                        <input type="submit" name="Edit" value="Edit" class="myButton2"/>

                        <%
                            }
                        %>
                    </td>

                </tr>    	
            </table>
        </form>
        <%
                }
            }
        %>
        
         <div style="background-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 70px;">
                        <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
© OurSite 2014.
<a href="index.jsp">Video Wave Sreaming</a>
by Prolate Technology pvt.ltd.
</p>
</div>
    </body>
</html>
