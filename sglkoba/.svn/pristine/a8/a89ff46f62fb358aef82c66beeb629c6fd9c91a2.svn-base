package pedido.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import pedido.control.*;   import pedido.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class novedad_pedidoForm  extends ActionForm { 
private String novcodsx;private String novpedido;private String novfecha;private String novdesc;private String novusuario;private String resumen; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getnovcodsx() {return novcodsx;}public String getnovpedido() {return novpedido;}public String getnovfecha() {return novfecha;}public String getnovdesc() {return novdesc;}public String getnovusuario() {return novusuario;}public String getresumen() {return resumen;}public void setnovcodsx(String new_novcodsx) {this.novcodsx =  new_novcodsx;}public void setnovpedido(String new_novpedido) {this.novpedido =  new_novpedido;}public void setnovfecha(String new_novfecha) {this.novfecha =  new_novfecha;}public void setnovdesc(String new_novdesc) {this.novdesc =  new_novdesc;}public void setnovusuario(String new_novusuario) {this.novusuario =  new_novusuario;}public void setresumen(String new_resumen) {this.resumen =  new_resumen;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstnovedad_pedido gnovedad_pedido= new gstnovedad_pedido(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(novpedido.equals("")) errors.add("novpedido", new ActionMessage("El novpedido no puede ser vacio", false) );     novfecha = novfecha.equals("") ? util.Fecha.getFecha(): novfecha;     if(novdesc.equals("")) errors.add("novdesc", new ActionMessage("El novdesc no puede ser vacio", false) );   
  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (novedad_pedido entity ) { 
 

this.novcodsx =  entity.getnovcodsx(); this.novpedido =  entity.getnovpedido(); this.novfecha =  entity.getnovfecha(); this.novdesc =  entity.getnovdesc(); this.novusuario =  entity.getnovusuario(); this.resumen =  entity.getresumen();  }
}
