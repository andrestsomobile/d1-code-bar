package maestro.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import maestro.control.*;
import maestro.entity.*;

import org.apache.struts.action.ActionMessage;

public class locacionForm extends ActionForm {
	
	private String loccodsx;

	private String locdesc;
	
	private String opcion;

	public locacionForm (String loccodsx, String locdesc) {
		this.loccodsx = loccodsx;
		this.locdesc = locdesc;
	}
	
	public locacionForm() {
		// TODO Auto-generated constructor stub
	}

	public String getLoccodsx() {
		return loccodsx;
	}

	public void setLoccodsx(String loccodsx) {
		this.loccodsx = loccodsx;
	}

	public String getLocdesc() {
		return locdesc;
	}

	public void setLocdesc(String locdesc) {
		this.locdesc = locdesc;
	}
	
	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
	}

	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		gstlocacion control = new gstlocacion();
		opcion = opcion == null || opcion.equals("") ? "crear" : opcion;
		if (opcion.equals("set") || opcion.equals("delete"))
			return null;
		if (opcion.equals("crear")) {
			// @todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS
			/*zona zon = control.getzona_by_ukey(locdesc);
			if (zon != null) {
				errors.add("general", new ActionMessage("<b>La zona "
						+ locdesc + " ya existe</b>", false));
				return errors;
			}*/
			
		}

		// valido campos requeridos:

		if (locdesc.equals(""))
			errors.add("locdesc", new ActionMessage(
					"<b>El Nombre no puede ser vacio</b>", false));
		if(!errors.isEmpty()) errors.add("general", new ActionMessage("<b>No se pudo guardar los datos, revise </b>", false));
		return errors;
	}

	public void llenar(locacion entity) {

		this.loccodsx = entity.getLoccodsx();
		this.locdesc = entity.getLocdesc();
	}
}
