package br.com.auditoria.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.auditoria.beans.UserAccount;
import br.com.auditoria.utils.DBUtils;
import br.com.auditoria.utils.MyUtils;
import br.com.auditoria.utils.PasswordUtils;

@WebServlet(urlPatterns = { "/createUser" })
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateUserServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/createUserView.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);

		String userName = (String) request.getParameter("name");
		String gender = (String) request.getParameter("gender");
		String password = (String) request.getParameter("password");

		UserAccount user = new UserAccount();
		user.setGender(gender);
		user.setUserName(userName);
		//Insecure
//		user.setPassword(password);
		
		//Secure
		String salt = PasswordUtils.getSalt(20);
		String securedPassword = PasswordUtils.generateSecurePassword(password, salt);
		user.setPassword(securedPassword);
		user.setSalt(salt);
		
		String errorString = null;

		if (errorString == null) {
			try {

				DBUtils.insertUser(conn, user);

			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
		}

		request.setAttribute("errorString", errorString);
		request.setAttribute("user", user);

		if (errorString != null) {
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/createUserView.jsp");
			dispatcher.forward(request, response);
		}

		else {
			response.sendRedirect(request.getContextPath() + "/userInfo");
		}
	}

}
