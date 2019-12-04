package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePasswordFilter implements Filter {
	private int attempt=0;
    
    public ChangePasswordFilter() {
        // TODO Auto-generated constructor stub
    }
	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String opwd=request.getParameter("opwd");
		String npwd=request.getParameter("npwd");
		String cpwd=request.getParameter("cpwd");
		//HttpSession session=((HttpSession)(response)).getSession();
		if(opwd.equals(npwd)==false&&npwd.equals(cpwd)==true)
		{
			chain.doFilter(request, response);
		}
		else
		{
			attempt++;
			if(attempt==3)
			{
				((HttpServletResponse)(response)).sendRedirect("/JPMORGAN/index.html");
			}
			else
			{
				((HttpServletResponse)(response)).sendRedirect("/JPMORGAN/resetfail.html");
			}
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
