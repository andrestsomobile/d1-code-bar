package administracion.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import administracion.control.*;   import administracion.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class usuarioForm  extends ActionForm { 
private String usucodsx;private String usunombre;private String usulogin;private String usuclave;private String usumail;private String usugrupo;private String usucompania;private String usucodcliente; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getusucodsx() {return usucodsx;}public String getusunombre() {return usunombre;}public String getusulogin() {return usulogin;}public String getusuclave() {return usuclave;}public String getusumail() {return usumail;}public String getusugrupo() {return usugrupo;}public String getusucompania() {return usucompania;}public String getusucodcliente() {return usucodcliente;}public void setusucodsx(String new_usucodsx) {this.usucodsx =  new_usucodsx;}public void setusunombre(String new_usunombre) {this.usunombre =  new_usunombre;}public void setusulogin(String new_usulogin) {this.usulogin =  new_usulogin;}public void setusuclave(String new_usuclave) {this.usuclave =  new_usuclave;}public void setusumail(String new_usumail) {this.usumail =  new_usumail;}public void setusugrupo(String new_usugrupo) {this.usugrupo =  new_usugrupo;}public void setusucompania(String new_usucompania) {this.usucompania =  new_usucompania;}public void setusucodcliente(String new_usucodcliente) {this.usucodcliente =  new_usucodcliente;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstusuario gusuario= new gstusuario();  System.out.println(opcion);
 opcion = opcion==null || opcion.equals("") ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
  if(opcion.equals("crear")   ) { 
	 	 usuario usu = gusuario.getusuario_by_login(usulogin);	 if(usu!=null) {		 	errors.add("general", new ActionMessage("El usuario con login <b>" + usulogin + "</b> ya existe, no pueden existir 2 logins iguales en la aplicacion", false));		 	return errors;	 }
} 
 
//valido campos requeridos:   if(usunombre.equals("")) errors.add("usunombre", new ActionMessage("El Nombre del usuario no puede ser vacio", false) );     if(usulogin.equals("")) errors.add("usulogin", new ActionMessage("El Login no puede ser vacio", false) );     if(usuclave.equals("")) errors.add("usuclave", new ActionMessage("La Clave no puede ser vacio", false) );     if(usugrupo.equals("")) errors.add("usugrupo", new ActionMessage("El Grupo no puede ser vacio", false) );        //valido que grupo es para no registrar \:   if(usugrupo.equals("3")) { //es diferente a clientes, compania y codigo del cliente son nulos   	   if(usucodcliente.equals("")) errors.add("usucodcliente", new ActionMessage("Debe escribir el cliente", false) );   }else if(usugrupo.equals("4")) {	   usucodcliente=null;    }else {	   usucompania =null;	  usucodcliente=null;   }         if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo Registrar Los datos, revise los mensajes", false));      return errors;
 } 

 public void llenar (usuario entity ) { 
 

this.usucodsx =  entity.getusucodsx(); this.usunombre =  entity.getusunombre(); this.usulogin =  entity.getusulogin(); this.usuclave =  entity.getusuclave(); this.usumail =  entity.getusumail(); this.usugrupo =  entity.getusugrupo(); this.usucompania =  entity.getusucompania(); this.usucodcliente =  entity.getusucodcliente();  }
}
