<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.first.DAO.ReceivingPayment" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String custName=request.getParameter("name");
float invoiceamount=new ReceivingPayment().CustomerInvoiceAmount(custName);

float paymentamount=new ReceivingPayment().CustomerPaymentAmount(custName);
float balance;

balance=invoiceamount-paymentamount;
%>
<table class="table">
<tr><th>Total Amount generated</th><th>Total Payment Received</th><th>Balance</th></tr>
<tr><td><%=invoiceamount %></td><td><%=paymentamount %></td><td><%=balance %></td></tr>
</table>
</body>
</html>