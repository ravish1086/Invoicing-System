package com.first.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.first.DAO.*;
import com.first.bean.*;


public class InvoiceData extends HttpServlet {
  
	private static final long serialVersionUID = 1L;
public InvoiceData() {
        super();
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	    response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String date=request.getParameter("invoicedate");
        int invoiceno= Integer.parseInt(request.getParameter("invoiceno"));
        
	    String partyname=request.getParameter("partyname");
	    String partygstin=request.getParameter("partygstin");
	    String partysupplystate=request.getParameter("partysupplystate");
	    String partypan=request.getParameter("partypan");
	    String partyphone=request.getParameter("partyphone");
	    String partyadd=request.getParameter("partyadd");
	    float invoicevalue=Float.parseFloat(request.getParameter("invoicevalue"));
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
	    String itemname;
	    boolean c = false;
	    for(int i=1;i<20;i++)
	    {
	    	itemname=request.getParameter("item"+i);
	    	if(itemname==null)
	    		break;
	    	out.print(itemname);
	    	float taxamount=Float.parseFloat(request.getParameter("cgsttaxamt"+i))+Float.parseFloat(request.getParameter("sgsttaxamt"+i));
	    	ItemSaleInfo info=new ItemSaleInfo(invoiceno,date,itemname,request.getParameter("itemhsn"+i),Float.parseFloat(request.getParameter("qty"+i)),Float.parseFloat(request.getParameter("amount"+i)),taxamount,Float.parseFloat(request.getParameter("itemtaxrate"+i)),Float.parseFloat(request.getParameter("amtaftrtax"+i)),Float.parseFloat(request.getParameter("itemunitprice"+i)),request.getParameter("itemuom"+i));
	    	try {
	    		
				c = new ItemSaleInfoContr().setInfo(info);
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	    	
	    }
	    if(c==true)
	    {
	    	out.println("generated");
	    }
	    out.print(invoiceno+"<br>");
	    out.print(partyname+"<br>");
	    out.print(partygstin+"<br>");
	    out.print(partysupplystate+"<br>");
	    out.print(invoicevalue+"<br>");
	    out.print(taxablevalue5+"<br>");
	    out.print(taxablevalue12+"<br>");
	    out.print(taxablevalue18+"<br>");
	    out.print(taxablevalue28+"<br>");
	    out.print(taxtwelve+"<br>");
	    String invoicestatus=new String("active");
	 
	    InvoiceBasicInfo basicinfo=new InvoiceBasicInfo(invoiceno,partyname,partygstin,partysupplystate,date,taxablevalue,invoicevalue,sgstamount,cgstamount,igstamount,invoicestatus);
	    InvoiceInfo invoiceinfo1=new InvoiceInfo(invoiceno,invoiceno,partyname,partygstin,partysupplystate,date,taxablevalue5,invoicevalue,2.5f,2.5f,taxfive,taxfive,igstrate,igstamount,invoicestatus, partypan, partyphone, partyadd);
	    InvoiceInfo invoiceinfo2=new InvoiceInfo(invoiceno,invoiceno,partyname,partygstin,partysupplystate,date,taxablevalue12,invoicevalue,6f,6f,taxtwelve,taxtwelve,igstrate,igstamount,invoicestatus,partypan, partyphone, partyadd);
	    InvoiceInfo invoiceinfo3=new InvoiceInfo(invoiceno,invoiceno,partyname,partygstin,partysupplystate,date,taxablevalue18,invoicevalue,9f,9f,taxeighteen,taxeighteen,igstrate,igstamount,invoicestatus,partypan, partyphone, partyadd);
	    InvoiceInfo invoiceinfo4=new InvoiceInfo(invoiceno,invoiceno,partyname,partygstin,partysupplystate,date,taxablevalue28,invoicevalue,14f,14f,taxtwentyeight,taxtwentyeight,igstrate,igstamount,invoicestatus,partypan, partyphone, partyadd); 
	    boolean b1= new InvoiceInterfaceImplementation().createInvoice(invoiceinfo1);
	    boolean b2= new InvoiceInterfaceImplementation().createInvoice(invoiceinfo2);
	    boolean b3= new InvoiceInterfaceImplementation().createInvoice(invoiceinfo3);
	    boolean b4= new InvoiceInterfaceImplementation().createInvoice(invoiceinfo4);
	    boolean b5= new InvoiceInterfaceImplementation().createInvoice2(basicinfo);
	    
	    if((b1&&b2&&b3)||(b4&&b1&&b5))
	    {
	    	out.println("invoicegenerated");
	    RequestDispatcher rd=request.getRequestDispatcher("generatedinvoice.jsp");
	    rd.forward(request, response);
	    }
	   
	    
	}

}
