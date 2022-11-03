package patios.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import patios.entity.nacionalizacionvehiculo;

public class nacionalizacionvehiculoForm extends ActionForm {

	private String nvcodsx;

	private String nvfmm;

	private String nvfecha;

	private String nvcodvin;

	private String opcion;

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}

	public void llenar(nacionalizacionvehiculo entity) {
		this.nvcodsx = entity.getNvcodsx();
		this.nvfmm = entity.getNvfmm();
		this.nvfecha = entity.getNvfecha();
		this.nvcodvin = entity.getNvcodvin();
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

	public String getNvcodsx() {
		return nvcodsx;
	}

	public void setNvcodsx(String nvcodsx) {
		this.nvcodsx = nvcodsx;
	}

	public String getNvfmm() {
		return nvfmm;
	}

	public void setNvfmm(String nvfmm) {
		this.nvfmm = nvfmm;
	}

	public String getNvfecha() {
		return nvfecha;
	}

	public void setNvfecha(String nvfecha) {
		this.nvfecha = nvfecha;
	}

	public String getNvcodvin() {
		return nvcodvin;
	}

	public void setNvcodvin(String nvcodvin) {
		this.nvcodvin = nvcodvin;
	}

}
