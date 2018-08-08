package com.first.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.first.DAO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteParty
 */
public class DeletePurchaseparty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePurchaseparty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	PrintWriter out=response.getWriter();
	response.setContentType("text/html");
	int partyid=Integer.parseInt(request.getParameter("partyid"));
	boolean b=false;
	try {
		b = new PartyInterfaceImplementationPurchase().deleteParty(partyid);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(b)
	{
		System.out.println("item Deleted Successfully");
		response.sendRedirect("InsertPurchaseParty.jsp");
	}
	else{
		System.out.println("some error occured");
		out.print("error");
	}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
