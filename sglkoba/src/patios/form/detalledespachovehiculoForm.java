package patios.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import patios.entity.despachovehiculo;
import patios.entity.detalledespachovehiculo;

public class detalledespachovehiculoForm extends ActionForm {
	private String ddvcodsx;

	private String ddvcoddespacho;

	private String ddvcoddetpedido;

	private String opcion;

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}

	public void llenar(detalledespachovehiculo entity) {
		this.ddvcodsx = entity.getDdvcodsx();
		this.ddvcoddespacho = entity.getDdvcoddespacho();
		this.ddvcoddetpedido = entity.getDdvcoddetpedido();
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		// Validar llaves unicas

		opcion = opcion == null || opcion.equals("") ? "crear" : opcion;
		if (opcion.equals("set") || opcion.equals("delete"))
			return null;

		// valido campos requeridos:

		if (opcion.equals("crear")) {
			if (errors != null)
				return errors;
		}
		return errors;
	}

	public String getDdvcodsx() {
		return ddvcodsx;
	}

	public void setDdvcodsx(String ddvcodsx) {
		this.ddvcodsx = ddvcodsx;
	}

	public String getDdvcoddespacho() {
		return ddvcoddespacho;
	}

	public void setDdvcoddespacho(String ddvcoddespacho) {
		this.ddvcoddespacho = ddvcoddespacho;
	}

	public String getDdvcoddetpedido() {
		return ddvcoddetpedido;
	}

	public void setDdvcoddetpedido(String ddvcoddetpedido) {
		this.ddvcoddetpedido = ddvcoddetpedido;
	}

}
