package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;

public class ChangePassword extends HttpServlet {
	int attempt=0;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1=request.getSession();
		Model model=new Model();
		model.setAccno((int)session1.getAttribute("accno"));
		model.setPwd(request.getParameter("opwd"));
		boolean value;
		try {
			value=model.changePassword(request.getParameter("npwd"));
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
