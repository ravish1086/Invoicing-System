<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
  <style>
  input[type=text], select {
	    width: 50%;
	    padding: 4px 14px;
	    margin: 2px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	input[type=date] {
	    width: 50%;
	    padding: 4px 14px;
	    margin: 2px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
  div {
	    border-radius: 5px;
	}
	input[type=submit] {
    width: 76%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    align:center;
}
#myInput {
 
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}
	</style>
</head>
<body>

<nav class="navbar  bg-dark navbar-dark fixed-top navbar-inverse" >
<div class="container-fluid">

      <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
       
      </button>
      <a class="navbar-brand" href="#">WebSiteName</a>
  
<div class="collapse navbar-collapse" id="collapsibleNavbar">
<ul class="nav navbar-nav">
<li><a href="insertitem.jsp"class="navbar-brand">AddItem  details or View Item details and edit details</a></li>
<li><a href="InsertParty.jsp" class="navbar-brand">AddPArty  details or view party Details edit details</a></li>
<li><a href="invoice.jsp" class="navbar-brand">create invoice</a></li>
<li><a href="viewsummary.jsp" class="navbar-brand">all invoice summary for gstr1</a></li>
<li ><a href="allinvoicessummary.jsp" class="navbar-brand">all invoice summary for gst3b</a></li>
<li ><a href="receivedpayment.jsp" class="navbar-brand">Payment details</a></li>
<li ><a href="allinvoicessummarypurchase.jsp" class="navbar-brand">allinvoicessummarypurchaseb</a></li>
<li ><a href="InsertPurchaseParty.jsp" class="navbar-brand">InsertPurchaseParty</a></li>
<li ><a href="itempurchasehsnwise.jsp" class="navbar-brand">itempurchasehsnwise</a></li>
<li ><a href="itemsaleshsnwise.jsp" class="navbar-brand">itemsaleshsnwise</a></li>
<li ><a href="purchaseinvoice.jsp" class="navbar-brand">purchaseinvoice</a></li>
<li ><a href="viewsummarypurchase.jsp" class="navbar-brand">viewsummarypurchase</a></li>

</ul>
</div>
</div>
</nav><br><br><br>
<h2 align="center">HsnWise Summary</h2>
<form action="itempurchasehsnwise.jsp">
Date from<input type="date" name="date1" > to Date <input type="date" name="date2">
<input type="submit" value="submit"><br><br>
<table class="table">
<tr><td style="font-weight: bold;">Hsn</td><td style="font-weight: bold;">Sum_Quantity</td><td style="font-weight: bold;">Sum_TAX</td><td style="font-weight: bold;">Sum_Taxable</td><td style="font-weight: bold;">Sum_NetAmount</td></tr>

<%
String date1="2018-04-1";
String date2="2019-03-31";
String datein1=request.getParameter("date1");
String datein2=request.getParameter("date2");

System.out.println(date1);
System.out.println(date2);
if(datein1!=null&&datein2!=null){
	date1=datein1;
	date2=datein2;
	System.out.println(date1);
	System.out.println(date2);
}
out.println(date1+"  to  "+date2);
%>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;
PreparedStatement ps=null;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	
	ps=con.prepareStatement("select hsn,sum(quantity),sum(taxamount),sum(taxablevalue),sum(netamount) from itempurchasereport where dated between to_date(?,'yyyy-mm-dd') And to_date(?,'yyyy-mm-dd') group by hsn");
	ps.setString(1,date1);
	ps.setString(2,date2);
	rs=ps.executeQuery();


		while(rs.next())
			{
%>
			<tr><td><%=rs.getString(1)%></td><td><%=rs.getFloat(2)%></td><td><%=rs.getFloat(3)%></td><td><%=rs.getFloat(4)%></td><td><%=rs.getFloat(5)%></td></tr>
<% 			}
	}
	catch(Exception e)
		{
			e.printStackTrace();
		}
	finally
	{
		con.close();
	}


%>
</table>

</body>
</html>