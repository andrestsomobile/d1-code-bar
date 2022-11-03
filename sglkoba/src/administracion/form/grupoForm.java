package administracion.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import administracion.control.*;   import administracion.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class grupoForm  extends ActionForm { 
private String gcodsx;private String gnombre; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getgcodsx() {return gcodsx;}public String getgnombre() {return gnombre;}public void setgcodsx(String new_gcodsx) {this.gcodsx =  new_gcodsx;}public void setgnombre(String new_gnombre) {this.gnombre =  new_gnombre;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstgrupo ggrupo= new gstgrupo(); 
 opcion = opcion==null || opcion.equals("") ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
	 	 grupo g = ggrupo.getgrupo_by_nombre(gnombre);	 if(g!=null) {		 	errors.add("general", new ActionMessage("El grupo con nombre <b>" + gnombre + "</b> ya existe", false));		 	return errors;	 }
} 

//valido campos requeridos:   if(gnombre.equals("")) errors.add("gnombre", new ActionMessage("El Nombre no puede ser vacio", false) );      if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo guardar los datos, revise ", false));   return errors; 
 } 

 public void llenar (grupo entity ) { 
 

this.gcodsx =  entity.getgcodsx(); this.gnombre =  entity.getgnombre();  }
}
