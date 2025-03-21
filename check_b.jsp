<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   String acc = request.getParameter("accountNumber");

    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
    
    
    String selectQuery = "SELECT bal FROM user_reg WHERE acc_num=?";
    PreparedStatement psSelect = con.prepareStatement(selectQuery);
    psSelect.setString(1, acc);
    ResultSet rs = psSelect.executeQuery();
        

        if (rs.next()) {
            out.println("Balance: " + rs.getDouble("bal"));
        } else {
            out.println("Account not found.");
        }

        rs.close();
        psSelect.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
