package maestro.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import maestro.control.*;   import maestro.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class causal_hitForm  extends ActionForm { 
private String cauhcodsx;private String cauhdesc;private String cauresp; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getcauhcodsx() {return cauhcodsx;}public String getcauhdesc() {return cauhdesc;}public String getcauresp() {return cauresp;}public void setcauhcodsx(String new_cauhcodsx) {this.cauhcodsx =  new_cauhcodsx;}public void setcauhdesc(String new_cauhdesc) {this.cauhdesc =  new_cauhdesc;}public void setcauresp(String new_cauresp) {this.cauresp =  new_cauresp;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstcausal_hit gcausal_hit= new gstcausal_hit(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(cauhdesc.equals("")) errors.add("cauhdesc", new ActionMessage("El cauhdesc no puede ser vacio", false) );     if(cauresp.equals("")) errors.add("cauresp", new ActionMessage("El cauresp no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (causal_hit entity ) { 
 

this.cauhcodsx =  entity.getcauhcodsx(); this.cauhdesc =  entity.getcauhdesc(); this.cauresp =  entity.getcauresp();  }
}
