package model;

import Bean.UsuarioBean;
import DaoUsuario.DaoUsuario;
import DaoUsuario.FactoryDao;

public class principal {

	public static void main(String[] args) {
		UsuarioBean us= new UsuarioBean();
		us.setId(7);
		us.setPnome("sepassa");
		us.setEmail("sepassa@hotmail.com");
		us.setLogim("sepassademasi");
		us.setSenha("sepassa123");
		us.setNivel(1);
		us.set_status("A");
		DaoUsuario du=FactoryDao.createDaoUsuario();
		du.inserir(us);
		
	}

}
