<%@ page import="java.sql.*"%>
<%

String amount = request.getParameter("amount");
String transaction = request.getParameter("t");
String acno = (String)session.getAttribute("username");
try {
    Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
    Statement st = con.createStatement();
    if (transaction.equals("d")) {
        int inserted = st.executeUpdate("insert into transactions values('" + acno+ "'," + Integer.parseInt(amount) + ",'d',now())");
        if (inserted > 0) {
            //out.println("Deposit Successful");
            response.sendRedirect("http://localhost:8080/BankWebProject/jsp/userInfo.jsp");
        }else{
            out.println("Something went wrong");
        }
    }else{
        int inserted2 = st.executeUpdate("insert into transactions values('" + acno+ "'," + Integer.parseInt(amount) + ",'w',now())");
        if (inserted2 > 0) {
            //out.println("Withdraw Successful");
            response.sendRedirect("http://localhost:8080/BankWebProject/jsp/userInfo.jsp");
        }else{
            out.println("Something went wrong");
        }
    }
} catch(Exception e) {
    out.println(e.toString());
}



%>
