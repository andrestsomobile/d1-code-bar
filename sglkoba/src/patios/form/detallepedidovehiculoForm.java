package patios.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import patios.entity.detallepedidovehiculo;

public class detallepedidovehiculoForm extends ActionForm {
	private String dpvcodsx;

	private String dpvcodpedido;

	private String dpvcodvin;

	private String opcion;

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}

	public void llenar(detallepedidovehiculo entity) {
		this.dpvcodsx = entity.getDpvcodsx();
		this.dpvcodpedido = entity.getDpvcodpedido();
		this.dpvcodvin = entity.getDpvcodvin();
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

	public String getDpvcodsx() {
		return dpvcodsx;
	}

	public void setDpvcodsx(String dpvcodsx) {
		this.dpvcodsx = dpvcodsx;
	}

	public String getDpvcodpedido() {
		return dpvcodpedido;
	}

	public void setDpvcodpedido(String dpvcodpedido) {
		this.dpvcodpedido = dpvcodpedido;
	}

	public String getDpvcodvin() {
		return dpvcodvin;
	}

	public void setDpvcodvin(String dpvcodvin) {
		this.dpvcodvin = dpvcodvin;
	}
}
