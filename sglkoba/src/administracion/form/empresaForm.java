package administracion.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import administracion.control.*;   import administracion.entity.*;import org.apache.struts.action.ActionMessage;  /** * CLASE GENERADA CON generator V3.0 By pablito****** */public class empresaForm  extends ActionForm { 
private String empcodsx;private String empnombre;private String empdireccion;private String emptelefono;private String empnit;private String empdescripcion;/** * @uml.property  name="empmail" */private String empmail;/** * @uml.property  name="empslogan" */private String empslogan; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getempcodsx() {return empcodsx;}public String getempnombre() {return empnombre;}public String getempdireccion() {return empdireccion;}public String getemptelefono() {return emptelefono;}public String getempnit() {return empnit;}public String getempdescripcion() {return empdescripcion;}public void setempcodsx(String new_empcodsx) {this.empcodsx =  new_empcodsx;}public void setempnombre(String new_empnombre) {this.empnombre =  new_empnombre;}public void setempdireccion(String new_empdireccion) {this.empdireccion =  new_empdireccion;}public void setemptelefono(String new_emptelefono) {this.emptelefono =  new_emptelefono;}public void setempnit(String new_empnit) {this.empnit =  new_empnit;}public void setempdescripcion(String new_empdescripcion) {this.empdescripcion =  new_empdescripcion;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstempresa gempresa= new gstempresa(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(empnombre.equals("")) errors.add("empnombre", new ActionMessage("El Nombre no puede ser vacio", false) );     if(empdireccion.equals("")) errors.add("empdireccion", new ActionMessage("La Direccion no puede ser vacio", false) );     if(emptelefono.equals("")) errors.add("emptelefono", new ActionMessage("El Telefono no puede ser vacio", false) );     if(empnit.equals("")) errors.add("empnit", new ActionMessage("El Nit no puede ser vacio", false) );     if(empdescripcion.equals("")) errors.add("empdescripcion", new ActionMessage("La descripcion no puede ser vacio", false) );   if(empmail.equals("")) errors.add("empmail", new ActionMessage("El Mail no puede ser vacio", false) );   if(empslogan.equals("")) errors.add("empslogan", new ActionMessage("El SLOGAN no puede ser vacio", false) );   if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudieron guardar los datos, revise los mensajes", false));      return errors; 
 } 

 public void llenar (empresa entity ) { 
 

this.empcodsx =  entity.getempcodsx(); this.empnombre =  entity.getempnombre(); this.empdireccion =  entity.getempdireccion(); this.emptelefono =  entity.getemptelefono(); this.empnit =  entity.getempnit(); this.empdescripcion =  entity.getempdescripcion();this.empmail = entity.getEmpmail();this.empslogan = entity.getEmpslogan(); }/** * @return * @uml.property  name="empmail" */public String getEmpmail() {	return empmail;}/** * @param empmail * @uml.property  name="empmail" */public void setEmpmail(String empmail) {	this.empmail = empmail;}/** * @return * @uml.property  name="empslogan" */public String getEmpslogan() {	return empslogan;}/** * @param empslogan * @uml.property  name="empslogan" */public void setEmpslogan(String empslogan) {	this.empslogan = empslogan;}
}
