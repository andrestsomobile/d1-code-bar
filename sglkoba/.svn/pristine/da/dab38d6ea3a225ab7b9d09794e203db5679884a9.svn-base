package patios.form;

import javax.servlet.http.HttpServletRequest;

import maestro.control.gstciudad;
import maestro.control.gstcliente;
import maestro.control.gstdepartamento;
import maestro.control.gstsucursal;
import maestro.entity.ciudad;
import maestro.entity.cliente;
import maestro.entity.departamento;
import maestro.entity.sucursal;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import patios.entity.pedidovehiculo;

public class pedidovehiculoForm extends ActionForm {
	
	private String pvcodsx;

	private String pvfecha;

	private String pvcodcia;

	private String pvnumeropedido;

	private String pvcodcliente;

	private String pvcodciudaddestino;

	private String pvdireccion;

	private String pvestado;

	private String opcion;
	
	private String clidesc;

	private String ciudesc;

	public void setopcion(String newopcion) {
		this.opcion = newopcion;
	}

	public String getopcion() {
		return this.opcion;
	}

	public void llenar(pedidovehiculo entity) {
		this.pvcodsx = entity.getPvcodsx();
		this.pvfecha = entity.getPvfecha();
		this.pvcodcia = entity.getPvcodcia();
		this.pvnumeropedido = entity.getPvnumeropedido();
		this.pvcodcliente = entity.getPvcodcliente();
		this.pvcodciudaddestino = entity.getPvcodciudaddestino();
		this.pvdireccion = entity.getPvdireccion();
		this.pvestado = entity.getPvestado();
		cliente cli = (new gstcliente()).getcliente(pvcodcliente);
		if (cli != null) clidesc = cli.getclinombre();
		ciudad ciu = (new gstciudad()).getciudad(pvcodciudaddestino);
		if (ciu != null) ciudesc = ciu.getciunombre();
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

	public String getPvcodsx() {
		return pvcodsx;
	}

	public void setPvcodsx(String pvcodsx) {
		this.pvcodsx = pvcodsx;
	}

	public String getPvfecha() {
		return pvfecha;
	}

	public void setPvfecha(String pvfecha) {
		this.pvfecha = pvfecha;
	}

	public String getPvcodcia() {
		return pvcodcia;
	}

	public void setPvcodcia(String pvcodcia) {
		this.pvcodcia = pvcodcia;
	}

	public String getPvnumeropedido() {
		return pvnumeropedido;
	}

	public void setPvnumeropedido(String pvnumeropedido) {
		this.pvnumeropedido = pvnumeropedido;
	}

	public String getPvcodcliente() {
		return pvcodcliente;
	}

	public void setPvcodcliente(String pvcodcliente) {
		this.pvcodcliente = pvcodcliente;
	}

	public String getPvcodciudaddestino() {
		return pvcodciudaddestino;
	}

	public void setPvcodciudaddestino(String pvcodciudaddestino) {
		this.pvcodciudaddestino = pvcodciudaddestino;
	}

	public String getPvdireccion() {
		return pvdireccion;
	}

	public void setPvdireccion(String pvdireccion) {
		this.pvdireccion = pvdireccion;
	}

	public String getPvestado() {
		return pvestado;
	}

	public void setPvestado(String pvestado) {
		this.pvestado = pvestado;
	}

	public String getCiudesc() {
		return ciudesc;
	}

	public void setCiudesc(String ciudesc) {
		this.ciudesc = ciudesc;
	}

	public String getClidesc() {
		return clidesc;
	}
	
	public void setClidesc(String clidesc) {
		this.clidesc = clidesc;
	}
}
