package DaoUsuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Bean.UsuarioBean;
import ConectionFactory.ConnectionFactory;


public class JDBCDaoUsuario implements DaoUsuario{
	
	Connection connection;
	public JDBCDaoUsuario() {
		connection=ConnectionFactory.getConnection();
	}
	
	
	@Override
	public void inserir(UsuarioBean usuario) {
		try { 
		String SQL="INSERT INTO usuario(id,pnome,email,logim,senha,nivel,_status) VALUES "+"(?,?,?,?,?,?,?)" ;
		 
			PreparedStatement ps=connection.prepareStatement(SQL);
			ps.setInt(1, usuario.getId());
			ps.setString(2, usuario.getPnome());
			ps.setString(3, usuario.getEmail());
			ps.setString(4, usuario.getLogim());
			ps.setString(5, usuario.getSenha());
			ps.setInt(6,usuario.getNivel());
			ps.setString(7, usuario.get_status());
			ps.executeUpdate();
			ps.close();
			connection.close();
			
			
		} catch (SQLException ex) {
			Logger.getLogger(JDBCDaoUsuario.class.getName()).log(Level.SEVERE,null,ex);
		}
	}

	@Override
	public void remover(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UsuarioBean> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UsuarioBean buscar(int id) {
		String SQL="SELECT * FROM usuario where logim= ?,senha=?";
		return null;
	}

	@Override
	public void editar(UsuarioBean usuario) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public boolean verificarLogin(UsuarioBean usuario) {
		// TODO Auto-generated method stub
		return false;
	}

}
