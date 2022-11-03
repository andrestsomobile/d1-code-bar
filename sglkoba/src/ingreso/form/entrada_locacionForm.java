package ingreso.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import ingreso.control.gstentrada;
import ingreso.control.gstentrada_locacion;
import ingreso.control.gstingreso;
import ingreso.entity.entrada;
import ingreso.entity.entrada_locacion;
import ingreso.entity.ingreso;
import maestro.control.gstproducto;
import maestro.entity.producto;

public class entrada_locacionForm  extends ActionForm {
	
	private String elcodsx;
	private String elcodentrada;
	private String elcodlocacionorigen;
	private String elcodlocaciondestino;
	private String elcantidadnac; 
	private String elsaldonac;
	private String elcantidadsnac;
	private String elsaldosnac;
	private String elfecha;
	private String elpersona;
	private String elcodcia;
	private String elcodproducto;
	private String promodelo;
	private String prodescripcion;
	
	private String opcion;

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}


	public String getElcodsx() {
		return elcodsx;
	}


	public void setElcodsx(String elcodsx) {
		this.elcodsx = elcodsx;
	}


	public String getElcodentrada() {
		return elcodentrada;
	}


	public void setElcodentrada(String elcodentrada) {
		this.elcodentrada = elcodentrada;
	}


	public String getElcodlocacionorigen() {
		return elcodlocacionorigen;
	}


	public void setElcodlocacionorigen(String elcodlocacionorigen) {
		this.elcodlocacionorigen = elcodlocacionorigen;
	}


	public String getElcodlocaciondestino() {
		return elcodlocaciondestino;
	}


	public void setElcodlocaciondestino(String elcodlocaciondestino) {
		this.elcodlocaciondestino = elcodlocaciondestino;
	}


	public String getElcantidadnac() {
		return elcantidadnac;
	}


	public void setElcantidadnac(String elcantidadnac) {
		this.elcantidadnac = elcantidadnac;
	}


	public String getElsaldonac() {
		return elsaldonac;
	}


	public void setElsaldonac(String elsaldonac) {
		this.elsaldonac = elsaldonac;
	}


	public String getElcantidadsnac() {
		return elcantidadsnac;
	}


	public void setElcantidadsnac(String elcantidadsnac) {
		this.elcantidadsnac = elcantidadsnac;
	}


	public String getElsaldosnac() {
		return elsaldosnac;
	}


	public void setElsaldosnac(String elsaldosnac) {
		this.elsaldosnac = elsaldosnac;
	}


	public String getElfecha() {
		return elfecha;
	}


	public void setElfecha(String elfecha) {
		this.elfecha = elfecha;
	}


	public String getElpersona() {
		return elpersona;
	}


	public void setElpersona(String elpersona) {
		this.elpersona = elpersona;
	}

	public String getElcodcia() {
		return elcodcia;
	}

	public void setElcodcia(String elcodcia) {
		this.elcodcia = elcodcia;
	}

	public String getelcodproducto() {
		return elcodproducto;
	}

	public void setelcodproducto(String elcodproducto) {
		this.elcodproducto = elcodproducto;
	}

	public String getpromodelo() {
		return promodelo;
	}

	public void setpromodelo(String promodelo) {
		this.promodelo = promodelo;
	}

	public String getprodescripcion() {
		return prodescripcion;
	}

	public void setprodescripcion(String prodescripcion) {
		this.prodescripcion = prodescripcion;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		gstentrada_locacion gentrada_locacion = new gstentrada_locacion();
		opcion = opcion == null ? "crear" : opcion;
		if (opcion.equals("set") || opcion.equals("delete"))
			return null;
		if (opcion.equals("crear")) {
			// @todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS
		}

		//valido campos requeridos:

		if (elcodentrada.equals(""))
			errors.add("elcodentrada", new ActionMessage("La entrada puede ser vacio", false));
		if (elcodlocacionorigen.equals(""))
			errors.add("elcodlocacionorigen", new ActionMessage("Locacion de Origen no puede ser vacio", false));
		if (elcodlocaciondestino.equals(""))
			errors.add("elcodlocaciondestino", new ActionMessage("Locacion de Destino no puede ser vacio", false));
		if (elcantidadnac.equals(""))
			errors.add("elcantidadnac", new ActionMessage("Candidad no puede ser vacio", false));
		if (elcantidadsnac.equals(""))
			errors.add("elcantidadsnac", new ActionMessage("Cantidad no puede ser vacio", false));
	

		if (!errors.isEmpty())
			errors.add("general", new ActionMessage("<b>No se pudo guardar los datos, revise<b> ", false));

		return errors;
	}

	public void llenar(entrada_locacion entity) {

		this.elcodsx = entity.getElcodsx();
		this.elcodentrada = entity.getElcodentrada();
		this.elcodlocacionorigen = entity.getElcodlocacionorigen();
		this.elcodlocaciondestino = entity.getElcodlocaciondestino();
		this.elcantidadnac = entity.getElcantidadnac();
		this.elsaldonac = entity.getElsaldonac();
		this.elcantidadsnac = entity.getElcantidadsnac();
		this.elsaldosnac = entity.getElsaldosnac();
		this.elfecha = entity.getElfecha();
		this.elpersona = entity.getElpersona();
        gstentrada gent = new gstentrada();
        
        gstingreso ging = new gstingreso();
        gstproducto gpro = new gstproducto();
        
        entrada ent = entity.getElcodentrada() != null ? gent.getentrada(entity.getElcodentrada()) : null;
        
        ingreso ing = ent != null && ent.getentcodingreso() != null ? ging.getingreso(ent.getentcodingreso()) : null;
        this.elcodcia = ing != null && ing.getingcodcia() != null ? ing.getingcodcia() : null;
        
        producto pro = ent != null && ent.getentcodproducto() != null ? gpro.getproducto(ent.getentcodproducto()) : null;
        this.elcodproducto = pro != null ? pro.getpromodelo() : null;
        this.prodescripcion = pro != null ? pro.getprodescripcion() : null;
        
	}

}
