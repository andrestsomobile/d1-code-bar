package patios.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import patios.entity.detallepedidovehiculo;
import patios.entity.entradavehiculo;

public class entradavehiculoForm extends ActionForm {
	private String evcodsx;

	private String evcodcia;

	private String evfecha;

	private String evdocumento;

	private String evestado;

	private String opcion;

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}

	public void llenar(entradavehiculo entity) {
		this.evcodsx = entity.getEvcodsx();
		this.evcodcia = entity.getEvcodcia();
		this.evfecha = entity.getEvfecha();
		this.evdocumento = entity.getEvdocumento();
		this.evestado = entity.getEvestado();
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

	public String getEvcodsx() {
		return evcodsx;
	}

	public void setEvcodsx(String evcodsx) {
		this.evcodsx = evcodsx;
	}

	public String getEvcodcia() {
		return evcodcia;
	}

	public void setEvcodcia(String evcodcia) {
		this.evcodcia = evcodcia;
	}

	public String getEvfecha() {
		return evfecha;
	}

	public void setEvfecha(String evfecha) {
		this.evfecha = evfecha;
	}

	public String getEvdocumento() {
		return evdocumento;
	}

	public void setEvdocumento(String evdocumento) {
		this.evdocumento = evdocumento;
	}

	public String getEvestado() {
		return evestado;
	}

	public void setEvestado(String evestado) {
		this.evestado = evestado;
	}

}
