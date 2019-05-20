# BankWebProject

**Instructions**

- All the **Connection** code must be changed accordingly.
  This line of code must be changed "Connection con =                    DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");"
  and it exists in almost every jsp file.

- Run indexMain.html which will redirect you to index.jsp which is the start page.
  If it doesn't open, make sure to unblock **popups** for that window
- to access root account, add a user to **users** table manually with role as **0** 
  and acno as **'[accountType][gender]000'** then you can login to the admin account 
  with those details.
  
- Role in users table: 0-admin, 1-normal user
- Active in users table: 1-active account, 0-blocked account
