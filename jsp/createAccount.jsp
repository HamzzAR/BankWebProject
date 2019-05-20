<html>

<%@ page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String address = request.getParameter("address");
String gender = request.getParameter("gender");
String account = request.getParameter("account");
String acno ="";

ResultSet rs;
Statement st;

//add the char to regNo according to what is selected
if(account.equals("c")){
	acno+="C";
}else if(account.equals("s")){
	acno+="S";
}
if(gender.equals("m")){
	acno+="M";
}else if(gender.equals("f")){
	acno+="F";
}
Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
st = con.createStatement();
try {
	//rs = st.executeQuery("SELECT MAX(SUBSTRING(acno, 3, 5)) FROM accounts"); //get the max number from bank from acno last 3 chars
    rs = st.executeQuery("SELECT concat('"+acno+"',LPAD((MAX(SUBSTRING(acno, 3, 5))+1),3,'0')) FROM accounts");
    if(rs.next()){
        acno = rs.getString(1);
	}

    if (acno == null) {
        //add the char to regNo according to what is selected
        acno = "";
        if(account.equals("c")){
        	acno+="C";
        }else if(account.equals("s")){
        	acno+="S";
        }
        if(gender.equals("m")){
        	acno+="M";
        }else if(gender.equals("f")){
        	acno+="F";
        }
        acno+="001";
    }

    String query = "insert into accounts values('" + acno+ "','" + name + "','" + address + "')";
    st.executeUpdate(query);
    session.setAttribute("newUserAcno",acno);
    //out.println("Account Successfully created");
        //out.println("null "+acno);
    response.sendRedirect("http://localhost:8080/BankWebProject/html/createPass.html");


}
catch(java.lang.NumberFormatException e){
    out.println(e.toString());
    ///out.println("okkkkkk");
    if (e.toString().equals("java.lang.NumberFormatException: null")) {
        acno+="001";
        //out.println(acno);
        session.setAttribute("newUserAcno",acno);
        st.executeUpdate("insert into accounts values('" + acno+ "','" + name + "','" + address + "')");
        //out.println("Account Successfully Created, First Record");
        response.sendRedirect("http://localhost:8080/BankWebProject/html/createPass.html");

    }
}catch(Exception e) {
    out.println(e.toString());
	out.println("Ops.. Something went wrong buddy. Try again");

    }
%>


</html>
