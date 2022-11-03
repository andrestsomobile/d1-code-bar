package pedido.form;   import javax.servlet.http.HttpServletRequest; import maestro.control.gstproducto;import maestro.entity.producto;   import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import pedido.control.*;   import pedido.entity.*;import util.validador;import org.apache.struts.action.ActionMessage;  /** * CLASE GENERADA CON generator V3.0 By pablito****** */public class picking_detalleForm  extends ActionForm { 
private String pickdcodsx;private String pickdcodpicking;private String pickdproducto;private String pickdtotal; private String opcion;  /** * @uml.property  name="prodesc" */private String prodesc; /** * @uml.property  name="promodelo" */private String promodelo; /** * @uml.property  name="pickdvalorunit" */private String pickdvalorunit;
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getpickdcodsx() {return pickdcodsx;}public String getpickdcodpicking() {return pickdcodpicking;}public String getpickdproducto() {return pickdproducto;}public String getpickdtotal() {return pickdtotal;}public void setpickdcodsx(String new_pickdcodsx) {this.pickdcodsx =  new_pickdcodsx;}public void setpickdcodpicking(String new_pickdcodpicking) {this.pickdcodpicking =  new_pickdcodpicking;}public void setpickdproducto(String new_pickdproducto) {this.pickdproducto =  new_pickdproducto;}public void setpickdtotal(String new_pickdtotal) {this.pickdtotal =  new_pickdtotal;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstpicking_detalle gpicking_detalle= new gstpicking_detalle(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(pickdcodpicking.equals("")) errors.add("pickdcodpicking", new ActionMessage("El pickdcodpicking no puede ser vacio", false) );     if(pickdproducto.equals("")) errors.add("pickvdproducto", new ActionMessage("El pickdproducto no puede ser vacio", false) );  
   if(!validador.validarNumero(pickdvalorunit)) errors.add("pickdvalorunit", new ActionMessage("El valur unitario no puede ser vacio y debe ser numerico", false) );   if(!validador.validarNumero(pickdtotal)) errors.add("pickdtotal", new ActionMessage("El Total no puede ser vacio y debe ser numerico", false) );   
  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo guardar los datos , revise", false) );  
 return errors; 
 } 

 public void llenar (picking_detalle entity ) { 
 

this.pickdcodsx =  entity.getpickdcodsx(); this.pickdcodpicking =  entity.getpickdcodpicking(); this.pickdproducto =  entity.getpickdproducto(); this.pickdvalorunit = entity.getPickdvalorunit();gstproducto gprod = new gstproducto();producto prod = gprod.getproducto( pickdproducto);if(prod!=null) {	prodesc = prod.getprodescripcion();	promodelo = prod.getpromodelo();} }/** * @return * @uml.property  name="prodesc" */public String getProdesc() {	return prodesc;}/** * @param prodesc * @uml.property  name="prodesc" */public void setProdesc(String prodesc) {	this.prodesc = prodesc;}/** * @return * @uml.property  name="promodelo" */public String getPromodelo() {	return promodelo;}/** * @param promodelo * @uml.property  name="promodelo" */public void setPromodelo(String promodelo) {	this.promodelo = promodelo;}/** * @return * @uml.property  name="pickdvalorunit" */public String getPickdvalorunit() {	return pickdvalorunit;}/** * @param pickdvalorunit * @uml.property  name="pickdvalorunit" */public void setPickdvalorunit(String pickdvalorunit) {	this.pickdvalorunit = pickdvalorunit;}
}
