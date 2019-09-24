package DaoLogin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ConectionFactory.ConnectionFactory;

public class DaoLogin {
	private Connection connection;
	
	public DaoLogin() {
		connection=ConnectionFactory.getConnection();
	}
	
	public boolean validarLogin(String logim,String senha) throws Exception{
		String SQL="SELECT * FROM usuario WHERE logim='"+logim+"'and senha='"+senha+"'";
		PreparedStatement statement= connection.prepareStatement(SQL);
		ResultSet resulSet=statement.executeQuery();
		if(resulSet.next()) {
			return true;
		}else {
			return false;
		}
		
	}
}
