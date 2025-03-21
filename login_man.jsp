
<%@ page import="java.sql.*" %>

<%
String un = request.getParameter("name");
	String pd = request.getParameter("pwd");
	try
	{
		
		
			  

			  if(un.equals("Sadhvi") && pd.equals("sadhvi123"))
			 {
				
                    Cookie ck1 = new Cookie("unman", un);
                   response.addCookie(ck1);
                   response.sendRedirect("manager.html");
        } 
		else {
            RequestDispatcher rd = request.getRequestDispatcher("login_man.html");
            rd.include(request, response);
        }
}
	catch(Exception e)
	{
		out.print(e);
	}
	
%>