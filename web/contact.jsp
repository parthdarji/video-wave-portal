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
        <title>Video Wave Streaming</title>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />


        <style type="text/css">
            html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
        </style>


        <script type="text/javascript" src="jquery.min.js"></script>



    </head>

    <body style="margin:0px 0px 0px 0px" >
        <%            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            Class.forName(JDBC_DRIVER);
            Connection conn = null;
            conn = DriverManager.getConnection(DB_URL, USER, PSW);

            String msg = "";
            //String uname=request.getParameter("username");
            Statement stmt = null;
            ResultSet rs = null;
            //int result;
            stmt = conn.createStatement();
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
                        response.sendRedirect("index.jsp");
                    } else {
                        msg = "<font color='red'>Enter valid Information</font>";
                    }
                }
            } catch (Exception e) {
            }
            rs.close();
            stmt.close();

        %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:0px 0px 0px 0px"  >
            <tr>
                <td style="width:130px;">
                    <img src="images/freemake-video-converter-logo.png" style="width:80px;height:50px"/>			<h2 style="float:right">ideo</h2>

                </td>
                <td>
                    <form action="search2.jsp" method="post" id="search"> 
                        <table>
                            <tr>
                                <td>

                                    <input type="text" name="search" placeholder="Search..." />
                                </td>
                                <td>
                                    <!-- <select name="category" id="category" style="height:22.9px">-->
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
                                    <input type="submit" value="Search" name="search" class="myButton"/>
                                </td>

                            </tr>
                        </table>    	

                    </form>      
                </td>
                <%
                    if (user != null) {
                %>		
                <td align="center" style="vertical-align:top;margin-left:130px;color:#060 ">
                    <b>Welcome <%=user%></b>
                </td>	
                <td align="center" style="vertical-align:top;margin-left:130px;">
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
                        <li><a href="index.jsp"><b>Home</b></a></li>
                        <li><a  href="vidiodetail.jsp"><b>Upload Video</b></a></li>
                        <li><a href="mostview.jsp"><b>Most Viewed</b></a></li>
                        <li><a href="myAccount.jsp"><b>My Account</b></a></li>
                        <li class="current"><a href="contact.jsp"><b>Contact us</b></a></li>
                    </ul>
                </td>
            </tr>

        </table>

       
        <table>
            <tr>
       <!-- <div class="clear"> </div>-->
        <div class="content">
            <div class="section group">				
                <div class="col span_1_of_3">
                    <div class="contact_info">
                        <h3>Find Us Here</h3>
                        <div class="map">
                            <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed">
                                
                            </iframe>
                            <br/>
                            
                            <small>
                                <a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">
                                    View Larger Map
                                </a>
                            </small>
                        </div>
                    </div>
                    <div class="company_address">
                        <h3>Company Information :</h3>
                        <p style="color:black">L.D.College,</p>
                        <p style="color:black">University Area,Ahmedabad</p>
                        <p style="color:black">Gujarat</p>
                        <p style="color:black">Phone:8980108869</p>
                        <p style="color:black">Fax: (000) 000 00 00 0</p>
                        <p style="color:black">Email: <span>info@mycompany.com</span></p>
                        <p style="color:black">Follow on: <span>Facebook</span>, <span>Twitter</span></p>
                    </div>
                </div>      

                <div class="col span_2_of_3">
                    <div class="contact-form">

                        <form>
                            <div>
                                <span><label style="color: #060">NAME</label></span>
                                <span><input type="text" value=""></span>
                            </div>
                            <div>
                                <span><label style="color: #060">E-MAIL</label></span>
                                <span><input type="text" value=""></span>
                            </div>
                            <div>
                                <span><label style="color: #060">MOBILE.NO</label></span>
                                <span><input type="text" value=""></span>
                            </div>
                            <div>
                                <span><label style="color: #060">SUBJECT</label></span>
                                <span><textarea> </textarea></span>
                            </div>
                            <div>
                                <span><input type="submit" value="Submit"></span>
                            </div>
                        </form>
                    </div>
                </div>			


            </div>


        </div>
        </tr>
        </table>
        <div style="background-size: 50px auto; background-color: rgb(174, 166, 151); margin-top: 620px; margin-bottom: 0px; border-top-width: 0px; border-bottom-width: 30px;">
            <p style="margin-left: 490px; background:background:url(images/menu.gif) no-repeat 10px 5px">
                © OurSite 2014.
                <a href="index.jsp">Video Wave Sreaming</a>
                by Prolate Technology pvt.ltd.
            </p>
        </div>
    </body>
</html>