
package model;

public class Livro {
	
	public int id;
	public String titulo;
	public String Autor;
	public String descri�ao;
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
	
	public String getDescri�ao() {
		return descri�ao;
		
	}public void setDescri�ao(String descri�ao) {
		this.descri�ao = descri�ao;
		
	}public void setAutor(String autor) {
		Autor = autor;
		
	}public String getAutor() {
		return Autor;
	}

}
