<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.first.DAO.PartyInterfaceImplementationPurchase" %>
    <%@page import="com.first.bean.Party"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("q"));
Party party=new PartyInterfaceImplementationPurchase().searchParty(id);
String partyname=new String();
String partygstin=new String();
String partyphone=new String();
String partyadd=new String();
String partypan=new String();
String partyemail=new String();
String partysupplystate=new String();
%>
<table>
<tr><td>party Name</td><td><input type="text" name="partyname" id="aa" value="<%=party.getPartyName()%>"></td><td>party Gstin</td>
<td><input type="text" name="partygstin" id="bb" value="<%=party.getPartyGstin()%>"></td></tr>
<tr><td>party Address</td><td><input type="text" name="partyadd" id="dd" value="<%=party.getPartyAdd()%>"></td><td>party Pan</td>
<td><input type="text" id="ee" name="partypan" value="<%=party.getPartyPan()%>"></td></tr>
<!--party EmailID<input type="text" id="ff" name="partyemail" value="<%=party.getEmailId()%>"><br>-->
<tr><td>party SupplyState</td><td><input type="text" id="ff" name="partysupplystate" value="<%=party.getSupplyState()%>"></td><td>party Phone</td>
<td><input type="text"  name="partyphone" id="cc" value="<%=party.getPartyPhone()%>"></td></tr>

</table>
</body>
</html>