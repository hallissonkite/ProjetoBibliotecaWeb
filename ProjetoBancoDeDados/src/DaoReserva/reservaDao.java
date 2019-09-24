package DaoReserva;

import Bean.reservaBean;

public interface reservaDao {
	public void inserir(reservaBean reserva);
	public void remover(int id_exemplar,int cod_exemplar);	
	public boolean validarReserva(int id_exemplar,int cod_exemplar) throws Exception;
    public void descrever(String titulo)throws Exception;

}
