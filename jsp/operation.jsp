<html>


    <%@ page import="java.sql.*"%>

    <%
    String oper = request.getParameter("operation");
    String acno = request.getParameter("acno");

    Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
    Statement st = con.createStatement();

    if (oper.equals("edit")) {

        out.println("<center> <h1>Edit Account Details for "+acno+"</h1> </center>");
        try {

            ResultSet rs = st.executeQuery("select * from accounts where acno='"+acno+"'");
            rs.next();
            %>
            <form action="http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=1&acno=<%= acno %>" method="post">
                Edit Name<br><input type="text" name="name" value="<%= rs.getString(2)%>"><br><br>
                Edit Address<br><input type="text" name="address" value="<%= rs.getString(3)%>"><br><br>
                <input type="submit" value="Save">
            </form>

    <%

        } catch(Exception e) {
            out.print(e.toString());

        }

    }else if(oper.equals("block")){
        response.sendRedirect("http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=2&acno="+acno);
    }else if(oper.equals("delete")){
        response.sendRedirect("http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=3&acno="+acno);
    }else if(oper.equals("unblock")){
        response.sendRedirect("http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=4&acno="+acno);
    }

    %>
</html>
