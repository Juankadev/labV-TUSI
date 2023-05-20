package GRUPO6.entity;

import java.io.Serializable;


public class Genero implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 
	private int ID;
	
	private String Descripcion;
	
	public Genero() {}
 
	
	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public String getDescripcion() {
		return Descripcion;
	}

	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}


	@Override
	public String toString() {
		return "ID: " + ID + ", Descripcion: " + Descripcion + "";
	}
	
	
	
}
