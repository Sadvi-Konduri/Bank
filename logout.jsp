<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    Cookie ck = new Cookie("ac", "");
    ck.setMaxAge(0);
    response.addCookie(ck);

    response.sendRedirect("login.html");
%>
