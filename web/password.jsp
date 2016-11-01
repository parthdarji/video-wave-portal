<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Forgot PassWord</title>
    </head>
    <body>
        <%

            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            Class.forName(JDBC_DRIVER);
            Connection conn = null;
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            String username = request.getParameter("username");
            String answer = request.getParameter("sequrityans");

            String newpass = request.getParameter("password");

         //  String ur = request.getParameter("id");
            //out.println(ur+"<br/>");
            //    out.println(answer + "<br/>");
            Statement stmt = null;
            ResultSet rs1 = null;
            String msg = "";
            stmt = conn.createStatement();

            //  String sql = "update password from v_userinfo where username='" + username + "'";
            String sql1 = "update v_userinfo set password ='" + newpass + "' where username='" + username + "'";
            //out.println(sql);
            int i = stmt.executeUpdate(sql1);

            out.println("Password changed successfully");
            out.println(newpass);

            /*  if (username != null) {
             try {
             if (rs.next()) {
             String psw = rs.getString("password");
             }
             else {
             out.println("Enter correct Information");
             }

             } catch (Exception e) {
             }
             rs.close();
             stmt.close();
             }*/
            stmt.close();
            conn.close();
            response.setHeader("Refresh", "2;URL=index.jsp");
           // response.sendRedirect("index.jsp");
        %>
    </body>
</html>
