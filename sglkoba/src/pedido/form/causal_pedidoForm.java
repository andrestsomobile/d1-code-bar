package pedido.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import pedido.control.*;   import pedido.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class causal_pedidoForm  extends ActionForm { 
private String caupcodsx;private String cauppedido;private String caupcausal;private String caupdesccausal;private String caupfecha; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getcaupcodsx() {return caupcodsx;}public String getcauppedido() {return cauppedido;}public String getcaupcausal() {return caupcausal;}public String getcaupdesccausal() {return caupdesccausal;}public String getcaupfecha() {return caupfecha;}public void setcaupcodsx(String new_caupcodsx) {this.caupcodsx =  new_caupcodsx;}public void setcauppedido(String new_cauppedido) {this.cauppedido =  new_cauppedido;}public void setcaupcausal(String new_caupcausal) {this.caupcausal =  new_caupcausal;}public void setcaupdesccausal(String new_caupdesccausal) {this.caupdesccausal =  new_caupdesccausal;}public void setcaupfecha(String new_caupfecha) {this.caupfecha =  new_caupfecha;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstcausal_pedido gcausal_pedido= new gstcausal_pedido(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete" + 		"")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(cauppedido.equals("")) errors.add("cauppedido", new ActionMessage("El cauppedido no puede ser vacio", false) );     if(caupcausal.equals("")) errors.add("caupcausal", new ActionMessage("El caupcausal no puede ser vacio", false) );     if(caupdesccausal.equals("")) errors.add("caupdesccausal", new ActionMessage("El caupdesccausal no puede ser vacio", false) );     if(caupfecha.equals("")) errors.add("caupfecha", new ActionMessage("El caupfecha no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (causal_pedido entity ) { 
 

this.caupcodsx =  entity.getcaupcodsx(); this.cauppedido =  entity.getcauppedido(); this.caupcausal =  entity.getcaupcausal(); this.caupdesccausal =  entity.getcaupdesccausal(); this.caupfecha =  entity.getcaupfecha();  }
}
