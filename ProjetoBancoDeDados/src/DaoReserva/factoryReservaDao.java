package DaoReserva;

public class factoryReservaDao {
	
	public static reservaDao createreservaDao() {
		return new JDBCreservaDao();
		
	}
	

}
