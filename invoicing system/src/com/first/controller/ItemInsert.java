package com.first.controller;

import com.first.DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.first.bean.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ItemInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemInsert() {
        super();
        
    }
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	 PrintWriter out =	response.getWriter();
	 response.setContentType("text/html");
	 int itemid=Integer.parseInt(request.getParameter("itemid"));
	 String itemname=request.getParameter("itemname");
	 String itemhsn=request.getParameter("itemhsn");
	int itemtaxrate=Integer.parseInt(request.getParameter("itemtaxrate"));
	float itemunitprice=Float.parseFloat(request.getParameter("itemunitprice"));
	float itempurchaseprice=Float.parseFloat(request.getParameter("itempurchaseprice"));
	String itemuom =request.getParameter("itemuom");
	Item item=new Item(itemid,itemname,itemhsn,itemtaxrate,itemunitprice,itemuom,itempurchaseprice);
	boolean b=false;
	try {
		b = new ItemInterfaceImplementation().insertItem(item);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(b){
		out.println("iteminserted");
		response.sendRedirect("insertitem.jsp");
	}
		else
		out.print("error occured");
	out.println(itemid+" ");
	out.println(itemname+" ");
	out.println(itemhsn+" ");
	out.println(itemtaxrate+" ");
	out.println(itemunitprice+" ");
	out.println(itemuom+" ");
	
	}

}
