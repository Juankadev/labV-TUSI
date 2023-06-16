package frgp.utn.edu.ar.dtos;

import frgp.utn.edu.ar.dominio.Articulo;
import frgp.utn.edu.ar.dominio.Cliente;

public class ArticuloRequest {
	
	private int id;
	private String nombre;
	private String descripcion;
	private String marca;
	private String tipo;
	private float precio;
	private boolean estado;
	
	@Override
	public String toString() {
		return "Nombre: " + nombre + ", Descripcion: " + descripcion + ", Marca: " + marca
				+ ", Tipo: " + tipo + ", Precio: " + precio + "";
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}
	
	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public Articulo construirArticulo(){
        Articulo  a = new Articulo(nombre, marca, descripcion, tipo, precio, estado);

        if(id != 0){
            a.setId(id);
        }

        return a;
    }

}
