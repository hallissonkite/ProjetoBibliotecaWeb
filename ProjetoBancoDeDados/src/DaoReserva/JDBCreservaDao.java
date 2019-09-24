package DaoReserva;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Bean.reservaBean;
import ConectionFactory.ConnectionFactory;

public class JDBCreservaDao implements reservaDao{
	reservaBean r= new reservaBean();

	Connection connection;
	public JDBCreservaDao() {
		connection=ConnectionFactory.getConnection();
	}
	
	@Override
	public void inserir(reservaBean reserva) {
		try { 
			String SQL="INSERT INTO reserva(id_usuario,cod_exemplar) VALUES "+"(?,?)" ;
			 
				PreparedStatement ps=connection.prepareStatement(SQL);
				ps.setInt(1, reserva.getId_usuario());
				ps.setInt(2, reserva.getCod_exemplar());
				ps.executeUpdate();
				ps.close();
				connection.close();
				
				
			} catch (SQLException ex) {
				Logger.getLogger(JDBCreservaDao.class.getName()).log(Level.SEVERE,null,ex);
			}
	}
	
	@Override
	public void remover(int id_usuario,int cod_exemplar) {
		try { 
			String SQL="DELETE FROM  reserva WHERE id_usuario= id_usuario='"+id_usuario+"'and cod_exemplar='"+cod_exemplar+"'";
			 
				PreparedStatement ps=connection.prepareStatement(SQL);
				ps.setInt(1, r.getId_usuario());
				ps.setInt(2, r.getCod_exemplar());
				ps.executeUpdate();
				ps.close();
				connection.close();
				
				
			} catch (SQLException ex) {
				Logger.getLogger(JDBCreservaDao.class.getName()).log(Level.SEVERE,null,ex);
			}
		
		
	}

	@Override
	public boolean validarReserva(int id_usuario, int cod_exemplar) throws Exception{
		String SQL="SELECT * FROM reserva WHERE id_usuario='"+id_usuario+"'and cod_exemplar='"+cod_exemplar+"'";
		PreparedStatement statement= connection.prepareStatement(SQL);
		ResultSet resulSet=statement.executeQuery();
		if(resulSet.next()) {
			return true;
		}else {
			
			return false;
		}
	}
	@Override
	public void descrever(String titulo) throws SQLException {
		String SQL="SELECT descricao FROM livro  WHERE titulo="+titulo;
		PreparedStatement statement= connection.prepareStatement(SQL);
		ResultSet resulSet=statement.executeQuery();
		

		
	}

}
	

	