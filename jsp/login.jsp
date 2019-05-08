<html>

<%@ page import="java.sql.*"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
try {
    Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    String query = "select * from users where acno ='"+username+"' and password='"+password+"'";

    ResultSet rs = st.executeQuery(query);
    if (rs.next()) {
        String query2 = "select * from accounts where acno ='"+username+"'";
        ResultSet rs2 = st2.executeQuery(query2);
        int admin = 0;
        if (rs.getInt(3) == admin) {
            session.setAttribute("username",username);
            session.setAttribute("role",admin);
            if (rs2.next()) {
                session.setAttribute("name",rs2.getString(2));
                response.sendRedirect("admin.jsp");
            }

        }else{
            if (rs.getInt(4) == 0) {
                out.println("You have been blocked. Please contact your admin.");
            }else{
                session.setAttribute("username",username);
                session.setAttribute("role",1);
                session.setAttribute("name",rs2.getString(2));
                //response.sendRedirect("userPage.jsp");
            }
        }
    }
} catch(Exception e) {
    out.println(e.toString());
	out.println("Ops.. Something went wrong buddy. Try again");

    }
%>

</html>
