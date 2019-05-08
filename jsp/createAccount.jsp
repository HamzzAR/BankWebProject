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
out.println("before connection");
Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
st = con.createStatement();
out.println("after connection");
try {
	rs = st.executeQuery("SELECT MAX(SUBSTRING(acno, 3, 5)) FROM accounts"); //get the max number from bank from acno last 3 chars
    if(rs.next()){
		String maxNo = rs.getString(1);
		if(Integer.parseInt(maxNo)>=99){  //if maxNo >= 99 then we dont need to add any 0s before it
			acno+=Integer.parseInt(maxNo)+1; //because we can only have a 3 digit number
		}else if(Integer.parseInt(maxNo)>=9){  // if its a 2 digit number add 1 zero before it
			acno+="0"+(Integer.parseInt(maxNo)+1);
		}else{
			acno+="00"+(Integer.parseInt(maxNo)+1); // if its a 1 digit number add 2 zero before it
		}
	}
    String query = "insert into accounts values('" + acno+ "','" + name + "','" + address + "')";
    st.executeUpdate(query);
    out.println("Account Successfully created");


}catch(java.lang.NumberFormatException e){
    out.println("NumberFormatException");
        try {
            acno+="001";
            st.executeUpdate("insert into accounts values('" + acno+ "','" + name + "','" + address + "')");
            out.println("Account Successfully Created, First Record");

        } catch (SQLException e1) {
            e1.printStackTrace();
        }
    }
    catch(Exception e) {
    out.println(e.toString());
	out.println("Ops.. Something went wrong buddy. Try again");

    }
%>


</html>
