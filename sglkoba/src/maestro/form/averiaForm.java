package maestro.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import maestro.control.*;   import maestro.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class averiaForm  extends ActionForm { 
private String avecodsx;private String avedescripcion; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getavecodsx() {return avecodsx;}public String getavedescripcion() {return avedescripcion;}public void setavecodsx(String new_avecodsx) {this.avecodsx =  new_avecodsx;}public void setavedescripcion(String new_avedescripcion) {this.avedescripcion =  new_avedescripcion;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstaveria gaveria= new gstaveria(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(avedescripcion.equals("")) errors.add("avedescripcion", new ActionMessage("El avedescripcion no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (averia entity ) { 
 

this.avecodsx =  entity.getavecodsx(); this.avedescripcion =  entity.getavedescripcion();  }
}
