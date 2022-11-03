package pedido.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import pedido.control.*;   import pedido.entity.*;import org.apache.struts.action.ActionMessage;  /** * CLASE GENERADA CON generator V3.0 By pablito****** */public class packingForm  extends ActionForm { 
private String packcodsx;private String packempresa;private String packfecha;private String packobservaciones;private String packestado; private String opcion;  /** * @uml.property  name="packpesoneto" */private String packpesoneto;/** * @uml.property  name="packpesobruto" */private String packpesobruto; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getpackcodsx() {return packcodsx;}public String getpackempresa() {return packempresa;}public String getpackfecha() {return packfecha;}public String getpackobservaciones() {return packobservaciones;}public String getpackestado() {return packestado;}public void setpackcodsx(String new_packcodsx) {this.packcodsx =  new_packcodsx;}public void setpackempresa(String new_packempresa) {this.packempresa =  new_packempresa;}public void setpackfecha(String new_packfecha) {this.packfecha =  new_packfecha;}public void setpackobservaciones(String new_packobservaciones) {this.packobservaciones =  new_packobservaciones;}public void setpackestado(String new_packestado) {this.packestado =  new_packestado;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstpacking gpacking= new gstpacking(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete") || opcion.equals("activar")|| opcion.equals("descomprometer")  ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(packempresa.equals("")) errors.add("packempresa", new ActionMessage("El packempresa no puede ser vacio", false) );     if(packfecha.equals("")) errors.add("packfecha", new ActionMessage("El packfecha no puede ser vacio", false) );     if(packestado.equals("")) errors.add("packestado", new ActionMessage("El packestado no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo Guardar los datos , revise", false) );  
 return errors; 
 } 

 public void llenar (packing entity ) { 
 

this.packcodsx =  entity.getpackcodsx(); this.packempresa =  entity.getpackempresa(); this.packfecha =  entity.getpackfecha(); this.packobservaciones =  entity.getpackobservaciones(); this.packestado =  entity.getpackestado();this.opcion ="update";this.packpesobruto = entity.getPackpesobruto();this.packpesoneto = entity.getPackpesoneto(); }/** * @return * @uml.property  name="packpesobruto" */public String getPackpesobruto() {	return packpesobruto;}/** * @param packpesobruto * @uml.property  name="packpesobruto" */public void setPackpesobruto(String packpesobruto) {	this.packpesobruto = packpesobruto;}/** * @return * @uml.property  name="packpesoneto" */public String getPackpesoneto() {	return packpesoneto;}/** * @param packpesoneto * @uml.property  name="packpesoneto" */public void setPackpesoneto(String packpesoneto) {	this.packpesoneto = packpesoneto;}
}
