package DaoUsuario;

public class FactoryDao {
	
	public static DaoUsuario createDaoUsuario() {
		return new JDBCDaoUsuario();
	}

}
