package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;

public class Login extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Model modle=new Model();
			modle.setUser(request.getParameter("user"));
			modle.setPwd(request.getParameter("pwd"));			
				boolean value=modle.login();
				if(value)
				{
					HttpSession session=request.getSession(true);
					session.setAttribute("accno",modle.getAccno());
					
					response.sendRedirect("/JPMORGAN/home.html");
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
