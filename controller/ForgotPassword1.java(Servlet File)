package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;

/**
 * Servlet implementation class ForgotPassword1
 */
public class ForgotPassword1 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Model modle=new Model();
		String npwd=request.getParameter("npwd");
		String cpwd=request.getParameter("cpwd");
		HttpSession session2=request.getSession();
		modle.setEmail((String)session2.getAttribute("email"));
		boolean value;
		try {
			value=modle.forgotPassword(npwd);
			if(value)
			{
				response.sendRedirect("/JPMORGAN/resetsuccess.html");
			}
				else
				
					response.sendRedirect("/JPMORGAN/resetfail.html");
		}
		catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}	
	}

}
