<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

    ServletContext context = pageContext.getServletContext();
    String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
    String DB_URL = context.getInitParameter("db_url");
    String USER = context.getInitParameter("username");
    String PSW = context.getInitParameter("password");
    Class.forName(JDBC_DRIVER);
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    conn = DriverManager.getConnection(DB_URL, USER, PSW);
    stmt = conn.createStatement();
    String username = request.getParameter("username");
    String sql = "select sequrityque from v_userinfo where username='" + username + "'";
    rs = stmt.executeQuery(sql);

    if (rs != null && rs.next()) {
        out.println(rs.getString("sequrityque"));
    } else {
        out.println("User name doesn't exist");
    }
    rs.close();
    stmt.close();
    conn.close();
%>