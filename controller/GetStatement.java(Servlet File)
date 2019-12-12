package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;

public class GetStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Model modle=new Model();
		HttpSession session=request.getSession();
		int accno=(int)session.getAttribute("accno");
		modle.setAccno(accno);	
		ArrayList arraylistcredit=new ArrayList();
		ArrayList arraylistdebit=new ArrayList();
		try {
			
			arraylistcredit=modle.getCredit();
			arraylistdebit=modle.getDedit();
			if((arraylistcredit.isEmpty())&&(arraylistdebit.isEmpty()))
			{
				response.sendRedirect("/JPMORGAN/getstatementfail.html");
			}
			else
			{
				session.setAttribute("arraylistcredit",modle.getCredit());
				session.setAttribute("arraylistdedit",modle.getDedit());
				response.sendRedirect("/JPMORGAN/getstatement.jsp");
			}
		} 
		catch (SQLException e) {
	
			e.printStackTrace();
		}
	}

}
