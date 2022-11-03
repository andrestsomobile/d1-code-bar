package ayuda.form;   import javax.servlet.http.HttpServletRequest;    import org.apache.struts.action.ActionErrors;    import org.apache.struts.action.ActionForm;   import org.apache.struts.action.ActionMapping;   import ayuda.control.*;   import ayuda.entity.*;  import org.apache.struts.action.ActionMessage;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class faqForm  extends ActionForm { 
private String faqcodsx;private String faqpregunta;private String faqrespcorta;private String faqresplarga; private String opcion; 
 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getfaqcodsx() {return faqcodsx;}public String getfaqpregunta() {return faqpregunta;}public String getfaqrespcorta() {return faqrespcorta;}public String getfaqresplarga() {return faqresplarga;}public void setfaqcodsx(String new_faqcodsx) {this.faqcodsx =  new_faqcodsx;}public void setfaqpregunta(String new_faqpregunta) {this.faqpregunta =  new_faqpregunta;}public void setfaqrespcorta(String new_faqrespcorta) {this.faqrespcorta =  new_faqrespcorta;}public void setfaqresplarga(String new_faqresplarga) {this.faqresplarga =  new_faqresplarga;} public void reset(ActionMapping mapping, HttpServletRequest request) {  	}  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) { 
ActionErrors errors = new ActionErrors(); 
 gstfaq gfaq= new gstfaq(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:   if(faqpregunta.equals("")) errors.add("faqpregunta", new ActionMessage("El faqpregunta no puede ser vacio", false) );     if(faqrespcorta.equals("")) errors.add("faqrespcorta", new ActionMessage("El faqrespcorta no puede ser vacio", false) );     if(faqresplarga.equals("")) errors.add("faqresplarga", new ActionMessage("El faqresplarga no puede ser vacio", false) );  

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (faq entity ) { 
 

this.faqcodsx =  entity.getfaqcodsx(); this.faqpregunta =  entity.getfaqpregunta(); this.faqrespcorta =  entity.getfaqrespcorta(); this.faqresplarga =  entity.getfaqresplarga();  }
}
