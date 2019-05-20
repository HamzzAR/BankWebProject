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
    String query2 = "select * from accounts where acno ='"+username+"'";
    ResultSet rs2 = st2.executeQuery(query2);
    if (rs.next()) {
        int admin = 0;
        if (rs.getInt(3) == admin) {
            session.setAttribute("username",username);
            session.setAttribute("role",admin);
            response.sendRedirect("http://localhost:8080/BankWebProject/jsp/admin.jsp");

        }else{
            if (rs.getInt(4) == 0) {
                out.println("You have been blocked. Please contact your admin.");
            }else{
                session.setAttribute("username",username);
                session.setAttribute("role",1);
                response.sendRedirect("http://localhost:8080/BankWebProject/jsp/userInfo.jsp");
            }
        }
    }else{
        response.sendRedirect("http://localhost:8080/BankWebProject/html/index.jsp?do=t");
    }
} catch(Exception e) {
    out.println(e.toString());
	out.println("Ops.. Something went wrong buddy. Try again");

    }
%>

<style>
.alert {
  padding: 20px;
  background-color: green;
  color: white;
  margin-top: 80px;
  width: 30%;
}
</style>

</html>
