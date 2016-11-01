<%-- 
    Document   : Home
    Created on : 28 Apr, 2014, 9:56:40 PM
    Author     : Parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
    background-color:red;
}

#splashscreen {
    position:absolute;
    top:0;
    left:0;
    bottom:0;
    width:100%;
    background-color:white;
}
        </style>
    </head>
    <body>
        <div id="splashscreen">
    <h2>Welcome !</h2>
   
   <!-- <img src="images/freemake-video-converter-logo.png" />
    
    <a href="#" class="enter_link">Enter on the website</a>
</div>
        <script>
            $('.enter_link').click(function () {
    $(this).parent('#splashscreen').fadeOut(500);
});
            </script>-->
        
        <h1>Hello World!</h1>
        <a href="http://facebook.com" onclick="javascript:void window.open('http://facebook.com','1398835330848','width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0');return false;">
            Pop-up Window
        </a>
        
      <%response.setHeader("Refresh", "5;url=index.jsp"); %>
    </body>
</html>



 BigNoseBird.Com- home Small Logo
 The 508 Compliant Guide to 
       Big Nose Bird	
 
BACK 
How can I make a window open up automatically the first time a visitor stops by a page? Can I reset it so that repeat visitors will see the window if I update the information in the window?
Here is a small JavaScript that will allow you to greet first time visitors to your site with a pop-up window. If you ever need to update the information contained in popwin.html, simply rename the cookie. As an example, in the code below, it is called COOKIE1. To make it so that nobody has ever been to your site before, change both occurances of COOKIE1 to COOKIE2 and so on...
If you do not see the pop-up window on this page it is because you have already been here. ;-)

source code
Be certain when copying the source code to keep the very 
long line below intact. You will get an error if you split
the line. Have some fun, play with the various options such
as height, width, and scrollbars!

<SCRIPT LANGUAGE="JavaScript">
<!--
function GetCookie(name) {
  var arg=name+"=";
  var alen=arg.length;
  var clen=document.cookie.length;
  var i=0;
  while (i<clen) {
    var j=i+alen;
    if (document.cookie.substring(i,j)==arg)
      return "here";
    i=document.cookie.indexOf(" ",i)+1;
    if (i==0) break;
  }
  return null;
}
var visit=GetCookie("COOKIE1");
if (visit==null){
   var expire=new Date();
    window.name = "thiswin";
    newwin=open("popwin.html", "dispwin",  
    "width=250,height=300,scrollbars=no,menubar=no");
   document.cookie="COOKIE1=here; expires=Thu 01-01-2004 00:00:00 GMT;";
}
// -->
</SCRIPT>