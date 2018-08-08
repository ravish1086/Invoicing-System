<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="com.first.DAO.PartyInterfaceImplementation"%>
    <%@page import="com.first.bean.Party"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
List<Party> partylist=new PartyInterfaceImplementation().getAll(); 
int i=0;
String name1=request.getParameter("selectcustomer");
System.out.println(name1);
if(name1==null)
{
name1="ravi";
}
%>
<form action="CustomerTransactions.jsp">
<select name="selectcustomer">
<option value="0">Select Customer</option>
<%
for(Party party : partylist)
{ 
%>
<option value="<%=party.getPartyName()%>" ><%=party.getPartyName() %></option>
<%
}
%>
</select>
<input type="submit">
</form>
<table class="table table-striped">
<tr><td>Party Name</td><td>Date</td><td>Amount</td><td>InvoiceStatus/Cheque</td></tr>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement ps=con.prepareStatement("select basicinvoiceinfo.partyname,basicinvoiceinfo.dated,basicinvoiceinfo.invoicevalue,invoicestatus from basicinvoiceinfo where partyname=? union select name,dated,amount,paymode from payment where name=? ORDER BY DATED");
ps.setString(1,name1);
ps.setString(2,name1);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	if(rs.getString(4).equals("active"))
	{
%>
	<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getFloat(3) %></td><td>Invoice Status :<%=rs.getString(4) %></td></tr>	
<%
  	}
	else{
%>
		<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getFloat(3) %></td><td>Payment Received via : <%=rs.getString(4) %></td></tr>

<%
		}
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</table>

</body>
</html>