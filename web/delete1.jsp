<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete user</title>
    </head>
    <body>
        <%
            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            String msg = "";
            //String uname=request.getParameter("username");
            Connection conn = null;
            Statement stmt = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            //int result;
            Class.forName(JDBC_DRIVER);
            conn = (Connection) DriverManager.getConnection(DB_URL, USER, PSW);
            String record = request.getParameter("deleteid");
            Double recordToDelete = Double.parseDouble(record);

            // Use PreparedStatements here instead of Statment
            ps = (PreparedStatement) conn.prepareStatement("DELETE FROM v_userinfo WHERE id = ?");
            ps.setDouble(1, recordToDelete);
            ps.executeUpdate();

            response.sendRedirect("userdetail.jsp"); // redirect to JSP one, which will again reload.
%>
    </body>
</html>
