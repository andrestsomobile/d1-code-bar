package registro.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import registro.control.gstregistro_almacenamiento;
import registro.entity.registro_almacenamiento;

public class registro_almacenamientoForm extends ActionForm {

	private String realcodsx;
	private String realaccion;
	private String realfecha;
	private String realempleado;
	private String realhoin;
	private String realhofi;
	private String realcantestibas;
	private String realestado;
	private String opcion;
	
	
    public registro_almacenamientoForm() {
    }
    
    public void reset(ActionMapping actionmapping, HttpServletRequest httpservletrequest) {
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		gstregistro_almacenamiento control = new gstregistro_almacenamiento();
		
		opcion = opcion != null ? opcion : "crear";
		if (opcion.equals("set") || opcion.equals("delete") || opcion.equals("activar") )
			return null;
		opcion.equals("crear");
		
		if (realempleado != null && realempleado.equals(""))
			errors.add("realempleado", new ActionMessage("Empleado no puede ser vacio", false));
		
		if (realaccion != null && realaccion.equals(""))
			errors.add("realaccion", new ActionMessage("Accion no puede ser vacio", false));
		
		if (!errors.isEmpty())
			errors.add("general", new ActionMessage("No se han podido guardar los datos, revise", false));
		return errors;
	}
	public void llenar(registro_almacenamiento entity)    {
		this.realcodsx = entity.getRealcodsx();
		this.realaccion = entity.getRealaccion();
		this.realfecha = entity.getRealfecha();
		this.realempleado = entity.getRealempleado();
		this.realhoin = entity.getRealhoin();
		this.realhofi = entity.getRealhofi();
		this.realcantestibas = entity.getRealcantestibas();
		this.realestado = entity.getRealestado();
    }

	public String getRealcodsx() {
		return realcodsx;
	}

	public void setRealcodsx(String realcodsx) {
		this.realcodsx = realcodsx;
	}

	public String getRealaccion() {
		return realaccion;
	}

	public void setRealaccion(String realaccion) {
		this.realaccion = realaccion;
	}

	public String getRealfecha() {
		return realfecha;
	}

	public void setRealfecha(String realfecha) {
		this.realfecha = realfecha;
	}

	public String getRealempleado() {
		return realempleado;
	}

	public void setRealempleado(String realempleado) {
		this.realempleado = realempleado;
	}

	public String getRealhoin() {
		return realhoin;
	}

	public void setRealhoin(String realhoin) {
		this.realhoin = realhoin;
	}

	public String getRealhofi() {
		return realhofi;
	}

	public void setRealhofi(String realhofi) {
		this.realhofi = realhofi;
	}

	public String getRealcantestibas() {
		return realcantestibas;
	}

	public void setRealcantestibas(String realcantestibas) {
		this.realcantestibas = realcantestibas;
	}

	public String getRealestado() {
		return realestado;
	}

	public void setRealestado(String realestado) {
		this.realestado = realestado;
	}

	public String getopcion() {
		return opcion;
	}

	public void setopcion(String opcion) {
		this.opcion = opcion;
	}


}
