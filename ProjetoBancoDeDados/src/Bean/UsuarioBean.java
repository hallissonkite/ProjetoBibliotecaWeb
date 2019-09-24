package Bean;

import java.io.Serializable;

public class UsuarioBean implements  Serializable {
	
		private int id;
		private String pnome;
		private String email;
		private String logim;
		private String senha;
		private int nivel;	
		private String _status;
		
		public UsuarioBean() {
			
		}
		
		
		public void setLogim(String logim) {
			this.logim = logim;
		}
		
		public void setNivel(int nivel) {
			this.nivel = nivel;
		}
		public void setPnome(String pnome) {
			this.pnome = pnome;
		}
		
		
		public void setId(int id) {
			this.id = id;
		}
		
		
		public String getEmail() {
			return email;
		}
		
		public void setSenha(String senha) {
			this.senha = senha;
		}
		
		public String getLogim() {
			return logim;
		}
		
		public String getPnome() {
			return pnome;
		}
		
		public String getSenha() {
			return senha;
		}
		
		public void set_status(String _status) {
			this._status = _status;
		}
		
		public void setEmail(String email) {
			this.email = email;
		}
		
		public int getId() {
			return id;
		}
		
		public int getNivel() {
			return nivel;
		}
		
		public String get_status() {
			return _status;
		}
	}



