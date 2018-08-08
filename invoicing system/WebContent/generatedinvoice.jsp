<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
p
{
padding:0px;
margin:0px;
}
td
{
border-right:1px solid black;
}
</style>
</head>
<body>
<p id="head" >ORIGINAL</p>
<!-- Top part of invoice containing owner details -->
<div style="border: 1px solid black">
<h2 align="center">ABC Enterprices</h2>
<h4 align="center">A/312 XYZ Nagar , Agra</h4>
<div></div>
<div align="center" >Mob No.:XXXXXXXXXX</div><div align="center"><button align="center" id="print1"onclick="printinvoice1()">Print Original</button><button align="center" id="print2" onclick="printinvoice2()">Print Duplicate</button></div><div align="center" >Email: abc@gmail.com</div>
<div align="center">Gstn:09AHUPS1459K1DR</div><div align="center">PAN:AHUP1459K</div>
</div>
<!-- END owner details -->

<!-- date invoice no etc... -->
<%
String date=request.getParameter("invoicedate");
int invoiceno= Integer.parseInt(request.getParameter("invoiceno"));
String partysupplystate=request.getParameter("partysupplystate");
String rcharge="N";
String invoicevalue=request.getParameter("invoicevalue");
String amountinwords=request.getParameter("amountinwords");
%>
<div style="border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black; ">
<div style=" display:inline-block; width:50%; border-right:1px solid black;">

<p>Invoice No:<%=invoiceno %></p>
<p>Invoice Date:<%=date %></p>

</div>

<div style=" display:inline-block;">

<p>Supply State:<%=partysupplystate %></p>
<p>Reverse Charge:<%=rcharge %></p>

</div>
</div>
<!-- end of date... -->

<!-- Customer Details -->
<%
String partyname=request.getParameter("partyname");
String partygstin=request.getParameter("partygstin");
String partyadd=request.getParameter("partyadd");
String partypan=request.getParameter("partypan");
String partyphone=request.getParameter("partyphone");
%>
<div style="border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;">
<div  style="display:inline-block; width:50%; align:left; border-right:1px solid black;">

<p>Billed To:</p>
<p><%=partyname %></p>
<p><%=partyadd %></p>
</div>

<div style=" display:inline-block;  align:right;">

<p>Gstin:<%=partygstin %></p>
<p>Pan:<%=partypan %></p>
<p>Mob:<%=partyphone %></p>
</div>
</div>
<!-- end Customer details -->

<!-- item details -->
<div style="height:650px; border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;">
<table class="table-bordered" >
<tr ><td style="border:1px solid black;" >S.No.</td><td style="border:1px solid black; width:45%;">ProductName</td><td style="border:1px solid black;">Hsn</td><td style="border:1px solid black;">TaxRate</td><td style="border:1px solid black;">UnitPrice</td><td style="border:1px solid black;">Quantity</td><td style="border:1px solid black;">Uom</td><td style="border:1px solid black;">TaxableAmount</td><td style="border:1px solid black;">CGST Amount</td><td style="border:1px solid black;">SGST Amount</td><td style="border:1px solid black;">NetAmount</td></tr>
<%
int i;
for(i=1;i<20;i++)
{
	String item=(request.getParameter("item"+i));
	if(item==null){
		break;
	}
%>
<tr><td style="border-right:1px solid black; border-left:1px solid black;"><%=i %></td><td style="border-right:1px solid black;"><%=item %></td><td style="border-right:1px solid black;"><%=request.getParameter("itemhsn"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("itemtaxrate"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("itemunitprice"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("qty"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("itemuom"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("amount"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("cgsttaxamt"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("sgsttaxamt"+i)%></td><td style="border-right:1px solid black;"><%=request.getParameter("amtaftrtax"+i)%></td></tr>
<%

}
%>
<%
for(int j=i;i<22;i++)
{
%>
<tr style="height:28px;"><td style="border-right:1px solid black; border-left:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td></tr>

<%

}
%></table>
</div>
<!-- end item details -->

<!-- tax part -->
<%
	    float taxablevalue5=Float.parseFloat(request.getParameter("taxable5"));
	    float taxablevalue12=Float.parseFloat(request.getParameter("taxable12"));
	    float taxablevalue18=Float.parseFloat(request.getParameter("taxable18"));
	    float taxablevalue28=Float.parseFloat(request.getParameter("taxable28"));
	    float taxablevalue=taxablevalue5+taxablevalue12+taxablevalue18+taxablevalue28;
	    float taxfive=Float.parseFloat(request.getParameter("taxfive"))/2;
	    float taxtwelve=Float.parseFloat(request.getParameter("taxtwelve"))/2;
	    float taxeighteen=Float.parseFloat(request.getParameter("taxeighteen"))/2;
	    float taxtwentyeight=Float.parseFloat(request.getParameter("taxtwentyeight"))/2;
	    float sgstamount=taxfive+taxtwelve+taxeighteen+taxtwentyeight;
	    float cgstamount=taxfive+taxtwelve+taxeighteen+taxtwentyeight; 
	    float igstrate=0;
	    float igstamount=0;
%>	   
<div style=" border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;"><div ></div><div><p style="text-align:right;">Invoice Value:<%=invoicevalue %></p></div></div> 
<div style=" border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;">
<table>
<tr><td style="border-bottom:1px solid black;">Rate</td><td style="border-bottom:1px solid black;">TaxableAmount</td><td style="border-bottom:1px solid black;">CGST Amount</td><td style="border-bottom:1px solid black;">SGST Amount</td></tr>
<%
if(taxablevalue5!=0)
{
%>
<tr><td>5%</td><td><%=taxablevalue5 %></td><td><%=(taxfive) %></td><td><%=(taxfive) %></td></tr>
<%
}
%>

<%
if(taxablevalue12!=0)
{
%>
<tr><td>12%</td><td><%=taxablevalue12 %></td><td><%=(taxtwelve) %></td><td><%=(taxtwelve) %></td></tr>
<%
}
%>

<%
if(taxablevalue18!=0)
{
%>
<tr><td>18%</td><td><%=taxablevalue18 %></td><td><%=(taxeighteen) %></td><td><%=(taxeighteen) %></td></tr>
<%
}
%>

<%
if(taxablevalue28!=0)
{
%>
<tr><td>5%</td><td><%=taxablevalue28 %></td><td><%=(taxtwentyeight) %></td><td><%=(taxtwentyeight) %></td></tr>
<%
}
%>
<tr style="border-top:1px solid black;"><td style="border-top:1px solid black;">Total</td><td style="border-top:1px solid black;"><%=taxablevalue %></td><td style="border-top:1px solid black;"><%=cgstamount %></td><td style="border-top:1px solid black;"><%=sgstamount %></td></tr>
</table>
</div>
<!-- end tax part -->


<div style=" border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;"><p><%=amountinwords %></p></div>

<!-- invoice bottom part -->
<div style=" border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;">
<div style="display:inline-block; width:50%; align:left; border-right:1px solid black;">
<p>Terms and conditions :<br>
E.&.O.E.<br>
1.All claims to be settled in Agra.<br>
2.Goods once sold will not  be taken back.<br>
3.Subject to Agra jurisdiction only.<br><br><br><br>
Received By:
</div>
<div style=" display:inline-block;  align:right;">
<p>For ABC Company</p><br><br><br><br><br><br><br>
<p>Authorised Signatory</p>
</div>
</div>

<!--end bottom invoice -->
<script type="text/javascript">
function printinvoice1()
{
document.getElementById("print1").style.visibility="collapse";
document.getElementById("print2").style.visibility="collapse";
document.getElementById("head").innerHTML="Original";
window.print();
document.getElementById("print1").style.visibility="visible";
document.getElementById("print2").style.visibility="visible";
}
function printinvoice2()
{
document.getElementById("print1").style.visibility="collapse";
document.getElementById("print2").style.visibility="collapse";
document.getElementById("head").innerHTML="Duplicate";
window.print();
document.getElementById("print1").style.visibility="visible";
document.getElementById("print2").style.visibility="visible";
}
</script>

</body>
</html>