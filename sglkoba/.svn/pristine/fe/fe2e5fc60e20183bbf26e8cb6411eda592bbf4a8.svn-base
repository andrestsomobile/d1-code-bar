package patios.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import patios.entity.detalledespachovehiculo;
import patios.entity.detalleentradavehiculo;

public class detalleentradavehiculoForm extends ActionForm {

	private String devcodsx;

	private String devcodentrada;

	private String devreferencia;

	private String devmarca;

	private String devmodelo;

	private String devmotor;

	private String devvinchasis;

	private String devlocacion;

	private String devcolor;

	private String devestado;

	private String devfechaingreso;

	private String devfechasalida;

	private String devfechaalistamiento;
	
	private String devnovedades;

	private String opcion;

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}

	public void llenar(detalleentradavehiculo entity) {
		this.devcodsx = entity.getDevcodsx();
		this.devcodentrada = entity.getDevcodentrada();
		this.devreferencia = entity.getDevreferencia();
		this.devmarca = entity.getDevmarca();
		this.devmodelo = entity.getDevmodelo();
		this.devmotor = entity.getDevmotor();
		this.devvinchasis = entity.getDevvinchasis();
		this.devlocacion = entity.getDevlocacion();
		this.devcolor = entity.getDevcolor();
		this.devestado = entity.getDevestado();
		this.devfechaingreso = entity.getDevfechaingreso();
		this.devfechasalida = entity.getDevfechasalida();
		this.devfechaalistamiento = entity.getDevfechaalistamiento();
		this.devnovedades = entity.getDevnovedades();
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

	public String getDevcodsx() {
		return devcodsx;
	}

	public void setDevcodsx(String devcodsx) {
		this.devcodsx = devcodsx;
	}

	public String getDevcodentrada() {
		return devcodentrada;
	}

	public void setDevcodentrada(String devcodentrada) {
		this.devcodentrada = devcodentrada;
	}

	public String getDevreferencia() {
		return devreferencia;
	}

	public void setDevreferencia(String devreferencia) {
		this.devreferencia = devreferencia;
	}

	public String getDevmarca() {
		return devmarca;
	}

	public void setDevmarca(String devmarca) {
		this.devmarca = devmarca;
	}

	public String getDevmodelo() {
		return devmodelo;
	}

	public void setDevmodelo(String devmodelo) {
		this.devmodelo = devmodelo;
	}

	public String getDevmotor() {
		return devmotor;
	}

	public void setDevmotor(String devmotor) {
		this.devmotor = devmotor;
	}

	public String getDevvinchasis() {
		return devvinchasis;
	}

	public void setDevvinchasis(String devvinchasis) {
		this.devvinchasis = devvinchasis;
	}

	public String getDevlocacion() {
		return devlocacion;
	}

	public void setDevlocacion(String devlocacion) {
		this.devlocacion = devlocacion;
	}

	public String getDevcolor() {
		return devcolor;
	}

	public void setDevcolor(String devcolor) {
		this.devcolor = devcolor;
	}

	public String getDevestado() {
		return devestado;
	}

	public void setDevestado(String devestado) {
		this.devestado = devestado;
	}

	public String getDevfechaingreso() {
		return devfechaingreso;
	}

	public void setDevfechaingreso(String devfechaingreso) {
		this.devfechaingreso = devfechaingreso;
	}

	public String getDevfechasalida() {
		return devfechasalida;
	}

	public void setDevfechasalida(String devfechasalida) {
		this.devfechasalida = devfechasalida;
	}

	public String getDevfechaalistamiento() {
		return devfechaalistamiento;
	}

	public void setDevfechaalistamiento(String devfechaalistamiento) {
		this.devfechaalistamiento = devfechaalistamiento;
	}

	public String getDevnovedades() {
		return devnovedades;
	}

	public void setDevnovedades(String devnovedades) {
		this.devnovedades = devnovedades;
	}

}
