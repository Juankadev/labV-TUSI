package frgp.utn.edu.ar.controllers;

import javax.servlet.ServletConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import frgp.utn.edu.ar.dtos.ArticuloRequest;
import frgp.utn.edu.ar.servicio.ArticuloServicio;

@Controller
@RequestMapping("/articulos")
public class ArticuloController {
	
	@Autowired
	public ArticuloServicio service;

	public void init(ServletConfig config) {
		ApplicationContext ctx = WebApplicationContextUtils
				.getRequiredWebApplicationContext(config.getServletContext());

		this.service = (ArticuloServicio) ctx.getBean("serviceBeanArt");
	}


	//Inicio

	@RequestMapping("")
	public ModelAndView lista(){
		ModelAndView MV = new ModelAndView();
		MV.addObject("articulos",this.service.obtenerTodos());
		MV.setViewName("Articulos/Listado");
		return MV;
	}


	@RequestMapping("/alta")
	public ModelAndView pantallaDeAlta(){
		ModelAndView MV = new ModelAndView();
		MV.setViewName("Articulos/Alta");
		return MV;
	}

	@RequestMapping(value ="/crear" , method = RequestMethod.POST)
	public ModelAndView crearArticulo(@ModelAttribute ArticuloRequest articuloRequest,
									 BindingResult bindingResult){
		ModelAndView MV = new ModelAndView();
		
		String Message="";

		if(bindingResult.hasErrors()){
			for (ObjectError error: bindingResult.getAllErrors()) {
				Message += error.getObjectName() + ": " + error.getDefaultMessage() + "\n";
			}

			MV.addObject("Mensaje", Message);
			MV.setViewName("Articulos/Alta");
		}

		try{
			service.insertar(articuloRequest.construirArticulo());
			Message = "Articulo agregado";
		}
		catch(Exception e)
		{
			Message = "No se pudo agregar el articulo";
		}
	
		MV.addObject("Mensaje", Message);
		MV.setViewName("Articulo/Alta");
		return MV;
		
	}
	
     
	@RequestMapping(value ="/eliminar/{id}" , method= { RequestMethod.GET })
	public ModelAndView eliminar(@PathVariable int id){
		ModelAndView MV = new ModelAndView();
		service.eliminar(id);
		MV.addObject("articulos",this.service.obtenerTodos());
		MV.addObject("Mensaje", "Articulo eliminado");
		MV.setViewName("Articulos/Listado");
		return MV;
	}

}