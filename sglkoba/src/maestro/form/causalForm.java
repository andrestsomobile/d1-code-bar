package maestro.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import maestro.control.*;   import maestro.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class causalForm  extends ActionForm { 
private String caucodsx;private String caudesc;private String cauresponsable;private String causnota;private String causdocsoporte; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getcaucodsx() {return caucodsx;}public String getcaudesc() {return caudesc;}public String getcauresponsable() {return cauresponsable;}public String getcausnota() {return causnota;}public String getcausdocsoporte() {return causdocsoporte;}public void setcaucodsx(String new_caucodsx) {this.caucodsx =  new_caucodsx;}public void setcaudesc(String new_caudesc) {this.caudesc =  new_caudesc;}public void setcauresponsable(String new_cauresponsable) {this.cauresponsable =  new_cauresponsable;}public void setcausnota(String new_causnota) {this.causnota =  new_causnota;}public void setcausdocsoporte(String new_causdocsoporte) {this.causdocsoporte =  new_causdocsoporte;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstcausal gcausal= new gstcausal(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(caudesc.equals("")) errors.add("caudesc", new ActionMessage("El caudesc no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (causal entity ) { 
 

this.caucodsx =  entity.getcaucodsx(); this.caudesc =  entity.getcaudesc(); this.cauresponsable =  entity.getcauresponsable(); this.causnota =  entity.getcausnota(); this.causdocsoporte =  entity.getcausdocsoporte();  }
}
