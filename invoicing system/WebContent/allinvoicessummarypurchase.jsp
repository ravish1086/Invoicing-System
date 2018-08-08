<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.first.DAO.InvoiceInterfaceImplementationPurchase"%> 
        <%@page import="com.first.bean.InvoiceBasicInfo"%>
            <%@page import="java.util.List"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <style type="text/css">
  table,td,tr,th
  {
  border:1px solid black;
  }
  </style>
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
</nav>
<br>
<br><br>
<form action="allinvoicessummarypurchase.jsp">
Date from<input type="date" name="date1" > to Date <input type="date" name="date2">
<input type="submit" value="submit"><br><br>
</form>
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
float suminvoicevalue=new InvoiceInterfaceImplementationPurchase().getSumInvoiceValue(date1, date2);
out.println("Current Summary dated: From "+date1+"  to  "+date2);
%>
<table>
<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>SumInvoiceValue</td><td><%=suminvoicevalue %></td></tr>
<tr><th>Invoice No</th><th>Invoice Date</th><th>Company Name</th><th>Gstin</th><th>Invoice Value</th><th>Total Taxable Value</th><th>CGST</th><th>SGST</th><th>IGST</th><th>Status</th>
</tr>

<%
List<InvoiceBasicInfo> invoicelist= new InvoiceInterfaceImplementationPurchase().getallInvoiceInfo(date1,date2);
if(invoicelist.size()!=0)
{
for(InvoiceBasicInfo list:invoicelist)
{
%>
<tr><td><%=list.getInvoiceNO() %></td>
<td><%=list.getDate() %></td>
<td><%=list.getPartyName() %></td>
<td><%=list.getPartyGstin() %></td>

<td><%=list.getInvoiceValue() %></td>
<td><%=list.getTaxableValue() %></td>



<td><%=list.getSgstAmt() %></td>
<td><%=list.getCgstAmt() %></td>

<td><%=list.getIgstamt() %></td>
<td><%=list.getInvoicestatus() %></td>
</tr>
<%
}
}
%>
</table>

</body>
</html>