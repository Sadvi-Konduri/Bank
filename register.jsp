
<%@ page import="java.sql.*" %>

<%

		String acc_num = request.getParameter("acc_num");
		String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		String gen = request.getParameter("gen");
		long phno = Long.parseLong(request.getParameter("phno"));
        String acc_type= request.getParameter("acc_type");
        String pwd = request.getParameter("pwd");
        String cpwd = request.getParameter("cpwd");
		int bal = Integer.parseInt(request.getParameter("bal"));

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

			String qry = "insert into user_reg values(?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(qry);

			pstmt.setString(1,acc_num);
			pstmt.setString(2,name);
			pstmt.setInt(3,age);
			pstmt.setString(4,addr);
			pstmt.setString(5,gen);
		    pstmt.setLong(6,phno);
            pstmt.setString(7,acc_type);
			pstmt.setString(8,pwd);
			pstmt.setString(9,cpwd);
            pstmt.setInt(10,bal);
			pstmt.executeUpdate();
			        out.print("<font color='white' size='4'>Registered Successfully</font>");
%>
			
	     <jsp:include page="login.html"/>
<%
			con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}
%>