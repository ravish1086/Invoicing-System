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
 * Servlet implementation class ItemDelete
 */
public class ItemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDelete() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		response.setContentType("text/html");
		  PrintWriter out=response.getWriter();
		  int itemid = Integer.parseInt(request.getParameter("itemid"));
		boolean b=false;
		try {
			b = new ItemInterfaceImplementation().deleteItem(itemid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(b)
		{
			response.sendRedirect("insertitem.jsp");
		}
		else
		{
			out.println("some error occured.. try again");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		
	}

}
