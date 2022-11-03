package averias.form;   import javax.servlet.http.HttpServletRequest; import maestro.control.gstcompania;import maestro.entity.compania;   import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import averias.control.*;   import averias.entity.*;import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class reparacionForm  extends ActionForm { 
private String repcodsx;private String repcodcia;private String repfecha;private String repsaldo;private String repdestino;private String repestado;private String resumen; private String opcion;  private String repobservacion; private String nombrecia; private String reppedido;
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getrepcodsx() {return repcodsx;}public String getrepcodcia() {return repcodcia;}public String getrepfecha() {return repfecha;}public String getrepsaldo() {return repsaldo;}public String getrepdestino() {return repdestino;}public String getrepestado() {return repestado;}public String getresumen() {return resumen;}public void setrepcodsx(String new_repcodsx) {this.repcodsx =  new_repcodsx;}public void setrepcodcia(String new_repcodcia) {this.repcodcia =  new_repcodcia;}public void setrepfecha(String new_repfecha) {this.repfecha =  new_repfecha;}public void setrepsaldo(String new_repsaldo) {this.repsaldo =  new_repsaldo;}public void setrepdestino(String new_repdestino) {this.repdestino =  new_repdestino;}public void setrepestado(String new_repestado) {this.repestado =  new_repestado;}public void setresumen(String new_resumen) {this.resumen =  new_resumen;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstreparacion greparacion= new gstreparacion(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   || opcion.equals("crear_pedido") || opcion.equals("activar")) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(repcodcia.equals("")) errors.add("repcodcia", new ActionMessage("El repcodcia no puede ser vacio", false) );       if(repsaldo.equals("")) errors.add("repsaldo", new ActionMessage("El repsaldo no puede ser vacio", false) );     if(repdestino.equals("")) errors.add("repdestino", new ActionMessage("El repdestino no puede ser vacio", false) );     if(repestado.equals("")) errors.add("repestado", new ActionMessage("El repestado no puede ser vacio", false) );    

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (reparacion entity ) { 
 

this.repcodsx =  entity.getrepcodsx(); this.repcodcia =  entity.getrepcodcia(); this.repfecha =  entity.getrepfecha(); this.repsaldo =  entity.getrepsaldo(); this.repdestino =  entity.getrepdestino(); this.repestado =  entity.getrepestado(); this.resumen =  entity.getresumen(); this.repobservacion = entity.getRepobservacion();this.reppedido = entity.getReppedido();gstcompania gcomp = new gstcompania();compania comp = gcomp.getcompania( repcodcia);if(comp!=null) this.nombrecia = comp.getcomnombre(); }public String getRepobservacion() {	return repobservacion;}public void setRepobservacion(String repobservacion) {	this.repobservacion = repobservacion;}public String getNombrecia() {	return nombrecia;}public void setNombrecia(String nombrecia) {	this.nombrecia = nombrecia;}public String getReppedido() {	return reppedido;}public void setReppedido(String reppedido) {	this.reppedido = reppedido;}
}
