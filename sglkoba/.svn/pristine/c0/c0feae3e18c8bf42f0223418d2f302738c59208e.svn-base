package ingreso.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import ingreso.control.gstcontenedor_trafico;
import ingreso.control.gstlote_contenedor_trafico;
import ingreso.control.gstlote_trafico;
import ingreso.entity.contenedor_trafico;
import ingreso.entity.lote_contenedor_trafico;
import ingreso.entity.lote_trafico;

public class lote_contenedor_traficoForm extends ActionForm {
	
	private String lctrafcodsx;
	
	private String lctrafcontenedor;
	
	private String lctraflote;
	
	private String lctrafcantidad;
	
	private String lctrafingreso;

	private String opcion;

	private String placa;
	
	private String descripcionproducto;
	
	private String iniciodescargue;
	
	public String getlctrafcodsx() {
		return lctrafcodsx;
	}

	public void setlctrafcodsx(String lctrafcodsx) {
		this.lctrafcodsx = lctrafcodsx;
	}

	public String getlctrafcontenedor() {
		return lctrafcontenedor;
	}

	public void setlctrafcontenedor(String lctrafcontenedor) {
		this.lctrafcontenedor = lctrafcontenedor;
	}

	public String getlctraflote() {
		return lctraflote;
	}

	public void setlctraflote(String lctraflote) {
		this.lctraflote = lctraflote;
	}

	public String getlctrafcantidad() {
		return lctrafcantidad;
	}

	public void setlctrafcantidad(String lctrafcantidad) {
		this.lctrafcantidad = lctrafcantidad;
	}
	
	public String getlctrafingreso() {
		return lctrafingreso;
	}

	public void setlctrafingreso(String lctrafingreso) {
		this.lctrafingreso = lctrafingreso;
	}
	
	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}
	
	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getdescripcionproducto() {
		return descripcionproducto;
	}

	public void setdescripcionproducto(String descripcionproducto) {
		this.descripcionproducto = descripcionproducto;
	}
		
	public String getIniciodescargue() {
		return iniciodescargue;
	}

	public void setIniciodescargue(String iniciodescargue) {
		this.iniciodescargue = iniciodescargue;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		gstlote_contenedor_trafico glote_contenedor_trafico = new gstlote_contenedor_trafico();
		opcion = opcion == null ? "crear" : opcion;
		if (opcion.equals("set") || opcion.equals("delete"))
			return null;
		if (opcion.equals("crear")) {
			// @todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS
		}

		// valido campos requeridos:


		if (lctrafcontenedor.equals(""))
			errors.add("lctrafcontenedor", new ActionMessage("El vehiculo no puede ser vacio", false));
		
		if (lctraflote.equals(""))
			errors.add("lctraflote", new ActionMessage("El lote no puede ser vacio", false));
		
		try {
			float cant = Float.parseFloat(lctrafcantidad);

			if (cant <= 0)
				errors.add("lctrafcantidad", new ActionMessage("El cantidad no puede ser vacio y debe ser numerico MAYOR A CERO", false));
		} catch (NumberFormatException ex) {
			errors.add("lctrafcantidad", new ActionMessage("El cantidad no puede ser vacio y debe ser numerico MAYOR A CERO", false));
		}
		
		if (!errors.isEmpty())
			errors.add("general", new ActionMessage("<b>No se pudo guardar los datos, revise<b> ", false));

		return errors;
	}

	public void llenar(lote_contenedor_trafico entity) {

		this.lctrafcodsx = entity.getlctrafcodsx();
		this.lctrafcontenedor = entity.getlctrafcontenedor();
		this.lctraflote = entity.getlctraflote();
		this.lctrafcantidad = entity.getlctrafcantidad();
		this.lctrafingreso = entity.getlctrafingreso();
				
		if (this.lctrafcontenedor != null) {
			gstcontenedor_trafico gct = new gstcontenedor_trafico();
			contenedor_trafico cont = gct.getcontenedor_trafico(this.lctrafcontenedor);
			if ( cont != null ) {
				setPlaca(cont.getctrafplaca());
				setIniciodescargue(cont.getctrafiniciodescargue());
			}
		}
		
	}
}
