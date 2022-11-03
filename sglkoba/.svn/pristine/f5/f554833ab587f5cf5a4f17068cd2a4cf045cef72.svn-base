package patios.form;

import javax.servlet.http.HttpServletRequest;

import maestro.control.gstciudad;
import maestro.control.gstdepartamento;
import maestro.entity.ciudad;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import patios.entity.despachovehiculo;
import pedido.entity.causal_pedido;

public class despachovehiculoForm extends ActionForm {
	private String dvcodsx;

	private String dvfecha;

	private String dvcodpedido;

	private String dvcodtransportadora;

	private String dvestado;

	private String dvnotificacion;

	private String opcion;

	public void llenar(despachovehiculo entity) {
		this.dvcodsx = entity.getDvcodsx();
		this.dvfecha = entity.getDvfecha();
		this.dvcodpedido = entity.getDvcodpedido();
		this.dvcodtransportadora = entity.getDvcodtransportadora();
		this.dvestado = entity.getDvestado();
		this.dvnotificacion = entity.getDvnotificacion();
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

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}

	public String getDvcodsx() {
		return dvcodsx;
	}

	public void setDvcodsx(String dvcodsx) {
		this.dvcodsx = dvcodsx;
	}

	public String getDvfecha() {
		return dvfecha;
	}

	public void setDvfecha(String dvfecha) {
		this.dvfecha = dvfecha;
	}

	public String getDvcodpedido() {
		return dvcodpedido;
	}

	public void setDvcodpedido(String dvcodpedido) {
		this.dvcodpedido = dvcodpedido;
	}

	public String getDvcodtransportadora() {
		return dvcodtransportadora;
	}

	public void setDvcodtransportadora(String dvcodtransportadora) {
		this.dvcodtransportadora = dvcodtransportadora;
	}

	public String getDvestado() {
		return dvestado;
	}

	public void setDvestado(String dvestado) {
		this.dvestado = dvestado;
	}

	public String getDvnotificacion() {
		return dvnotificacion;
	}

	public void setDvnotificacion(String dvnotificacion) {
		this.dvnotificacion = dvnotificacion;
	}

}
