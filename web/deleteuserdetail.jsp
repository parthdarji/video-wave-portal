<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Delete User Detail</title>
    </head>

    <body>

        <%
            ServletContext context = pageContext.getServletContext();
            String JDBC_DRIVER = context.getInitParameter("jdbc_driver");
            String DB_URL = context.getInitParameter("db_url");
            String USER = context.getInitParameter("username");
            String PSW = context.getInitParameter("password");
            Connection conn = null;
            Statement stmt = null;
            Statement stmt1 = null;
            ResultSet rs = null;
            ResultSet rs3 = null;
                //String sub="";
            //int check=0;
            //String ch="";
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PSW);
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            String co = request.getParameter("count");
            int count = Integer.parseInt(co);
            //out.println("count is:"+count);
            String sub = request.getParameter("delete");
                //String ch=request.getParameter(cid);
            //out.println("submit is:"+sub);
            //out.println("check name is:"+ch);
            int i;
            if (sub != null) {
                //out.println("hi");
                for (i = 0; i <= count - 1; i++) {
                    String u = Integer.toString(i);
                    String sel = (String) request.getParameter(u);
                    //out.println(u+"selected value is:'"+sel+"'<br />");
                    Enumeration name = request.getParameterNames();
                        //if(name!=null)
                    //{
                    while (name.hasMoreElements()) {
                        String pname = (String) name.nextElement();
                        String val = request.getParameter(pname);
                                //out.println("value is:"+val);
                        //int ha=Integer.parseInt(pname);
                        //out.println("checkbox:"+ha);
                        if (val.compareTo("") == 0) {
                            String sql2 = "delete from v_userinfo where id='" + pname + "'";
                            //out.println(sql2);
                            stmt1.executeUpdate(sql2);

        %>

        <%                            }
                    //String val=request.getHeader(pname);
                        //out.println("check nnname is:"+val);
                    }
            //}
                    //if(sel.compareTo("")==0)
                    //{
                    //String sql="delete from se_cart where "
                    //}
                }
    //rs.close();
                //rs3.close();
                stmt.close();
                stmt1.close();
            }


        %>

    </body>
</html>