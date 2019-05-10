
<%@ page import="java.sql.*"%>

<%
String operation = request.getParameter("operation");
String acno = request.getParameter("acno");
try {


    Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
    Statement st = con.createStatement();
    if (operation.equals("1")) { //this is for edit
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        if (!name.equals("") && !address.equals("")) {
            String updateRow = "UPDATE accounts SET name='"+name+"', address='"+address+"' WHERE acno='"+acno+"'";
            if (st.executeUpdate(updateRow) > 0) {
                response.sendRedirect("http://localhost:8080/BankWebProject/jsp/admin.jsp");
            }else{
            }
        }
    }else if (operation.equals("2")) { //this is for block

        int result = st.executeUpdate("update users set active=0 where acno='"+acno+"'");
        if (result > 0) {
            //out.println("<center style='padding-top:300'> <h1>"+acno+" account has been Blocked"+"</h1> </center>");
            response.sendRedirect("http://localhost:8080/BankWebProject/jsp/admin.jsp");
        }else{
            out.println("<center style='padding-top:300'> <h1>"+acno+" account has NOT been Blocked"+"</h1> </center>");
        }
    }else if (operation.equals("3")) { //this is for delete
        int result = st.executeUpdate("DELETE FROM accounts WHERE  acno='"+acno+"'");
        int result2 = st.executeUpdate("DELETE FROM users WHERE  acno='"+acno+"'");
        int result3 = st.executeUpdate("DELETE FROM transactions WHERE  acno='"+acno+"'");
        if (result > 0 && result2 > 0 && result3 > 0) {
            response.sendRedirect("http://localhost:8080/BankWebProject/jsp/admin.jsp");
        }else{
            out.println("<center style='padding-top:300'> <h1>"+acno+" account has NOT been Deleted"+"</h1> </center>");
        }
    }else if (operation.equals("4")) { //this is for unblocking
        int result = st.executeUpdate("update users set active=1 where acno='"+acno+"'");
        if (result > 0) {
            response.sendRedirect("http://localhost:8080/BankWebProject/jsp/admin.jsp");
        }else{
            out.println("<center style='padding-top:300'> <h1>"+acno+" account has NOT been Unblocked"+"</h1> </center>");
        }
    }
}catch(Exception e){
    e.printStackTrace();
}

%>
