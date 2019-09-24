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


@WebServlet("/reservaServlet")
public class reservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	reservaBean reserv=new reservaBean();
    JDBCreservaDao reserva= new JDBCreservaDao();
    public reservaServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int id_usuario = reserv.getId_usuario();
			int cod_exemplar = reserv.getCod_exemplar();
			
		
		
		
		
		if(reserva.validarReserva(id_usuario, cod_exemplar)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("LivroReservado.html");
			dispatcher.forward(request, response);
		}else {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ReservaRealizada.html");
			dispatcher.forward(request, response);
			
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}

	}

}
