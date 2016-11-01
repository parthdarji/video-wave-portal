<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%
    String user = null;
    try {
        user = (String) session.getAttribute("username");
    } catch (Exception e) {
    }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />

        <title>Registration</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" type="text/css" href="chrometheme/chromestyle.css" />


    </head>
    <body bgcolor="#ffffff" style="margin:0px 0px 0px 0px;">
        <script src="regivalidation.js"></script>
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
                                            <%                            ServletContext context = pageContext.getServletContext();
                                                String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
                                                String DB_URL = context.getInitParameter("db_url");
                                                String USER = context.getInitParameter("username");
                                                String PSW = context.getInitParameter("password");
                                                Connection conn = null;
                                                Class.forName(JDBC_DRIVER);
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
            <li class="current"><a href="index.jsp"><b>Home</b></a></li>
            <li><a href="vidiodetail.jsp"><b>Upload Video</b></a></li>
            <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
            <li><a href="myAccount.jsp"><b>My Account</b></a></li>
        </ul>

        <form  name="form1" method="post" action="insert.jsp" >
            <table border="0" align="center" style="margin:10px auto;border-bottom:1px solid #999;border-right:1px solid #999;border-left:1px solid #999" cellpadding="5" cellspacing="0">    <tr>
                    <th colspan="3" align="center" style="background:url(images/menuo_login.GIF) repeat-x;color:#FFF"><b>Registration Form</b></th>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>:</td>
                    <td><input name="fname" type="text" id="fname" class="tb6"/>
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>:</td>
                    <td><input name="lname" type="text" id="lname" class="tb6" />
                    </td>
                </tr>
                <tr>
                    <td>Date of birth</td>
                    <td>:</td>
                    <td><input name="dob" type="text" id="dob"  class="tb6"/	>
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td>:</td>
                <td><textarea name="add" class="tb6" ></textarea></td>
            </tr>
            <tr>
                <td>City</td>
                <td>:</td>
                <td><select name="city" id="city" class="tb6">
                        <option selected="selected">Ahmedabad</option>
                        <option>Baroda</option>
                        <option>Banglore</option>
                        <option>delhi</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>state</td>
                <td>:</td>
                <td><input name="state" type="text" id="state" class="tb6"/>
                </td>
            </tr>
            <tr>
                <td>postal code</td>
                <td>:</td>
                <td><input name="postalcode" type="text" id="postal" class="tb6"/>
                </td>
            </tr>
            <tr>
                <td>country</td>
                <td>:</td>
                <td><input name="country" type="text" id="country" class="tb6"/>
                </td>
            </tr>
            <tr>
                <td>Contact no</td>
                <td>:</td>
                <td><input name="contact" type="text" id="contact" class="tb6"/>
                </td>
            </tr>
            <tr>
                <td>email id</td>
                <td>:</td>
                <td><input name="email" type="text" id="email" class="tb6"/>
                </td>
            </tr>
            <tr>
                <td>Username     </td>
                <td>:</td>
                <td><input type="text" name="username" value="" class="tb6"/>
                </td>
            </tr>
            <tr>
                <td>Password      </td>
                <td>:</td>
                <td><input type="password" name="password" value="" class="tb6"/>
                </td>
            </tr>
            <tr>
                <td>sequrity question</td>
                <td>:</td>
                <td><select name="securityq" class="tb6">
                        <option selected="selected">what is your name?</option>
                        <option>what is your mobile no?</option>
                        <option>what is your nick name?</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>security answer</td>
                <td>:</td>
                <td><textarea name="securitya"  class="tb6"></textarea></td>
            </tr>
            <tr>
                <td colspan="3"><input name="submit" type="submit"  value="submit" id="submitbutton" style="border-left-width: 2px; padding: 1px 13px; margin-left: 110px; " /></td>
            </tr> 
        </table>   
    </form>
</body>
</html>
