package administracion.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import administracion.control.*;   import administracion.entity.*;import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class permisoForm  extends ActionForm { 
private String percodsx;private String pergrupo;private String perapp;private String permodulo;private String peracceso; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getpercodsx() {return percodsx;}public String getpergrupo() {return pergrupo;}public String getperapp() {return perapp;}public String getpermodulo() {return permodulo;}public String getperacceso() {return peracceso;}public void setpercodsx(String new_percodsx) {this.percodsx =  new_percodsx;}public void setpergrupo(String new_pergrupo) {this.pergrupo =  new_pergrupo;}public void setperapp(String new_perapp) {this.perapp =  new_perapp;}public void setpermodulo(String new_permodulo) {this.permodulo =  new_permodulo;}public void setperacceso(String new_peracceso) {this.peracceso =  new_peracceso;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstpermiso gpermiso= new gstpermiso();  
 opcion = opcion==null || opcion.equals("") ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete") ||  opcion.equals("setapp")) return null; 
 if(opcion.equals("crear")   ) { 	 
	 permiso per = gpermiso.getpermiso(pergrupo, perapp, permodulo);	 if(per!=null) {		 errors.add("general", new ActionMessage("El permiso ya esta definido para el grupo, el modulo y el componente seleccionados<BR>Si desea puede actualizarlo", false));		 return errors;	 }
} 

//valido campos requeridos:   if(pergrupo.equals("")) errors.add("pergrupo", new ActionMessage("El Grupo no puede ser vacio", false) );     if(perapp.equals("")) errors.add("perapp", new ActionMessage("El App no puede ser vacio", false) );     if(permodulo.equals("")) errors.add("permodulo", new ActionMessage("El MODULO no puede ser vacio", false) );     if(peracceso.equals("")) errors.add("peracceso", new ActionMessage("El Acceso no puede ser vacio", false) );         if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudieron guardar los datos, revise los mensajes", false));      return errors; 
 } 

 public void llenar (permiso entity ) { 
 

this.percodsx =  entity.getpercodsx(); this.pergrupo =  entity.getpergrupo(); this.perapp =  entity.getperapp(); this.permodulo =  entity.getpermodulo(); this.peracceso =  entity.getperacceso();  }
}
