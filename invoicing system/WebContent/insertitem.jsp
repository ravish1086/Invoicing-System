<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.first.DAO.ItemInterfaceImplementation"%>
<%@page import="com.first.bean.Item"%>
<%@page import="java.util.*"%>
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

<h2 align="center">Insert The Item Here</h2>
<%
int itemid=new ItemInterfaceImplementation().generateId();
%><div>
<form action="ItemInsert" method="post" >
<table class="table"><tr><td>

<h4>ItemId</h4></td><td><input type="text" name="itemid" value="<%=itemid %>" readonly></td></tr>

<tr><td><h4>ItemName</h4></td><td><input type="text" name="itemname" ></td></tr>

<tr><td><h4>ItemHsn</h4></td><td><input type="text" class="form-control" name="itemhsn" ></td></tr>

<tr><td><h4>ItemTaxRate</h4></td><td><input type="text" name="itemtaxrate" ></td></tr>
<tr><td><h4>ItemUnitPrice(sales)</h4></td><td><input type="text" name="itemunitprice" ></td></tr>

<tr><td><h4>ItemUnitPrice(Purchase)</h4></td><td><input type="text" name="itempurchaseprice" ></td></tr>
<tr><td><h4>ItemUom</h4></td><td><input type="text" name="itemuom" ></td></tr>
<tr><td></td></tr>
</table>
<input type="submit" value="insert item">
</form>

</div>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">


<div class="table-responsive">
<table class="table table-striped" id="myTable">
<%
List<Item> list=new ItemInterfaceImplementation().getAll();
if(list.size()!=0)
{	
%>
<thead class="thead-dark">
<tr><th>ItemId</th><th>ItemName</th><th>ItemHsn</th><th>ItemTaxRate</th><th>ItemUnitPrice(sales)</th><th>ItemUom</th><th>ItemUnitPrice(Purchase)</th></tr>
</thead>
<%
for(Item item: list)
{
%>
<tr>
<td><%=item.getItemId()%></td>
<td><%=item.getItemName()%></td>
<td><%=item.getItemHsn() %></td>
<td><%=item.getItemTaxRate()%></td>
<td><%=item.getItemUnitPrice() %></td>
<td><%=item.getItemUoM() %></td>
<td><%=item.getItemPurchasePrice() %></td>
<td><a href="deleteitem?itemid=<%=item.getItemId()%>">delete</a></td><td><a href="edititem.jsp?itemid=<%=item.getItemId()%>">edit</a></td>
</tr>
<%
}
}
else
out.print("nothing to display");
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
	    td = tr[i].getElementsByTagName("td")[1];
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