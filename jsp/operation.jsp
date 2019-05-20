<html>


    <%@ page import="java.sql.*"%>

    <%
    String oper = request.getParameter("operation");
    String acno = request.getParameter("acno");

    String name = request.getParameter("name");
    String address = request.getParameter("address");
    // String edit = request.getParameter("edit");

    String acnoFromAdmin = request.getParameter("acnoEdit");

    Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
    Statement st = con.createStatement();

    if (oper.equals("edit")) {
        response.sendRedirect("http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=1&name="+name+"&address="+address+"&acno="+acnoFromAdmin);

    }else if(oper.equals("block")){
        response.sendRedirect("http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=2&acno="+acno);
    }else if(oper.equals("delete")){
        response.sendRedirect("http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=3&acno="+acno);
    }else if(oper.equals("unblock")){
        response.sendRedirect("http://localhost:8080/BankWebProject/jsp/operationDone.jsp?operation=4&acno="+acno);
    }

    %>
</html>
