<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.first.DAO.PartyInterfaceImplementationPurchase"%>
<%@page import="com.first.DAO.ItemInterfaceImplementation"%>
<%@page import="com.first.bean.Party" %>
<%@page import="com.first.bean.Item" %>
<%@page import="com.first.DAO.InvoiceInterfaceImplementationPurchase" %>
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

<button onclick="addItem(i)">Add Item</button><br>
<form action="invoicedatapurchase" method="post">

<!-- party related code -->
<%List<Party> list=new PartyInterfaceImplementationPurchase().getAll();  
int invoiceno=new InvoiceInterfaceImplementationPurchase().getNextInvoiceNo();
%>
<table>
<tr><td>Invoice NO:</td><td><input type="text" name="invoiceno" value="<%=invoiceno%>"></td></tr>
<tr><td>Date:</td><td><input type="text" id="date" name="invoicedate"></td></tr>
</table>
<select name="selected" onchange="showCustomer(this.value)" >
<option value="0" >Select Customer</option>
<%
for(Party list2: list)
{
%>
<option  value="<%=list2.getPartyId() %>"><%=list2.getPartyName() %> </option>
<%}%>
</select><br>
<p id="aa">select then show</p>

<!-- item related code -->
<%
List<Item> listitem=new ItemInterfaceImplementation().getAll();
%>

<div>
<table class="table-bordered table-hover">
<tr><th>S.No.</th><th>ItemName</th><th>ItemHsn</th><th>ItemTaxRate</th><th>ItemUnitPrice(purchase)</th><th>Quantity</th><th>ItemUom</th><th>TaxableAmount</th><th>CGSTAmount</th><th>SGSTAmount</th><th>NetAmount</th></tr>

<!-- ------------------------------------------------------------------- -->
<tr id="item1"><td> </td><td>
<select id="select1" name="itemname1" style="visibility: collapse;" onchange="getItem2(this.value,1)">
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem)
{
%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<!-- ------------------------------------------------------------------- -->

<tr id="item2"><td> </td><td>
<select id="select2" style="visibility: collapse;" onchange="getItem2(this.value,2)">
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem)
{
%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item3" ><td> </td><td><!--select 3-->
<select style="visibility: collapse;" id="select3" onchange="getItem2(this.value,3)">
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%></select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td> </tr>
<tr id="item4" ><td> </td><td><select id="select4" style="visibility: collapse;" onchange="getItem2(this.value,4)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr id="item5" ><td> </td><td><select id="select5" style="visibility: collapse;" onchange="getItem2(this.value,5)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item6" ><td> </td><td><select id="select6" style="visibility: collapse;" onchange="getItem2(this.value,6)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr id="item7" ><td> </td><td><select id="select7" style="visibility: collapse;" onchange="getItem2(this.value,7)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr id="item8" ><td> </td><td><select id="select8" style="visibility: collapse;" onchange="getItem2(this.value,8)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr id="item9" ><td> </td><td>
<select id="select9" style="visibility: collapse;" onchange="getItem2(this.value,9)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr id="item10" ><td> </td><td><select id="select10" style="visibility: collapse;" onchange="getItem2(this.value,10)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr id="item11" ><td> </td><td><select id="select11" style="visibility: collapse;" onchange="getItem2(this.value,11)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
<tr id="item12" ><td> </td><td><select id="select12" style="visibility: collapse;" onchange="getItem2(this.value,12)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item13" ><td> </td><td><select id="select13" style="visibility: collapse;" onchange="getItem2(this.value,13)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item14" ><td> </td><td><select id="select14" style="visibility: collapse;" onchange="getItem2(this.value,14)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item15" ><td> </td><td><select id="select15" style="visibility: collapse;" onchange="getItem2(this.value,15)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item16" ><td> </td><td><select id="select16" style="visibility: collapse;" onchange="getItem2(this.value,16)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item17" ><td> </td><td><select id="select17" style="visibility: collapse;" onchange="getItem2(this.value,17)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item18" ><td> </td><td><select id="select18" style="visibility: collapse;" onchange="getItem2(this.value,18)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>

<tr id="item19" ><td> </td><td><select id="select19" style="visibility: collapse;" onchange="getItem2(this.value,19)" >
<option value="0">Select Item</option>
<%
for(Item listitemnew : listitem){%>
<option value="<%=listitemnew.getItemId()%>"><%=listitemnew.getItemName() %></option>
<%}%>
</select></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>


<tr><td></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td></td><td>Total Amount</td><td><input type="text" name="invoicevalue" id="finalamount" style="align:right;"></td></tr>
<tr><td></td></tr>
</table>
</div>



<br>
<input type="text"  name="amountinwords" value="Amount In words" id="amtwords" style="width:1280px;">
<table>

<tr><td>Total Taxable Amount</td><td><input type="text" name="taxablevalue" id="totaltaxableamount"></td></tr>

<tr><td>Total Taxable 5%</td><td><input type="text" id="taxable5" name="taxable5"></td><td>Tax 5%</td><td><input type="text" name="taxfive" id="taxfive"  ></td></tr>
<tr><td>Total Taxable 12%</td><td><input type="text" id="taxable12" name="taxable12"></td><td>Tax 12%</td><td><input type="text" name="taxtwelve" id="taxtwelve" ></td></tr>
<tr><td>Total Taxable 18%</td><td><input type="text" id="taxable18" name="taxable18"></td><td>Tax 18%</td><td><input type="text" name="taxeighteen" id="taxeighteen" ></td></tr>
<tr><td>Total Taxable 28%</td><td><input type="text" id="taxable28" name="taxable28"></td><td>Tax 28%</td><td><input type="text" name="taxtwentyeight" id="taxtwentyeight" ></td></tr>
</table>
<input type="submit" value="Generate Invoice">
</form>
<script type="text/javascript">
   var today=new Date();
	var date =today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
	document.getElementById('date').value=date;
	</script>
	<script type="text/javascript">
var qty=[20];
var price=[20];
var amount=[20];
var amtaftrtx=[20];
var taxamt=[20];
var taxfive=[20];
var taxtwelve=[20];
var taxeighten=[20];
var taxtwentyeight=[20];
var taxablefive=[20];
var taxabletwelve=[20];
var taxableeighteen=[20];
var taxabletwentyeight=[20];
for(var k=0;k<20;k++)
{
	qty[k]=0;
	price[k]=0;
	amount[k]=0;
	amtaftrtx[k]=0;
	taxamt[k]=0;
	taxfive[k]=0;
	taxtwelve[k]=0;
	taxeighteen[k]=0;
	taxtwentyeight[k]=0;
	 taxablefive[k]=0;
	 taxabletwelve[k]=0;
	 taxableeighteen[k]=0;
	 taxabletwentyeight[k]=0;
}
var i=1;
var index=1;

function getItem2(str,n){
    var xhttp;
    xhttp=new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
    	if(xhttp.readyState == 4 && xhttp.status == 200)
    	{
    		document.getElementById("item"+n).innerHTML = xhttp.responseText;
    	  	
    	}
    };
    console.log(str);
    console.log(n);
	xhttp.open("GET","viewpurchaseitem.jsp?id="+str+"&no="+n, true);
	xhttp.send(); }

function showCustomer(str) {
	  var xhttp; 
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	    document.getElementById("aa").innerHTML = xhttp.responseText;
	    }
	  };
	  xhttp.open("GET","viewpurchaseparty.jsp?q="+str, true);
	  xhttp.send();
	}
	
	
function addItem(locali){
document.getElementById("select"+locali).style.visibility="visible";
    i=i+1;   }
    
    
function getItem(str,ide)
    {
    	var xhttp;
    	xhttp=new XMLHttpRequest();
    	xhttp.onreadystatechange=function(){
    		if(xhttp.readyState==4&&xhttp.status==200)
    			{
    			document.getElementById("item"+ide).innerHTML=xhttp.responseText;
    			}
    		
    	};
    	console.log(str);
        console.log(ide);
       xhttp.open("GET","viewpurchaseitem.jsp?id="+str+"&no="+ide,true);
       xhttp.send();
    
    }
    



function changeTag()
{
	document.getElementById("try").innerHTML="<input type='text' name='ravi' value='trial' >";
}

function calculate1(quantity,i,itemprice,taxrate)
{	
	var tax5=0;
	var tax12=0;
	var tax18=0; 
	var tax28=0;
	var taxable5=0;
	var taxable12=0;
	var taxable18=0; 
	var taxable28=0;
	var taxamount=0;
	var j;
	var finalamount,ttltxblamt;
	finalamount=0;
	ttltxblamt=0;
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
	taxamount=taxamt[i];
	document.getElementById("amount"+i).value = amount[i];
	//document.getElementById("taxamt"+i).value = taxamt[i];
	document.getElementById("cgsttaxamt"+i).value = taxamt[i]/2;
	document.getElementById("sgsttaxamt"+i).value = taxamt[i]/2;
	document.getElementById("amtaftertax"+i).value =amtaftrtx[i];
	for(j=1;j<20;j++)
	{
		finalamount=finalamount+amtaftrtx[j];
		ttltxblamt= ttltxblamt+amount[j];
	}
	document.getElementById("totaltaxableamount").value=ttltxblamt;
	if(taxrate==5)
	{
	taxablefive[i]=amount[i];
	taxfive[i]=taxamount;
	taxtwelve[i]=0;
	taxeighteen[i]=0;
	taxtwentyeight[i]=0;
	
	taxabletwelve[i]=0;
	taxableeighteen[i]=0;
	taxabletwentyeight[i]=0;
	}
	else if(taxrate==12)
	{  
		taxabletwelve[i]=amount[i];
		taxtwelve[i]=taxamount;
		taxeighteen[i]=0;
		taxtwentyeight[i]=0;
		taxfive[i]=0;
		
		taxableeighteen[i]=0;
		taxabletwentyeight[i]=0;
		taxablefive[i]=0;
	}
	else if(taxrate==18)
	{
		taxableeighteen[i]=amount[i];
	taxeighteen[i]=taxamount;
	taxtwentyeight[i]=0
	taxfive[i]=0;
	taxtwelve[i]=0;
	
	taxabletwentyeight[i]=0
	taxablefive[i]=0;
	taxabletwelve[i]=0;
	}
	else if(taxrate==28)
	{
		taxabletwentyeight[i]=amount[i];
	taxtwentyeight[i]=taxamount;
	taxfive[i]=0;
	taxtwelve[i]=0;
	taxeighteen[i]=0;
	
	taxablefive[i]=0;
	taxabletwelve[i]=0;
	taxableeighteen[i]=0;
	
	}
        for(j=1;j<20;j++)
        	{
        	tax5=tax5+taxfive[j];
        	tax12=tax12+taxtwelve[j];
        	tax18=tax18+taxeighteen[j];
        	tax28=tax28+taxtwentyeight[j];
        	taxable5=taxable5+taxablefive[j];
        	taxable12=taxable12+taxabletwelve[j];
        	taxable18=taxable18+taxableeighteen[j];
        	taxable28=taxable28+taxabletwentyeight[j];
        	}
	
	document.getElementById("finalamount").value=finalamount;
	var amountwords=convertNumberToWords(finalamount);
	console.log(amountwords);
	document.getElementById("amtwords").value=amountwords;
	document.getElementById("taxfive").value=tax5;
	document.getElementById("taxtwelve").value=tax12;
	document.getElementById("taxeighteen").value=+tax18;
	document.getElementById("taxtwentyeight").value=tax28;
	
	document.getElementById("taxable5").value=taxable5;
	document.getElementById("taxable12").value=taxable12;
	document.getElementById("taxable18").value=taxable18;
	document.getElementById("taxable28").value=taxable28;
	
}
function convertNumberToWords(amount) {
    var words = new Array();
    words[0] = '';
    words[1] = 'One';
    words[2] = 'Two';
    words[3] = 'Three';
    words[4] = 'Four';
    words[5] = 'Five';
    words[6] = 'Six';
    words[7] = 'Seven';
    words[8] = 'Eight';
    words[9] = 'Nine';
    words[10] = 'Ten';
    words[11] = 'Eleven';
    words[12] = 'Twelve';
    words[13] = 'Thirteen';
    words[14] = 'Fourteen';
    words[15] = 'Fifteen';
    words[16] = 'Sixteen';
    words[17] = 'Seventeen';
    words[18] = 'Eighteen';
    words[19] = 'Nineteen';
    words[20] = 'Twenty';
    words[30] = 'Thirty';
    words[40] = 'Forty';
    words[50] = 'Fifty';
    words[60] = 'Sixty';
    words[70] = 'Seventy';
    words[80] = 'Eighty';
    words[90] = 'Ninety';
    amount = amount.toString();
    var atemp = amount.split(".");
    var number = atemp[0].split(",").join("");
    var n_length = number.length;
    var words_string = "";
    if (n_length <= 9) {
        var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
        var received_n_array = new Array();
        for (var i = 0; i < n_length; i++) {
            received_n_array[i] = number.substr(i, 1);
        }
        for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
            n_array[i] = received_n_array[j];
        }
        for (var i = 0, j = 1; i < 9; i++, j++) {
            if (i == 0 || i == 2 || i == 4 || i == 7) {
                if (n_array[i] == 1) {
                    n_array[j] = 10 + parseInt(n_array[j]);
                    n_array[i] = 0;
                }
            }
        }
        value = "";
        for (var i = 0; i < 9; i++) {
            if (i == 0 || i == 2 || i == 4 || i == 7) {
                value = n_array[i] * 10;
            } else {
                value = n_array[i];
            }
            if (value != 0) {
                words_string += words[value] + " ";
            }
            if ((i == 1 && value != 0) || (i == 0 && value != 0 && n_array[i + 1] == 0)) {
                words_string += "Crores ";
            }
            if ((i == 3 && value != 0) || (i == 2 && value != 0 && n_array[i + 1] == 0)) {
                words_string += "Lakhs ";
            }
            if ((i == 5 && value != 0) || (i == 4 && value != 0 && n_array[i + 1] == 0)) {
                words_string += "Thousand ";
            }
            if (i == 6 && value != 0 && (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
                words_string += "Hundred and ";
            } else if (i == 6 && value != 0) {
                words_string += "Hundred ";
            }
        }
        words_string = words_string.split("  ").join(" ");
    }
    return words_string;
}


    

</script>
</body>
</html>