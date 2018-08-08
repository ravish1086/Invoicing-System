<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.first.DAO.PartyInterfaceImplementation"%>
<%@page import="com.first.DAO.ItemInterfaceImplementation"%>
<%@page import="com.first.bean.Party" %>
<%@page import="com.first.bean.Item" %>
<%@page import="com.first.DAO.InvoiceInterfaceImplementation" %>
<%@page import="com.first.DAO.ReceivingPayment" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<%
List<Party> list=new PartyInterfaceImplementation().getAll();  

%>
<h2>Enter the Details of payment You Received</h2>

<form action="paymentreceived" method="post">
<table class="table">
<tr><td>Select Customer</td><td><select name="customer" onchange="update(this.value)">
								<option value="0">Select Customer</option>
								<%
								for(Party party:list)
								{
																		
								%>
								<option value="<%=party.getPartyName() %>"><%=party.getPartyName() %></option>
								<%
								}%>
								</select>
								</td></tr>
<tr><td>Enter Payment Date</td><td><input type="text" name="paydate" placeholder="Enter Payment Date"></td></tr>
<tr><td>Select Payment Mode</td><td><select name="mode">
									<option value="cheque">Cheque</option>
									<option value="cash">Cash</option>
									</select></td></tr>
<tr><td>Enter the Payment Details</td><td><input type="text" name="details"></td></tr>
<tr><td>Enter the Amount of Payment Received</td><td><input type="text" name="amount"></td></tr>
								
</table>
<input type="submit" value="Submit Details">
</form>
<p id="info"></p>

<script>
function update(custName)
{
	var xhttp;
    xhttp=new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
    	if(xhttp.readyState == 4 && xhttp.status == 200)
    	{
    		document.getElementById("info").innerHTML = xhttp.responseText;
    	  	
    	}
    };
    console.log(custName);
    
	xhttp.open("GET","customerpaymentinfo.jsp?name="+custName, true);
	xhttp.send();
}
</script>
</body>
</html>