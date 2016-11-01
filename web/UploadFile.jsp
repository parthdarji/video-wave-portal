<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
    String user = null;
    try {
        user = (String) session.getAttribute("username");
    } catch (Exception e) {
    }

%>
<link rel="stylesheet" type="text/css" href="jqueryslidemenu.css" />
<body style="margin:0px 0px 0px 0px">
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
                                        <%                            ServletContext context1 = pageContext.getServletContext();
                                            String JDBC_DRIVER = context1.getInitParameter("jdbc_driver");
                                            String DB_URL = context1.getInitParameter("db_url");
                                            String USER = context1.getInitParameter("username");
                                            String PSW = context1.getInitParameter("password");
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
                <b> welcome <%=user%></b>
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
    <%
        /*ServletContext ct= pageContext.getServletContext();
         String JDBC_DRIVER=ct.getInitParameter("jdbc_driver");
         String DB_URL=ct.getInitParameter("db_url");
         String USER = ct.getInitParameter("username");
         String PSW=ct.getInitParameter("password");					
         Class.forName(JDBC_DRIVER);
         Connection conn=null;

         Statement stmt=null;
         Statement stmt1=null;

         ResultSet rs =null;
         ResultSet rs1 =null;
         conn = DriverManager.getConnection(DB_URL,USER,PSW);
         stmt = conn.createStatement();
         stmt1 = conn.createStatement();*/
        File file;
        int maxFileSize = 5 * 1024 * 1024;
        int maxMemSize = 5 * 1024 * 1024;
        ServletContext context = pageContext.getServletContext();
        String filePath = context.getInitParameter("file-upload");
        String fullPath = "";
        String contentType = request.getContentType();

        if ((contentType.indexOf("multipart/form-data") >= 0)) {

            //Enumeration header = request.getHeaderNames();
            //header.nextElement()
            //System.out.println(request.getParameter("file"));
            FileItemFactory factory = new DiskFileItemFactory();
            // maximum size that will be stored in memory
            //factory.setSizeThreshold(maxMemSize);
            // Location to save data that is larger than maxMemSize.
            //factory.setRepository(new File("C:\temp"));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            // maximum file size to be uploaded.
            // upload.setSizeMax( maxFileSize );
            try {
                // Parse the request to get file items.
                List fileItems = upload.parseRequest(request);

                // Process the uploaded file items
                Iterator i = fileItems.iterator();

                out.println("<html>");
                out.println("<head>");
                out.println("<title>JSP File upload</title>");
                out.println("</head>");
                out.println("<body>");
                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
                        String fname = fi.getName();
                        int s = fname.indexOf('.');
                        String first = fname.substring(0, s);
                        String back = fname.substring(s);
                        String fileName = first + back;
                        System.out.println("file name is:" + fileName);
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();
                        // Write the file
                        String filename = fi.getName();
                        if (fileName.lastIndexOf("\\") >= 0) {
                            file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                        } else {
                            file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }
                        fi.write(file);
                        fullPath = filePath + fileName;
                        com.myapp.struts.ActionToThumnail img = new com.myapp.struts.ActionToThumnail();
                        img.createthumbnail(filename, filePath);
                    }
                }
                /*String sql = "select * from v_vidiodetail";
                 ResultSet rs = null;
                 Statement stmt = null;
                 Statement stmt1 = null;
                 rs = stmt.executeQuery(sql);

                 if (rs.last()) {
                 int id = rs.getInt("id");
                 String sql1 = "update v_vidiodetail set vidiopath='" + fullPath + "' where id=" + id;
                 out.println(sql1);
                 stmt1.executeUpdate(sql1);
                 }*/
                out.println("File Uploaded.");
                response.setHeader("Refresh", "3;URL=index.jsp");
                out.println("</body>");
                out.println("</html>");
            } catch (Exception ex) {
                System.out.println(ex);
            }
        } else {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>");
            out.println("</body>");
            out.println("</html>");
        }

    %>
</body>
