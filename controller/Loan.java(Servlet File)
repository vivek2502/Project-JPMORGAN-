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

public class Loan extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		response.setContentType("image/jpeg"); 
		Model model=new Model();
		model.setAccno((int)session.getAttribute("accno"));
		String photo=request.getParameter("photo");
		String sign=request.getParameter("sign");
		String aadhar=request.getParameter("aadhar");
		String pan=request.getParameter("pan");
		
		try {
			boolean value=model.setDetails(photo,sign,aadhar,pan);
			if(value)
				response.sendRedirect("/JPMORGAN/loanrequestsuccessful.html");
			else
				response.sendRedirect("/JPMORGAN/loanrequestfail.html");
		} catch (SQLException e) {
			response.sendRedirect("/JPMORGAN/loanrequestfail.html");
			e.printStackTrace();
		}
	}

}
