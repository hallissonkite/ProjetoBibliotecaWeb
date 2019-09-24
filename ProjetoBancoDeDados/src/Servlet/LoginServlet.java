package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DaoLogin.DaoLogin;

/**

 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
	
	DaoLogin daoLogin= new DaoLogin();
	
    public LoginServlet() {
        super();
       
    }
    
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
	
		String login =request.getParameter("login");
		String senha=request.getParameter("senha");
		
		
		
		
		
		if(daoLogin.validarLogin(login,senha)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Menu.html");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("AcessoNegado.jsp");
			dispatcher.forward(request, response);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}

	}
}
