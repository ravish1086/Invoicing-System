package com.first.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.first.DAO.ItemInterfaceImplementation;
import com.first.bean.Item;

/**
 * Servlet implementation class EditItem
 */
public class EditItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	PrintWriter out = response.getWriter();
	response.setContentType("text/html");
	
	int itemid=Integer.parseInt(request.getParameter("itemid"));
	String itemname=request.getParameter("itemname");
	 String itemhsn=request.getParameter("itemhsn");
	int itemtaxrate=Integer.parseInt(request.getParameter("itemtaxrate"));
	float itemunitprice=Float.parseFloat(request.getParameter("itemunitprice"));
	String itemuom =request.getParameter("itemuom");
	float itempurchaseprice=Float.parseFloat(request.getParameter("itempurchaseprice"));
	out.println(itemid);
	Item item=new Item(itemid,itemname,itemhsn,itemtaxrate,itemunitprice,itemuom,itempurchaseprice);
	boolean b=false;
	try {
		b = new ItemInterfaceImplementation().updateItem(item);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(b)
	{
		response.sendRedirect("insertitem.jsp");
	}
	else
		out.print("some error occured");

	
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
