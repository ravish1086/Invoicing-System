package com.first.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.first.DAO.PartyInterfaceImplementation;
import com.first.bean.Party;

/**
 * Servlet implementation class PartyEdit
 */
public class PartyEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartyEdit() {
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
		int partyid=Integer.parseInt(request.getParameter("partyid"));
		String partygstin=request.getParameter("partygstin");
		String partyname=request.getParameter("partyname");
		String partyphone=request.getParameter("partyphone");
		String partyadd=request.getParameter("partyadd");
		String partypan=request.getParameter("partypan");
		String partyemail=request.getParameter("partyemail");
		String partysupplystate=request.getParameter("partysupplystate");
		
		Party party=new Party(partyid,partygstin,partyname,partyphone,partyadd,partypan,partyemail,partysupplystate);
		 
		boolean b=false;
		try {
			b = new PartyInterfaceImplementation().updateParty(party);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(b)
		{
			out.println("item updated Successfully");
			response.sendRedirect("InsertParty.jsp");
		}
		else
		{
			out.println("some error occured");
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
