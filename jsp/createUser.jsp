<html>

    <%@ page import="java.sql.*"%>

    <%
        Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
        Statement st = con.createStatement();

        String acno = (String)session.getAttribute("newUserAcno");
        String password = request.getParameter("pass");

        try {
            String query = "insert into users values('" + acno+ "','" + password + "',"+1+","+1+")";
            st.executeUpdate(query);
            out.println("User Successfully created");
            response.sendRedirect("http://localhost:8080/BankWebProject/html/login.html");
        } catch(Exception e) {
            e.printStackTrace();
        }


    %>

</html>
