<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.first.DAO.InvoiceInterfaceImplementation"%> 
        <%@page import="com.first.bean.InvoiceInfo"%>
            <%@page import="java.util.List"%> 
             <%@page import="java.sql.*"%> 
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
List<InvoiceInfo> invoicelist= new InvoiceInterfaceImplementation().getInvoiceInfo(Integer.parseInt(request.getParameter("invno")));

%>
<%
String date=invoicelist.get(0).getDate();
int invoiceno=(invoicelist.get(0).getInvoiceNO());
String partysupplystate=invoicelist.get(0).getSupplyState();
String rcharge="N";
float invoicevalue=(invoicelist.get(0).getInvoiceValue());
String amountinwords="to be code";
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
String partyname=invoicelist.get(0).getPartyName();
String partygstin=invoicelist.get(0).getPartyGstin();
String partyadd=invoicelist.get(0).getPartyadd();
String partypan=invoicelist.get(0).getPartypan();
String partyphone=invoicelist.get(0).getPartyphone();
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
<div style="height:630px; border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;">
<table class="table-bordered" >
<tr ><td style="border:1px solid black;" >S.No.</td><td style="border:1px solid black; width:45%;">ProductName</td><td style="border:1px solid black;">Hsn</td><td style="border:1px solid black;">TaxRate</td><td style="border:1px solid black;">UnitPrice</td><td style="border:1px solid black;">Quantity</td><td style="border:1px solid black;">Uom</td><td style="border:1px solid black;">TaxableAmount</td><td style="border:1px solid black;">CGST Amount</td><td style="border:1px solid black;">SGST Amount</td><td style="border:1px solid black;">NetAmount</td></tr>
<%
int i=0;
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement ps=con.prepareStatement("select * from itemsalereport where invoiceno=?");
ps.setInt(1,invoiceno);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	i++;
%>
<tr><td style="border-right:1px solid black; border-left:1px solid black;"><%=i %></td><td style="border-right:1px solid black;"><%=rs.getString(3)%></td><td style="border-right:1px solid black;"><%=rs.getString(4)%></td><td style="border-right:1px solid black;"><%=rs.getFloat(8)%></td><td style="border-right:1px solid black;"> <%=rs.getFloat(10)%>  </td><td style="border-right:1px solid black;"><%=rs.getFloat(5)%></td><td style="border-right:1px solid black;"><%=rs.getString(11)%></td><td style="border-right:1px solid black;"><%=rs.getFloat(6)%></td><td style="border-right:1px solid black;"><%=rs.getFloat(7)/2%></td><td style="border-right:1px solid black;"><%=rs.getFloat(7)/2%></td><td style="border-right:1px solid black;"><%=rs.getFloat(9)%></td></tr>
<%

}
%>
<%
for(int j=i;i<20;i++)
{
%>
<tr style="height:28px;"><td style="border-right:1px solid black; border-left:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td><td style="border-right:1px solid black;"></td></tr>

<%

}
con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%></table>
</div>
<!-- end item details -->

<!-- tax part -->
<%
	    float taxablevalue5=invoicelist.get(0).getTaxableValue();
	    float taxablevalue12=invoicelist.get(1).getTaxableValue();
	    float taxablevalue18=invoicelist.get(2).getTaxableValue();
	    float taxablevalue28=invoicelist.get(3).getTaxableValue();
	    float taxablevalue=taxablevalue5+taxablevalue12+taxablevalue18+taxablevalue28;;
	    float taxfive=invoicelist.get(0).getCgstAmt();
	    float taxtwelve=invoicelist.get(1).getCgstAmt();
	    float taxeighteen=invoicelist.get(2).getCgstAmt();
	    float taxtwentyeight=invoicelist.get(3).getCgstAmt();
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


<div style=" border-left:1px solid black; border-right:1px solid black; border-bottom:1px solid black;"><p id="amountwords"  onclick="convertNumberToWords(<%=invoicevalue %>)" onkeydown="convertNumberToWords(<%=invoicevalue %>)"><%=amountinwords %></p></div>

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
	convertNumberToWords(<%=invoicevalue %>);
	window.print();
	document.getElementById("print1").style.visibility="visible";
	document.getElementById("print2").style.visibility="visible";
	}
	function printinvoice2()
	{
	document.getElementById("print1").style.visibility="collapse";
	document.getElementById("print2").style.visibility="collapse";
	convertNumberToWords(<%=invoicevalue %>);
	document.getElementById("head").innerHTML="Duplicate";
	window.print();
	document.getElementById("print1").style.visibility="visible";
	document.getElementById("print2").style.visibility="visible";
	}

	function convertNumberToWords(amount) {
	console.log(amount);
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
    document.getElementById('amountwords').innerHTML= words_string;
    return words_string;
}
</script>
</body>
</html>