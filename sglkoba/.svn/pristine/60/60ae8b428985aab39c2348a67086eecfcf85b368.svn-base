package registro.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import registro.control.gstregistro_almacenamiento;
import registro.entity.registro_almacenamiento;

public class registro_almacenamiento_detalleForm extends ActionForm {

	private String radecodsx;
	private String raderegalm;
	private String radecodentrada;
	private String radecodreubicacion; 
	private String radeestibas; 
	private String radetiempo;
	private String opcion;
	
	
    public registro_almacenamiento_detalleForm() {
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
		
		if (raderegalm != null && raderegalm.equals(""))
			errors.add("raderegalm", new ActionMessage("raderegalm no puede ser vacio", false));
				
		if (!errors.isEmpty())
			errors.add("general", new ActionMessage("No se han podido guardar los datos, revise", false));
		return errors;
	}
	public void llenar(registro_almacenamiento entity)    {

    }
	
	public String getRadecodsx() {
		return radecodsx;
	}

	public void setRadecodsx(String radecodsx) {
		this.radecodsx = radecodsx;
	}

	public String getRaderegalm() {
		return raderegalm;
	}

	public void setRaderegalm(String raderegalm) {
		this.raderegalm = raderegalm;
	}

	public String getRadecodentrada() {
		return radecodentrada;
	}

	public void setRadecodentrada(String radecodentrada) {
		this.radecodentrada = radecodentrada;
	}

	public String getRadecodreubicacion() {
		return radecodreubicacion;
	}

	public void setRadecodreubicacion(String radecodreubicacion) {
		this.radecodreubicacion = radecodreubicacion;
	}

	public String getRadeestibas() {
		return radeestibas;
	}

	public void setRadeestibas(String radeestibas) {
		this.radeestibas = radeestibas;
	}

	public String getRadetiempo() {
		return radetiempo;
	}

	public void setRadetiempo(String radetiempo) {
		this.radetiempo = radetiempo;
	}

	public String getopcion() {
		return opcion;
	}

	public void setopcion(String opcion) {
		this.opcion = opcion;
	}


}
