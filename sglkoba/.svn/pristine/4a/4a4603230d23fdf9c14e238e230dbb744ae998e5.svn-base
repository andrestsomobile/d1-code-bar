package maestro.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import maestro.control.*;   import maestro.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class producto_clienteForm  extends ActionForm { 
private String proccodsx;private String proccliente;private String procproducto;private String procean;private String proctag;private String procodbarra;private String procnumcodigobarra;private String procgarantia; private String opcion;  private String promodelo, prodescripcion;
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getproccodsx() {return proccodsx;}public String getproccliente() {return proccliente;}public String getprocproducto() {return procproducto;}public String getprocean() {return procean;}public String getproctag() {return proctag;}public String getprocodbarra() {return procodbarra;}public String getprocnumcodigobarra() {return procnumcodigobarra;}public String getprocgarantia() {return procgarantia;}public void setproccodsx(String new_proccodsx) {this.proccodsx =  new_proccodsx;}public void setproccliente(String new_proccliente) {this.proccliente =  new_proccliente;}public void setprocproducto(String new_procproducto) {this.procproducto =  new_procproducto;}public void setprocean(String new_procean) {this.procean =  new_procean;}public void setproctag(String new_proctag) {this.proctag =  new_proctag;}public void setprocodbarra(String new_procodbarra) {this.procodbarra =  new_procodbarra;}public void setprocnumcodigobarra(String new_procnumcodigobarra) {this.procnumcodigobarra =  new_procnumcodigobarra;}public void setprocgarantia(String new_procgarantia) {this.procgarantia =  new_procgarantia;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstproducto_cliente gproducto_cliente= new gstproducto_cliente(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(proccliente.equals("")) errors.add("proccliente", new ActionMessage("El proccliente no puede ser vacio", false) );     if(procproducto.equals("")) errors.add("procproducto", new ActionMessage("El procproducto no puede ser vacio", false) );     if(procean.equals("")) errors.add("procean", new ActionMessage("El procean no puede ser vacio", false) );     if(proctag.equals("")) errors.add("proctag", new ActionMessage("El proctag no puede ser vacio", false) );     if(procodbarra.equals("")) errors.add("procodbarra", new ActionMessage("El procodbarra no puede ser vacio", false) );     //if(procnumcodigobarra.equals("")) errors.add("procnumcodigobarra", new ActionMessage("El procnumcodigobarra no puede ser vacio", false) );     if(procgarantia.equals("")) errors.add("procgarantia", new ActionMessage("El procgarantia no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (producto_cliente entity ) { 
 

this.proccodsx =  entity.getproccodsx(); this.proccliente =  entity.getproccliente(); this.procproducto =  entity.getprocproducto(); this.procean =  entity.getprocean(); this.proctag =  entity.getproctag(); this.procodbarra =  entity.getprocodbarra(); this.procnumcodigobarra =  entity.getprocnumcodigobarra(); this.procgarantia =  entity.getprocgarantia();if(procproducto!=null && !procproducto.equals("") && proccliente!=null && !proccliente.equals("")) {	gstproducto gprod = new gstproducto();	producto prod = gprod.getproducto(procproducto);	this.promodelo = prod.getpromodelo();	prodescripcion = prod.getprodescripcion();	} }public String getProdescripcion() {	return prodescripcion;}public void setProdescripcion(String prodescripcion) {	this.prodescripcion = prodescripcion;}public String getPromodelo() {	return promodelo;}public void setPromodelo(String promodelo) {	this.promodelo = promodelo;}
}
