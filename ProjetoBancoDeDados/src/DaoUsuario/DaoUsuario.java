package DaoUsuario;



import java.util.List;

import Bean.UsuarioBean;


public interface DaoUsuario {
	public void inserir(UsuarioBean usuario);
	public void remover(int id);	
	public List<UsuarioBean> listar();
	public UsuarioBean buscar(int id);
	public void editar(UsuarioBean usuario);
	public boolean verificarLogin(UsuarioBean usuario);
	
	

}	
