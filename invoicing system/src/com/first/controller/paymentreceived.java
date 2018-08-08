package com.first.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.first.bean.*;
import com.first.DAO.*;
/**
 * Servlet implementation class paymentreceived
 */
public class paymentreceived extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentreceived() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String custName=request.getParameter("customer");
		String date=request.getParameter("paydate");
		String mode=request.getParameter("mode");
		String details=request.getParameter("details");
		float amountreceived=Float.parseFloat(request.getParameter("amount"));
		Payment payment=new Payment(custName,date,mode,details,amountreceived);
		boolean b=new ReceivingPayment().PaymentDetails(payment);
		
		out.println(custName);
		out.println(date);
		out.println(mode);
		out.println(details);
		out.println(amountreceived);
		if(b)
		{
		response.sendRedirect("receivedpayment.jsp");
		}
		else
		{
			out.println("some error occured");
		}
	}

}
