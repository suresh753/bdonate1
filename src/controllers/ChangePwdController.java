package controllers;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Authenticator;


public class ChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePwdController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String old_pwd = request.getParameter("old_pwd");
		String new_pwd = request.getParameter("new_pwd");
		RequestDispatcher rd = null;

		Authenticator authenticator = new Authenticator();
		String result = authenticator.changePwd(email,old_pwd, new_pwd);
		if (result=="success") {
			rd = request.getRequestDispatcher("/login.jsp");
		} else {
			rd = request.getRequestDispatcher("/error.jsp");
		}
		rd.forward(request, response);
	}

}