<%@ page import="java.sql.*"%>
<%
String acc = request.getParameter("accountNumber");
double amt = Double.parseDouble(request.getParameter("amount"));
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
    
    
    String selectQuery = "SELECT * FROM user_reg WHERE acc_num=?";
    PreparedStatement psSelect = con.prepareStatement(selectQuery);
    psSelect.setString(1, acc);
    ResultSet rs = psSelect.executeQuery();
    
    if (rs.next()) {
       
        double currentBalance = rs.getDouble("bal");
        double updatedBalance = currentBalance + amt;
        
        
        String updateQuery = "UPDATE user_reg SET bal=? WHERE acc_num=?";
        PreparedStatement psUpdate = con.prepareStatement(updateQuery);
        psUpdate.setDouble(1, updatedBalance);
        psUpdate.setString(2, acc);
        int rowsAffected = psUpdate.executeUpdate();
        
        if (rowsAffected > 0) {
            
            out.print("Deposit successful!");
        } else {
            
            out.print("Deposit failed. Please try again later.");
        }
    } else {
        
        out.print("Account does not exist. Please check the account number.");
    }
} catch (Exception e) {
    out.print(e);
}
%>
