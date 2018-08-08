<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.first.bean.Party" %> 
    <%@page import="com.first.DAO.PartyInterfaceImplementationPurchase" %>
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
  <style type="text/css">
    input[type=text], select {
	    width: 50%;
	    padding: 4px 14px;
	    margin: 2px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	input[type=email], select {
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
    width: 74%;
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
}</style>
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
int partyid=new PartyInterfaceImplementationPurchase().generateId();
%>
<h2 align="center">Insert Customer Details Here</h2>
<form action="partypurchaseinsert" method="post">
<table class="table">
<tr><td><h4>Party id:</h4></td><td><input type="text" name="partyid" value="<%=partyid%>" readonly ></td></tr>
<tr><td><h4>Party Gstin:</h4></td><td><input type="text" name="partygstin" ></td></tr>
<tr><td><h4>Party Name:</h4></td><td><input type="text" name="partyname"></td></tr>
<tr><td><h4>Party Phno:</h4></td><td><input type="text" name="partyphone"></td></tr>
<tr><td><h4>Party Add:</h4></td><td><input type="text" name="partyadd"></td></tr>
<tr><td><h4>Party PAN:</h4></td><td><input type="text" name="partypan"></td></tr>
<tr><td><h4>Party Email:</h4></td><td><input type="email" name="partyemail"></td></tr>
<tr><td><h4>Party SupplyState:</h4></td><td><input type="text" name="partysupplystate"></td></tr>
</table>
<input type="submit" value="Submit"></form>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
<%
List<Party> list=new PartyInterfaceImplementationPurchase().getAll();
if(list.size()!=0)
{
%>
<div class="table-responsive">
<table class="table table-striped" id="myTable">
<thead class="thead-dark"><tr>
<th>PartyId</th>
<th>PartyGstin</th>
<th>PartyName</th>
<th>PartyPhno</th>
<th>PartyAdd</th>
<th>PartyPan</th>
<th>PartyEmail</th>
<th>PartySupplyState</th></tr></thead>
<%
for(Party  list2 : list)
{
%>
<tr>
<td><%=list2.getPartyId() %></td>
<td><%=list2.getPartyGstin() %></td>
<td><%=list2.getPartyName() %></td>
<td><%=list2.getPartyPhone() %></td>
<td><%=list2.getPartyAdd() %></td>
<td><%=list2.getPartyPan() %></td>
<td><%=list2.getEmailId() %></td>
<td><%=list2.getSupplyState()%></td>
<td><a href="editpurchaseparty.jsp?partyid=<%=list2.getPartyId()%>">edit</a></td><td><a href="deletepurchaseparty?partyid=<%=list2.getPartyId()%>">/delete</a></td>
</tr>
<%
}
}
else
{
	out.println("nothing to display");
}
%>
</table>
</div>
<script>
function myFunction() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
</script>
</body>
</html>