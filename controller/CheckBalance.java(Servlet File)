package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;

public class CheckBalance extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Model modle=new Model();
			HttpSession session=request.getSession();
			int accno=(int)session.getAttribute("accno");
			modle.setAccno(accno);		
			boolean value=modle.checkBalance();
			if(value)
			{
				session.setAttribute("balance",modle.getBalance());
				response.sendRedirect("/JPMORGAN/balance.jsp");
			}	
			else
				response.sendRedirect("/JPMORGAN/loginfail.html");
			} 
		catch (Exception e) {
			response.sendRedirect("/JPMORGAN/loginfail.html");
				e.printStackTrace();
			}
	}
}
