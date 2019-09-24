
package model;

public class Livro {
	
	public int id;
	public String titulo;
	public String Autor;
	public String descriçao;
	public int ano;
	
	
	
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	
	public int getId() {
		return id;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getDescriçao() {
		return descriçao;
		
	}public void setDescriçao(String descriçao) {
		this.descriçao = descriçao;
		
	}public void setAutor(String autor) {
		Autor = autor;
		
	}public String getAutor() {
		return Autor;
	}

}
