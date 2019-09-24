package Banco;



public class acessoBanco {
	public String login;
	public String senha;
	
	
	public boolean validarLogin(String login,String senha) {
		if(login.equalsIgnoreCase("Hallisson kite") && senha.equalsIgnoreCase("hallissonkite123")) {
			return true;
		}else {
			return false;
		}
		
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
	
}