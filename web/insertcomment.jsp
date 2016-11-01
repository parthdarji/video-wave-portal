<%@ page import="java.sql.*" import="java.util.*" import="java.util.Date" import="java.util.Hashtable"%>
<%
    ServletContext context = pageContext.getServletContext();
    String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
    String DB_URL = context.getInitParameter("db_url");
    String USER = context.getInitParameter("username");
    String PSW = context.getInitParameter("password");
    Connection conn = null;
    Statement stmt = null;
    Class.forName(JDBC_DRIVER);
    conn = DriverManager.getConnection(DB_URL, USER, PSW);
    stmt = conn.createStatement();

    int uid = 0;
    int vid = 0;
    uid = Integer.parseInt(request.getParameter("uid"));
    vid = Integer.parseInt(request.getParameter("vid"));
    String comment = request.getParameter("comment");
    String sql = "insert into v_comment(userid,vid,comment) values(" + uid + "," + vid + ",'" + comment + "')";

    stmt.executeUpdate(sql);

    response.getWriter().write(comment);
    //  response.getWriter().write(uid);
%>

<!--   <div style=" width: 520px; padding-left: 23px; border: 2px dashed rgb(76,76,76); background-color: rgba(248,248,248,0.2); margin-top: 15px;">
      
       <h4 style="color: #8F2303"><%=comment%></h4>
       <p class="comment-author"><%=uid%></p>
  
   </div>-->