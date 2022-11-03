package auditoria.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import auditoria.control.*;   import auditoria.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class auditoria_conexionesForm  extends ActionForm { 
private String audicodsx;private String audilogin;private String audinombre;private String audifecha;private String audiapp;private String audimodulo; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getaudicodsx() {return audicodsx;}public String getaudilogin() {return audilogin;}public String getaudinombre() {return audinombre;}public String getaudifecha() {return audifecha;}public String getaudiapp() {return audiapp;}public String getaudimodulo() {return audimodulo;}public void setaudicodsx(String new_audicodsx) {this.audicodsx =  new_audicodsx;}public void setaudilogin(String new_audilogin) {this.audilogin =  new_audilogin;}public void setaudinombre(String new_audinombre) {this.audinombre =  new_audinombre;}public void setaudifecha(String new_audifecha) {this.audifecha =  new_audifecha;}public void setaudiapp(String new_audiapp) {this.audiapp =  new_audiapp;}public void setaudimodulo(String new_audimodulo) {this.audimodulo =  new_audimodulo;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstauditoria_conexiones gauditoria_conexiones= new gstauditoria_conexiones(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(audilogin.equals("")) errors.add("audilogin", new ActionMessage("El audilogin no puede ser vacio", false) );     if(audinombre.equals("")) errors.add("audinombre", new ActionMessage("El audinombre no puede ser vacio", false) );     if(audifecha.equals("")) errors.add("audifecha", new ActionMessage("El audifecha no puede ser vacio", false) );     if(audiapp.equals("")) errors.add("audiapp", new ActionMessage("El audiapp no puede ser vacio", false) );     if(audimodulo.equals("")) errors.add("audimodulo", new ActionMessage("El audimodulo no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (auditoria_conexiones entity ) { 
 

this.audicodsx =  entity.getaudicodsx(); this.audilogin =  entity.getaudilogin(); this.audinombre =  entity.getaudinombre(); this.audifecha =  entity.getaudifecha(); this.audiapp =  entity.getaudiapp(); this.audimodulo =  entity.getaudimodulo();  }
}
