<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
    </head>

    <body>
        <%

            try {
                String user = (String) session.getAttribute("username");
                if (user == null) {
                    response.sendRedirect("index.jsp");
                }

                session.removeAttribute("username");
                session.setAttribute("username", null);
                session.invalidate();
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
            }

        %>
    </body>
</html>
