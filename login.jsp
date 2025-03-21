<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    String acc_num = request.getParameter("account number");
    String pass = request.getParameter("password");   
    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");

        String qry = "select * from user_reg where acc_num=? and pwd=?";
        st = con.prepareStatement(qry);
        st.setString(1, acc_num);
        st.setString(2, pass);
        rs = st.executeQuery();

        if(rs.next()) {
            Cookie ck = new Cookie("acc", acc_num);
            response.addCookie(ck);
            response.sendRedirect("ls.html");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("login.html");
            rd.include(request, response);
        }
    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
%>



