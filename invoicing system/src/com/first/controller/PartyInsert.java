package com.first.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.first.bean.*;
import com.first.DAO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PartyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PartyInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		int partyid=Integer.parseInt(request.getParameter("partyid"));
		String partygstin=request.getParameter("partygstin");
		String partyname=request.getParameter("partyname");
		String partyphone=request.getParameter("partyphone");
		String partyadd=request.getParameter("partyadd");
		String partypan=request.getParameter("partypan");
		String partyemail=request.getParameter("partyemail");
		String partysupplystate=request.getParameter("partysupplystate");
		
		Party party=new Party(partyid,partygstin,partyname,partyphone,partyadd,partypan,partyemail,partysupplystate);
		 
		Boolean b=false;
		try {
			b = new PartyInterfaceImplementation().insertParty(party);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(b)
		{
			response.sendRedirect("InsertParty.jsp");
		}
		else
		{
			out.print("Some Error Occured");
		}
		
	}

}
