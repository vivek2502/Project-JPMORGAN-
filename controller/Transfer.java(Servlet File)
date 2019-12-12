package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;

public class Transfer extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
				Model modle=new Model();
				HttpSession session=request.getSession();
				int accno=(int)session.getAttribute("accno");
				modle.setAccno(accno);	
				
				if(modle.transfer1((int)Integer.parseInt(request.getParameter("rcvno")),(int)Integer.parseInt(request.getParameter("amount"))))
				{
					if(modle.transfer2((int)Integer.parseInt(request.getParameter("rcvno")),(int)Integer.parseInt(request.getParameter("amount"))))
						response.sendRedirect("/JPMORGAN/transfersuccess.html");
					else
						response.sendRedirect("/JPMORGAN/transferfail.html");
				}	
				else
				{
					response.sendRedirect("/JPMORGAN/transferfail.html");
				}
				
			}
		catch (Exception e) 
		{
			response.sendRedirect("/JPMORGAN/transferfail.html");
			e.printStackTrace();
		}
	}
}
