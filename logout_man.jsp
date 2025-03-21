<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    Cookie ck1 = new Cookie("unman", "");
    ck1.setMaxAge(0);
    response.addCookie(ck1);

    response.sendRedirect("login_man.html");
%>
