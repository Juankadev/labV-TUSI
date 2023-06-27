package frgp.utn.edu.ar.servicioImpl;

import java.util.ArrayList;

import frgp.utn.edu.ar.dao.StockDao;
import frgp.utn.edu.ar.dominio.Articulo;
import frgp.utn.edu.ar.dominio.Stock;
import frgp.utn.edu.ar.servicio.StockServicio;

public class StockServicioImpl implements StockServicio {

	private StockDao dataAccess = null;

	public void setDataAccess(StockDao dataAccess) {
		this.dataAccess = dataAccess;
	}
	
	@Override
	public ArrayList<Stock> obtenerTodos() {
		return dataAccess.obtenerTodos();
	}

	@Override
	public Stock obtenerPorNombre(String nombre) {
		return dataAccess.obtenerPorNombre(nombre);
	}

	@Override
	public void insertar(Stock a) {
		 dataAccess.insertar(a);
		
	}

	@Override
	public void eliminar(int id) {
		dataAccess.eliminar(id);
		
	}

	@Override
	public void actualizar(Stock c) {
		dataAccess.actualizar(c);
		
	}

	@Override
	public Stock getbyID(int id) {
		return dataAccess.obtenerPorId(id);
	}

	@Override
	public Stock artByID(int id) {
		return dataAccess.artByID(id);
	}
	
	@Override
	public void deducirStock(Articulo articulo, int cantidad) {
		dataAccess.deducirStock(articulo, cantidad);	
	}
	
}
