package frgp.utn.edu.ar.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ventas")
public class Ventas {
	
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false, unique = true)
	private Date fecha;
    @Column(nullable = false)
    private double montoTotal;
    
    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(
        name = "ventas_articulos",
        joinColumns = {@JoinColumn(name = "venta_id")},
        inverseJoinColumns = {@JoinColumn(name = "articulo_id")}
    )
    private List<Articulo> listaArticulos;
    
    @ManyToOne
    @JoinColumn(name="id_cliente")
    private Cliente cliente;
    @Column(nullable = false)
	private boolean estado;
    
    public Ventas() {}

	public Ventas(Date fecha, double montoTotal, Cliente cliente, boolean estado) {
		super();
		this.fecha = fecha;
		this.montoTotal = montoTotal;
		this.cliente = cliente;
		this.estado = estado;
	}
	
	

	public Ventas(int id, Date fecha, double montoTotal, List<Articulo> listaArticulos, Cliente cliente,
			boolean estado) {
		super();
		this.id = id;
		this.fecha = fecha;
		this.montoTotal = montoTotal;
		this.listaArticulos = listaArticulos;
		this.cliente = cliente;
		this.estado = estado;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public double getMontoTotal() {
		return montoTotal;
	}

	public void setMontoTotal(double montoTotal) {
		this.montoTotal = montoTotal;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public List<Articulo> getListaArticulos() {
		return listaArticulos;
	}

	public void setListaArticulos(List<Articulo> listaArticulos) {
		this.listaArticulos = listaArticulos;
	};
	
	
}
