package util;

import java.util.Vector;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author  palito
 */
public class popupBoton extends TagSupport {

	
	/**
	 * @uml.property  name="clase"
	 */
	private String clase; //clase de control
	/**
	 * @uml.property  name="entidad"
	 */
	private String entidad; //clase de control
	/**
	 * @uml.property  name="metodo"
	 */
	private String metodo;
	/**
	 * @uml.property  name="reload"
	 */
	private String reload;
	/**
	 * @uml.property  name="formulario"
	 */
	private String formulario;
	/**
	 * @uml.property  name="metodo_total"
	 */
	private String metodo_total;
	/**
	 * @uml.property  name="mensaje"
	 */
	private String mensaje;
	/**
	 * @uml.property  name="funcion_onclick"
	 */
	private String funcion_onclick;
	/**
	 * @uml.property  name="parametros"
	 */
	private String[] parametros;
	/**
	 * @uml.property  name="parametros_total"
	 */
	private String[] parametros_total;
	/**
	 * @uml.property  name="campos_form"
	 */
	private String[] campos_form;
	/**
	 * @uml.property  name="campos_pick"
	 */
	private String[] campos_pick;
	/**
	 * @uml.property  name="campos_entity"
	 */
	private String[] campos_entity;
	/**
	 * @uml.property  name="nombres_campos_entity"
	 */
	private String[] nombres_campos_entity;
	
	/**
	 * @uml.property  name="campos_foranea"
	 */
	private String[] campos_foranea;
	/**
	 * @uml.property  name="tablas_foranea"
	 */
	private String[] tablas_foranea;
	/**
	 * @uml.property  name="primarias_foranea"
	 */
	private String[] primarias_foranea;
	/**
	 * @uml.property  name="desc_foranea"
	 */
	private String[] desc_foranea;
	
	/**
	 * @return
	 * @uml.property  name="campos_entity"
	 */
	public String[] getCampos_entity() {
		return campos_entity;
	}
	/**
	 * @param campos_entity
	 * @uml.property  name="campos_entity"
	 */
	public void setCampos_entity(String[] campos_entity) {
		this.campos_entity = campos_entity;
	}
	/**
	 * @return
	 * @uml.property  name="clase"
	 */
	public String getClase() {
		return clase;
	}
	/**
	 * @param clase
	 * @uml.property  name="clase"
	 */
	public void setClase(String clase) {
		this.clase = clase;
	}
	/**
	 * @return
	 * @uml.property  name="entidad"
	 */
	public String getEntidad() {
		return entidad;
	}
	/**
	 * @param entidad
	 * @uml.property  name="entidad"
	 */
	public void setEntidad(String entidad) {
		this.entidad = entidad;
	}
	/**
	 * @return
	 * @uml.property  name="formulario"
	 */
	public String getFormulario() {
		return formulario;
	}
	/**
	 * @param formulario
	 * @uml.property  name="formulario"
	 */
	public void setFormulario(String formulario) {
		this.formulario = formulario;
	}
	/**
	 * @return
	 * @uml.property  name="metodo"
	 */
	public String getMetodo() {
		return metodo;
	}
	/**
	 * @param metodo
	 * @uml.property  name="metodo"
	 */
	public void setMetodo(String metodo) {
		this.metodo = metodo;
	}
	/**
	 * @return
	 * @uml.property  name="nombres_campos_entity"
	 */
	public String[] getNombres_campos_entity() {
		return nombres_campos_entity;
	}
	/**
	 * @param nombres_campos_entity
	 * @uml.property  name="nombres_campos_entity"
	 */
	public void setNombres_campos_entity(String[] nombres_campos_entity) {
		this.nombres_campos_entity = nombres_campos_entity;
	}
	/**
	 * @return
	 * @uml.property  name="parametros"
	 */
	public String[] getParametros() {
		return parametros;
	}
	/**
	 * @param parametros
	 * @uml.property  name="parametros"
	 */
	public void setParametros(String[] parametros) {
		this.parametros = parametros;
	}
	/**
	 * @return
	 * @uml.property  name="reload"
	 */
	public String getReload() {
		return reload;
	}
	/**
	 * @param reload
	 * @uml.property  name="reload"
	 */
	public void setReload(String reload) {
		this.reload = reload;
	}
	
	
	
	
	
	
	
	
	 public int doStartTag() throws JspException {

		 JspWriter out = pageContext.getOut(); 
		 
		    
		    try{  

		    	//GENERO EL SUUUPER LINK:
		    	String url = "popup.jsp?clase="+ clase + "&metodo="+ metodo + "&entidad="+ entidad + "&reload="+ reload+
		    				"&metodo_total="+ metodo_total + "&formulario=" + formulario + (mensaje==null ? "": "&mensaje=" + mensaje ); 
				//ciclo con los parametros
				for(int i=0;  parametros!=null &&  i<parametros.length;i++) 
						url +="&parametros="+ parametros[i] ;
				for(int i=0;  parametros_total!=null &&  i<parametros_total.length;i++) 
					url +="&parametros_total="+ parametros_total[i] ;
				//ciclo con los campos del formulario
				for(int i=0; campos_form!=null && i< campos_form.length;i++) 
						url +="&campos_form="+ campos_form[i] ;
				
				for(int i=0; campos_pick!=null && i< campos_pick.length;i++) 
					url +="&campos_pick="+ campos_pick[i] ;
				//ciclo con los campos_entity
				for(int i=0; campos_entity!=null &&i<campos_entity.length;i++) 
						url +="&campos_entity="+ campos_entity[i] ;
				//ciclo con los nombres_campos_entity
				for(int i=0;nombres_campos_entity!=null && i <nombres_campos_entity.length;i++) 
						url +="&nombres_campos_entity="+ nombres_campos_entity[i] ;
				
				
				//ciclo con las foraneas:
				for(int i=0;campos_foranea!=null && i <campos_foranea.length;i++)
					url +="&campos_foranea="+ campos_foranea[i] ;
				//tablas foraneas
				for(int i=0;tablas_foranea!=null && i <tablas_foranea.length;i++)
					url +="&tablas_foranea="+ tablas_foranea[i] ;
				//primarias_foranea
				for(int i=0;primarias_foranea!=null && i <primarias_foranea.length;i++)
					url +="&primarias_foranea="+ primarias_foranea[i] ;
				//desc_foranea
				for(int i=0;desc_foranea!=null && i <desc_foranea.length;i++)
					url +="&desc_foranea="+ desc_foranea[i] ;
				
				
		    	out.write("<a href=\"javascript:showList('"+ url +"')\" onclick='"+ funcion_onclick + "'> <img src=\"./disenno/images/search.jpg\" border=\"0\">  </a>");
		    	
		    	
        } catch (Exception e) {
        	e.printStackTrace();
	            throw new JspException ("Error: IOException" + 
				                        e.getMessage());
	        }

		        
		        
		        
		        
		        
		        
		        return SKIP_BODY;
		    }
	/**
	 * @return
	 * @uml.property  name="metodo_total"
	 */
	public String getMetodo_total() {
		return metodo_total;
	}
	/**
	 * @param metodo_total
	 * @uml.property  name="metodo_total"
	 */
	public void setMetodo_total(String metodo_total) {
		this.metodo_total = metodo_total;
	}
	/**
	 * @return
	 * @uml.property  name="parametros_total"
	 */
	public String[] getParametros_total() {
		return parametros_total;
	}
	/**
	 * @param parametros_total
	 * @uml.property  name="parametros_total"
	 */
	public void setParametros_total(String[] parametros_total) {
		this.parametros_total = parametros_total;
	}
	/**
	 * @return
	 * @uml.property  name="campos_form"
	 */
	public String[] getCampos_form() {
		return campos_form;
	}
	/**
	 * @param campos_form
	 * @uml.property  name="campos_form"
	 */
	public void setCampos_form(String[] campos_form) {
		this.campos_form = campos_form;
	}
	/**
	 * @return
	 * @uml.property  name="campos_pick"
	 */
	public String[] getCampos_pick() {
		return campos_pick;
	}
	/**
	 * @param campos_pick
	 * @uml.property  name="campos_pick"
	 */
	public void setCampos_pick(String[] campos_pick) {
		this.campos_pick = campos_pick;
	}
	/**
	 * @return
	 * @uml.property  name="mensaje"
	 */
	public String getMensaje() {
		return mensaje;
	}
	/**
	 * @param mensaje
	 * @uml.property  name="mensaje"
	 */
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	/**
	 * @return
	 * @uml.property  name="funcion_onclick"
	 */
	public String getFuncion_onclick() {
		return funcion_onclick;
	}
	/**
	 * @param funcion_onclick
	 * @uml.property  name="funcion_onclick"
	 */
	public void setFuncion_onclick(String funcion_onclick) {
		this.funcion_onclick = funcion_onclick;
	}

	/**
	 * @return
	 * @uml.property  name="campos_foranea"
	 */
	public String[] getCampos_foranea() {
		return campos_foranea;
	}
	/**
	 * @param campos_foranea
	 * @uml.property  name="campos_foranea"
	 */
	public void setCampos_foranea(String[] campos_foranea) {
		this.campos_foranea = campos_foranea;
	}
	/**
	 * @return
	 * @uml.property  name="desc_foranea"
	 */
	public String[] getDesc_foranea() {
		return desc_foranea;
	}
	/**
	 * @param desc_foranea
	 * @uml.property  name="desc_foranea"
	 */
	public void setDesc_foranea(String[] desc_foranea) {
		this.desc_foranea = desc_foranea;
	}
	/**
	 * @return
	 * @uml.property  name="primarias_foranea"
	 */
	public String[] getPrimarias_foranea() {
		return primarias_foranea;
	}
	/**
	 * @param primarias_foranea
	 * @uml.property  name="primarias_foranea"
	 */
	public void setPrimarias_foranea(String[] primarias_foranea) {
		this.primarias_foranea = primarias_foranea;
	}
	/**
	 * @return
	 * @uml.property  name="tablas_foranea"
	 */
	public String[] getTablas_foranea() {
		return tablas_foranea;
	}
	/**
	 * @param tablas_foranea
	 * @uml.property  name="tablas_foranea"
	 */
	public void setTablas_foranea(String[] tablas_foranea) {
		this.tablas_foranea = tablas_foranea;
	}

	
	
	
	
	
	
	
}
