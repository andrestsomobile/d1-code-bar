package ingreso.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import ingreso.control.*;   import ingreso.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class factura_traficoForm  extends ActionForm { 
private String ftrafcodsx;private String ftrafnumfactura;private String ftrafnumtrafico; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getftrafcodsx() {return ftrafcodsx;}public String getftrafnumfactura() {return ftrafnumfactura;}public String getftrafnumtrafico() {return ftrafnumtrafico;}public void setftrafcodsx(String new_ftrafcodsx) {this.ftrafcodsx =  new_ftrafcodsx;}public void setftrafnumfactura(String new_ftrafnumfactura) {this.ftrafnumfactura =  new_ftrafnumfactura;}public void setftrafnumtrafico(String new_ftrafnumtrafico) {this.ftrafnumtrafico =  new_ftrafnumtrafico;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstfactura_trafico gfactura_trafico= new gstfactura_trafico(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; if(opcion.equals("moverReferenciaFactura")) return null; //No verifico elementos
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(ftrafnumfactura.equals("")) errors.add("ftrafnumfactura", new ActionMessage("El Numero de Factura no puede ser vacio", false) );     if(ftrafnumtrafico.equals("")) errors.add("ftrafnumtrafico", new ActionMessage("El ftrafnumtrafico no puede ser vacio", false) );         request.setAttribute("trafcodsx", getftrafnumtrafico());   if(!errors.isEmpty()) 	   errors.add( "general", new ActionMessage("No se pudo guardar los datos, revise"));   return errors; 
 } 

 public void llenar (factura_trafico entity ) { 
 

this.ftrafcodsx =  entity.getftrafcodsx(); this.ftrafnumfactura =  entity.getftrafnumfactura(); this.ftrafnumtrafico =  entity.getftrafnumtrafico();  }
}
