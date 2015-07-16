package com.naturadventure.frontend.controller;

import java.util.Date;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.TimeUnit;

import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import mail.Mail;
import qrcode.GeneradorDeQR;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.AbstractPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import qrcode.GeneradorDeQR;

import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.ReservaDAO;
import com.naturadventure.domain.Reserva;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.HorasInicio;
import com.naturadventure.domain.NivelActividad;
import com.naturadventure.domain.TipoActividad;


@Controller
public class IndexController {


	private TipoActividadDAO tipoActividadDao; 
	private ActividadDAO actividadDao;
	private ReservaDAO reservaDao;
	
	@Autowired
    public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
        this.tipoActividadDao = tipoActividadDAO;
    }
	
	@Autowired
    public void setActividadDAO(ActividadDAO actividadDAO) { 
        this.actividadDao = actividadDAO;
    }
	

    @Autowired
    public void setReservaDAO(ReservaDAO reservaDAO) { 
        this.reservaDao = reservaDAO;
    }
    
    @Autowired
    ServletContext context;

	@RequestMapping("/index")
	    public String index(Model model) {
			List<TipoActividad> listaTiposActividades = tipoActividadDao.getTiposActividad();
			
			HashMap<String, Boolean> mapaDeOfertas = new HashMap<String, Boolean>();
			
			HashMap<String, Boolean> mapaDeNovedades = new HashMap<String, Boolean>();
			
			for(TipoActividad tipo : listaTiposActividades) {
			
				mapaDeNovedades.put(tipo.getTipo(), false);
				mapaDeOfertas.put(tipo.getTipo(), false);
				List<Actividad> listaActividades = actividadDao.getActividadesDeTipo(tipo.getTipo());
				 for(Actividad actividad : listaActividades) {
			
					 if (actividad.getOferta() != null){
						 String oferta = actividad.getOferta(); 
					 	if (  oferta.equalsIgnoreCase("oferta") ){
			
						 mapaDeOfertas.put(actividad.getTipo(), true);
					 	}
				 	 }
					 int nuevo = actividad.getNuevo();
					 if (   nuevo == 1 ){ 
			
						 mapaDeNovedades.put(tipo.getTipo(), true);
					 }
				 }
			}
		 	
		 	model.addAttribute("tiposdeactividades", listaTiposActividades);
		 	model.addAttribute("mapaNovedades", mapaDeNovedades);
		 	model.addAttribute("mapaOfertas", mapaDeOfertas);
		 	return "index";
	    }
	
	 @RequestMapping(value="/actividad/{tipo}", method = RequestMethod.GET) 
	    public String viewTActividad(Model model, @PathVariable String tipo) {
		 	model.addAttribute("tipoactividad", tipoActividadDao.getTipoActividad(tipo));
		 	
	        TreeMap<String, List<Actividad>> mapadeniveles = new TreeMap<String, List<Actividad>>();
	       	HashMap<String, HashMap<Integer, Double>> mapaDePrecios = new HashMap<String, HashMap<Integer, Double>>();

		 	List<NivelActividad> listaNiveles = new LinkedList<NivelActividad>(); 
		 	List<Actividad> listaActividades = actividadDao.getActividadesDeTipo(tipo);
	      //  List<String> listaNivelesUnicos = actividadDao.getNivelesUnicos();
	        
	        
	        if (listaActividades != null){
	        for(Actividad actividad : listaActividades) {
	     
	        	listaNiveles =  actividadDao.getNivelActividad(actividad.getIdActividad());
	       	 	//System.out.println("ide actividad  " + actividad.getIdActividad());
	       	 	
	       	 	//Dato dato=null;
	       	 	
	        	for(NivelActividad nivel : listaNiveles) {
	        		List<Actividad> auxlista = new LinkedList<Actividad>();
	        		HashMap<Integer, Double> auxmap = new HashMap<Integer, Double>();

	        		HashMap<Integer, Double> precioPoridActividad = new HashMap<Integer, Double>();
	        		precioPoridActividad.put(actividad.getIdActividad(), (double) nivel.getPrecioPorPersona());
	        		
	        		List<Actividad> listaActividadesVar = new LinkedList<Actividad>();
	        	 	listaActividadesVar.add(actividad);
	        	 	
	        	 	if ( mapadeniveles.get(nivel.getNivel()) != null ){
	        	 		auxlista.addAll(mapadeniveles.get(nivel.getNivel()));	
	        	 	}  
	        	 	if ( mapaDePrecios.get(nivel.getNivel()) != null ){
	        	 		auxmap.putAll(mapaDePrecios.get(nivel.getNivel()));	
	        	 	}


	        		auxlista.addAll(listaActividadesVar);
	        		auxmap.putAll(precioPoridActividad);

	        		mapadeniveles.put(nivel.getNivel(), auxlista);
	        		mapaDePrecios.put(nivel.getNivel(), auxmap);
	        		auxlista = null;
	        		auxmap = null;
	        		//System.out.println(" nivel  " +nivel.getNivel() + " nombre actividad " + actividad.getIdActividad());
	        	}
	       
	        }
	        }
	        
	        //   model.addAttribute("listaNiveles", listaNivelesUnicos );
	       
	        model.addAttribute("mapaListaActividadesPorNiveles", mapadeniveles );
	        model.addAttribute("precioPoridActividad", mapaDePrecios );
	       
	        return "actividad"; 
	       
	    
	        
	       
	    } 
	
	 @RequestMapping(value="/actividad/reserva/{id}/{nivel}", method = RequestMethod.GET)
	    public String reserva(Model model, @PathVariable Integer id,@PathVariable String nivel) {
		    Actividad actividad = actividadDao.getActividad(id);
		 	NivelActividad objNivel =  actividadDao.getPrecioNivel(id,nivel);
		 	List<HorasInicio> listaHoras = actividadDao.getHorasActividad(id);
		 	Date someDate = new Date(); // Or whatever
		    Date twoDayAfter = new Date(someDate.getTime() + TimeUnit.DAYS.toMillis( 1 ));
		    model.addAttribute("limitefeca",twoDayAfter);
			model.addAttribute("actividad", actividad );
		 	model.addAttribute("nivel", objNivel );
		    model.addAttribute("listahoras", listaHoras );
		    model.addAttribute("reserva", new Reserva());
		    System.out.println(" lista de horas " + listaHoras.toString());
	        return "reserva";
	    }
	
	 
	 @RequestMapping(value="/datosreserva/{id}", method = RequestMethod.GET)
	    public String reserva(Model model, @PathVariable Integer id) {
		    
		 	Reserva reserva = reservaDao.getReserva(id);
		 	Actividad actividad = actividadDao.getActividad(reserva.getIdActividad());
		 	TipoActividad tipo = tipoActividadDao.getTipoActividad(actividad.getTipo());
		 	NivelActividad objNivel =  actividadDao.getPrecioNivel(reserva.getIdActividad(),reserva.getNivel());
		 	double precioIva = objNivel.getPrecioPorPersona() * reserva.getNumParticipantes() ;
		 	
		 	double varPrecioIva = precioIva + (precioIva * 0.21) ;
		 	model.addAttribute("precioiva", varPrecioIva);
		 	
		    model.addAttribute("reserva",reserva);
			model.addAttribute("actividad", actividad );
		 	model.addAttribute("tipo", tipo );
		    return "inforeserva";
	    }

	 @RequestMapping(value="/pedido", method=RequestMethod.POST)
	 	public String pedido(Model model, @ModelAttribute("reserva") Reserva reserva, BindingResult bindingResult) {
		 Date actual = new Date();
		 if (bindingResult.hasErrors()|| actual.after(reserva.getFechaActividad())) 
			 return "redirect:actividad/reserva/"+reserva.getIdActividad()+"/"+reserva.getNivel()+".html";
		 
		 		
		 		//return "/actividad/reserva/";
		 		
		 	Integer idreserva = reservaDao.addReserva(reserva);
		 	
		 	
		 	
		 	// creeamos el QR para la reserva
	        String rootPath = context.getRealPath( File.separator + "resources" );
	        File dir = new File(rootPath + File.separator + "images");
	        if (!dir.exists())
	            dir.mkdirs();
			String p =dir.getAbsolutePath()+ File.separator;
		 	GeneradorDeQR q = new GeneradorDeQR(idreserva,p);
			q.creea();
			
		 	reserva = reservaDao.getReserva(idreserva);
		 	Actividad actividad = actividadDao.getActividad(reserva.getIdActividad());
		 	NivelActividad objNivel =  actividadDao.getPrecioNivel(reserva.getIdActividad(),reserva.getNivel());
		 	model.addAttribute("reserva", reserva);
		 	
		 	model.addAttribute("actividad", actividad);
		 	model.addAttribute("nivel", objNivel);
		 	double precioIva = objNivel.getPrecioPorPersona() * reserva.getNumParticipantes() ;
		 	
		 	double varPrecioIva = precioIva + (precioIva * 0.21) ;
		 	model.addAttribute("precioiva", varPrecioIva);
		 	System.out.println(" precio iva --"+varPrecioIva + "precio sin iva "+ precioIva + " Precio Por Persona "+ objNivel.getPrecioPorPersona());
		 	return "pedido";
	   	}

	   	@InitBinder
		protected void initBinder(WebDataBinder binder) {
    		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
    		dateFormat.setLenient(false);
    		binder.registerCustomEditor(Date.class, "fechaActividad",new CustomDateEditor(dateFormat, false));
		}
	   	
	   	@RequestMapping(value = "/ajaxmailcontact", method = RequestMethod.POST)
	    @ResponseBody
	     public String sendmail( HttpServletRequest request) throws AddressException {
	   		
	        String nombre =request.getParameter("nombre");
	        String email =request.getParameter("email");
	        String mensaje =request.getParameter("mensaje");
	        String result = "Correo enviado con éxito";		
	        Mail mail = new Mail();
	        mail.setRecipient("agg.naturaventure.info@gmail.com");
	        mail.setSubject("Contacto");
	        String body ="Contacto de "+ nombre +"\n Con email:"+email+ "\n Pide información sobre : "+mensaje; 
	        mail.setBodyText(body);
	        boolean verificacion= true;
	        System.out.println(" valor send mail  "+ verificacion);
	        verificacion = mail.sendEmail();
	        if (!verificacion) { result="Hay un problema con nuestro servidor de correo, por favor comunique con nosotros por teléfono, perdone las molestias"; } 
	        System.out.println(" valor send mail  "+ verificacion);
	        
	        return result;
	    }
	   	
	   	
	   	@RequestMapping("/cookies")
	    public String cookies(Model model) {
			
		 	
		 	
		 	return "cookies";
	    }
	
	   	@RequestMapping("/AvisoLegal")
	    public String avisoLegal(Model model) {
			
		 	
		 	
		 	return "AvisoLegal";
	    }
	   	
}

