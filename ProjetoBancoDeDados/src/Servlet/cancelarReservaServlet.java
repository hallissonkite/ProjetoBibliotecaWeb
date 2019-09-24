package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Banco.acessoBanco;
import Bean.reservaBean;
import DaoReserva.JDBCreservaDao;


@WebServlet("/cancelarReservaServlet")
public class cancelarReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	reservaBean reserv=new reservaBean();
    JDBCreservaDao reserva= new JDBCreservaDao();
    public cancelarReservaServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int id_exemplar=reserv.getId_usuario();
			int cod_exemplar=reserv.getCod_exemplar();
			
			reserva.remover(id_exemplar,cod_exemplar);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ReservaCancelada.html");
			dispatcher.forward(request, response);
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}

	}

}
