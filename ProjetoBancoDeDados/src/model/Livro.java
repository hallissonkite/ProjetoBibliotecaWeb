
package model;

public class Livro {
	
	public int id;
	public String titulo;
	public String Autor;
	public String descrišao;
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
	
	public String getDescrišao() {
		return descrišao;
		
	}public void setDescrišao(String descrišao) {
		this.descrišao = descrišao;
		
	}public void setAutor(String autor) {
		Autor = autor;
		
	}public String getAutor() {
		return Autor;
	}

}
