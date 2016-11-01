<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
    int vid = Integer.parseInt(request.getParameter("vid"));
    int rating = Integer.parseInt(request.getParameter("rating"));

    ServletContext context = pageContext.getServletContext();
    String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
    String DB_URL = context.getInitParameter("db_url");
    String USER = context.getInitParameter("username");
    String PSW = context.getInitParameter("password");
    Class.forName(JDBC_DRIVER);
    Connection conn = null;
    conn = DriverManager.getConnection(DB_URL, USER, PSW);

    Statement stmt = null;
    stmt = conn.createStatement();
    Statement stmt1 = null;
    stmt1 = conn.createStatement();
    ResultSet rs = null;
    String sql = "select * from v_vidioview where vidiodetailid=" + vid;
    rs = stmt.executeQuery(sql);
    while (rs.next()) {
        int rate = rs.getInt("rate");
        rate = rate + rating;
        String sql2 = "update v_vidioview set rate=" + rate + " where vidiodetailid=" + vid;
        out.println(sql2);
        stmt1.executeUpdate(sql2);
    }
%>
