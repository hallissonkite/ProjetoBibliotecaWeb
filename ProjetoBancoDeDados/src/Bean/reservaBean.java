package Bean;

import java.io.Serializable;

public class reservaBean implements  Serializable {
	UsuarioBean us=new UsuarioBean();
	
	
	public int id_usuario;
	public int cod_exemplar;
	
	

	public reservaBean() {
		
	}
	
	public void setCod_exemplar(int cod_exemplar) {
		this.cod_exemplar = cod_exemplar;
	}
	public int getCod_exemplar() {
		return cod_exemplar;
	}
	public int getId_usuario() {
		return id_usuario;
	}public void setId_usuario(int id) {
		this.id_usuario= id;
	}
}
