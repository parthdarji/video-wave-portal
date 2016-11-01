<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
    ServletContext ct = pageContext.getServletContext();
    String JDBC_DRIVER = ct.getInitParameter("jdbc_driver");
    String DB_URL = ct.getInitParameter("db_url");
    String USER = ct.getInitParameter("username");
    String PSW = ct.getInitParameter("password");
    String filePath = ct.getInitParameter("file-upload");
    Class.forName(JDBC_DRIVER);
    Connection conn = null;
    String url = (String) request.getParameter("url");
    Statement stmt = null;
    Statement stmt1 = null;

    ResultSet rs = null;
    ResultSet rs1 = null;
    conn = DriverManager.getConnection(DB_URL, USER, PSW);
    stmt = conn.createStatement();
    stmt1 = conn.createStatement();
    int p = url.lastIndexOf("\\");
    String data = url.substring(p + 1);
    String path = data;
    String imgname = data.substring(0, data.lastIndexOf("."));
    imgname = imgname + ".jpg";

    //System.out.println(data1);
    String sql = "select * from v_vidiodetail";
    rs = stmt.executeQuery(sql);
    if (rs.last()) {
        int id = rs.getInt("id");
        String sql1 = "update v_vidiodetail set vidiopath='" + path + "',thumbnail='" + imgname + "' where id=" + id;
        out.println(sql1);
        stmt1.executeUpdate(sql1);
    }

%>