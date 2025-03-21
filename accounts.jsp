<%@ page import="java.sql.*" %>
<%
			try
			  {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
				
				String qry="select * from user_reg";
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(qry);

			    out.print("<center>");
				out.print("<table border='1'>");
				out.print("<tr>");
				out.print("<td>ACC_NUM</td>");
				out.print("<td>NAME</td>");
				out.print("<td>AGE</td>");
				out.print("<td>ADDRESS</td>");
				out.print("<td>GENDER</td>");
				out.print("<td>PHONE NUMBER</td>");
				out.print("<td>ACC_TYPE</td>");
			
                out.print("<td>PWD</td>");
				out.print("<td>CPWD</td>");
                out.print("<td>BALANCE</td>");
                out.print("</tr>");
                   
                  

					
				while(rs.next())
				{
					out.print("<tr>");
                   out.print("<td>"+rs.getString(1)+"</td>");
					out.print("<td>"+rs.getString(2)+"</td>");
                    out.print("<td>"+rs.getInt(3)+"</td>");
                    out.print("<td>"+rs.getString(4)+"</td>");
					out.print("<td>"+rs.getString(5)+"</td>");
                    out.print("<td>"+rs.getInt(6)+"</td>");
                    out.print("<td>"+rs.getString(7)+"</td>");
					out.print("<td>"+rs.getString(8)+"</td>");
                    out.print("<td>"+rs.getString(9)+"</td>");
                    out.print("<td>"+rs.getInt(10)+"</td>");

                    out.print("</tr>");
					out.print("<br>");
					
				
				}
				 
				out.print("</table>");
				 out.print("<a href=\"manager.html\" class=\"back-button\"><button>BACK</button></a>");

				out.print("</center>");

				con.close();

			  }
			  catch (Exception e)
			  {
				  out.print(e);
			  } 

			  
              
         
%>