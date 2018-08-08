<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.first.bean.Item" %>
    <%@page import="com.first.DAO.ItemInterfaceImplementation" %>
    <%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
Item item=new ItemInterfaceImplementation().searchItem(id);
%>
<%
List<Item> listitem=new ItemInterfaceImplementation().getAll();
int no=Integer.parseInt(request.getParameter("no"));
String itemname=new String();
String amtaftertax=new String();
String cgsttaxamt=new String();
String sgsttaxamt=new String();
String amount=new String();
String itemhsn=new String();
String itemtaxrate=new String();
String itempurchaseprice=new String();
String qty=new String();
String itemuom=new String();
String amtaftrtax=new String();
itemname="item"+no;
cgsttaxamt="cgsttaxamt"+no;
sgsttaxamt="sgsttaxamt"+no;
amtaftertax="amtaftertax"+no;
amount="amount"+no;
itemhsn="itemhsn"+no;
itemtaxrate="itemtaxrate"+no;
itempurchaseprice="itempurchaseprice"+no;
qty="qty"+no;
itemuom="itemuom"+no;
amtaftrtax="amtaftrtax"+no;
%>
<table><tr id="'item'+<%=no%>">
<td ><input style=" width:40px;" type="text" value="<%=no %>"></td>
<td>
<select name="<%=itemname%>"  style = " visibility : visible; width:250px;" onchange="getItem(this.value,<%=no%>)" >
<option value="<%=item.getItemName()%>" ><%=item.getItemName()%></option>
<%
for(Item listitemnew : listitem)
{
%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td>
<td><input style=" width:70px;" type="text" name="<%=itemhsn%>" value="<%=item.getItemHsn()%>"></td>
<td><input  style="width:90px;" id="'taxrate'+<%=no %>" type="text" name="<%= itemtaxrate%>" value="<%=item.getItemTaxRate()%>"></td>
<td><input style="width:150px;" id="'price'+<%=no %>" type="text" name="<%= itempurchaseprice%>" value="<%=item.getItemPurchasePrice()%>"></td>
<td><input style="width:70px;" type="text" name="<%=qty%>" id="'qty'+<%=no %>" onkeyup="calculate1(this.value,<%=no%>,<%=item.getItemPurchasePrice()%>,<%=item.getItemTaxRate()%>)"></td>
<td><input style=" width:70px;" type="text" name="<%=itemuom%>" value="<%=item.getItemUoM()%>"></td>
<td><input style=" width:125px;" type="text" name="<%= amount%>" id="<%=amount%>"></td>
<td><input style=" width:100px;" type="text" name="<%=cgsttaxamt %>" id="<%=cgsttaxamt%>"></td>
<td><input style=" width:100px;" type="text" name="<%=sgsttaxamt %>" id="<%=sgsttaxamt%>"></td>
<td><input style=" width:180px;" type="text" name="<%=amtaftrtax %>" id="<%=amtaftertax%>"></td>


</tr></table>

<script type="text/javascript" defer>
var qty=[20];
var price=[20];
var amount=[20];
var amtaftrtx=[20];
var taxamt=[20];
for(var k=0;k<=19;k++)
{
	qty[k]=0;
	price[k]=0;
	amount[k]=0;
	amtaftrtx[k]=0;
	taxamt[k]=0;
}
function getItem(str,ide)
{
	var xhttp;
	xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4 && xhttp.status == 200)
			{
			document.getElementById("item"+ide).innerHTML=xhttp.responseText;
			console.log("iff");
			}
		
	};
	console.log("no iff");
   xhttp.open("GET","viewpurchaseitem.jsp?id="+str+"&no="+ide,true);
   xhttp.send();

}
function calculate1(quantity,i,itemprice,taxrate)
{	
	var j;
	var finalamount;
	finalamount=0;
	
	
	 qty[i]=quantity;
	 price[i]=itemprice;
	 console.log(qty[i]);
	 console.log(price[i]);
	 console.log(taxrate+"%");
	 amount[i]=qty[i]*price[i];
	 console.log(amount[i]);
	taxamt[i]=(amount[i]*taxrate)/100;
	amtaftrtx[i]=amount[i]+taxamt[i];
	console.log(taxamt[i]);
	console.log(amtaftrtx[i]);
	console.log(i)
	document.getElementById("cgsttaxamt"+i).value = taxamt[i]/2;
	document.getElementById("sgsttaxamt"+i).value = taxamt[i]/2;
	document.getElementById("amtaftertax"+i).value =amtaftrtx[i];
	
	for(j=1;j<20;j++)
	{
		finalamount=finalamount+amtaftrtx[j];
	}
	document.getElementById("finalamount").value=finalamount;
}

</script>


</body>
