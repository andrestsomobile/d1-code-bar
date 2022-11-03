package util;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.*;

import db.beanConnector;

/**
 * @author   palito
 */
public class popup extends TagSupport{
private beanConnector db = new beanConnector();
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
 * @uml.property  name="mensaje"
 */
private String mensaje;
//private String param;
/**
 * @uml.property  name="metodo_total"
 */
private String metodo_total;
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
 * @uml.property  name="lista"
 */
private Collection lista;

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

/**
 * metodo lanzado por el contenedor para mostrar el contenido
 */
	 public int doStartTag() throws JspException {

		 JspWriter out = pageContext.getOut(); 
		 
		    
		    try{  
/**
 * 	genero la funcion javascript
 */		    	out.write("<script type='text/javascript'> function sf() { document."+ formulario +".param.focus();  } </script>");
		    	out.write("<body onload='sf()'>");
		    out.write("<SCRIPT LANGUAGE=\"JavaScript\"> \n");
		    out.write("function pick( ");
		    	for(int i=0; campos_form!=null && i < campos_form.length; i++)
		    			out.write(campos_form[i] + ( i==campos_form.length - 1?   " ": ",") );
		    out.write("){ \n");	
		    out.write(" if(window.opener){ \n");
		    
		    //si va a recargar:
		    	if(this.reload!=null) {
		    		
		    	}
		    	else { //no hay recarga, hay pick:
		    		for(int i=0; campos_form!=null && i < campos_form.length; i++)
		    			out.write("window.opener.document."+ formulario + "."+ campos_form[i]+ ".value=" + campos_form[i]+";" );
		    		out.write("\nwindow.close();");
		    	}
		    
		out.write("}\n");
	 	out.write("}\n");
	    out.write("	</SCRIPT> \n");
/**
 * genero el formulario y la tabla html:	
 */
	    out.write("<form action=\"popup.jsp?clase="+ clase + "&formulario="+formulario+"&metodo="+ metodo + "&entidad="+ entidad +
	    		"&metodo_total=" + metodo_total+
	    			"&reload="+ reload +"\" method=\"post\" >\n");
	    out.write("<input type=\"text\" name=\"param\" value=\""+ parametros[parametros.length-1] + "\">");
	    out.write("<input type=\"submit\" name=\"ok\" value=\"Buscar\"> ");
	    for(int i=0;  parametros!=null &&  i<parametros.length;i++) 
			out.write("\n <input type=\"hidden\" name=\"parametros\" value=\""+ parametros[i] + "\">") ;
	    
	    for(int i=0;  parametros_total!=null &&  i<parametros_total.length;i++) 
			out.write("\n <input type=\"hidden\" name=\"parametros_total\" value=\""+ parametros_total[i] + "\">") ;
	    
		//ciclo con los campos
		for(int i=0; campos_form!=null && i< campos_form.length;i++) 
			out.write("\n <input type=\"hidden\" name=\"campos_form\" value=\""+ campos_form[i] + "\">") ;
		
		//ciclo con los campos pick
		for(int i=0; campos_pick!=null && i< campos_pick.length;i++) 
			out.write("\n <input type=\"hidden\" name=\"campos_pick\" value=\""+ campos_pick[i] + "\">") ;

		
		//ciclo con los campos_entity
		for(int i=0; campos_entity!=null &&i<campos_entity.length;i++) 
			out.write("\n <input type=\"hidden\" name=\"campos_entity\" value=\""+ campos_entity[i] + "\">") ;
		//ciclo con los nombres_campos_entity
		for(int i=0;nombres_campos_entity!=null && i <nombres_campos_entity.length;i++) 
			out.write("\n <input type=\"hidden\" name=\"nombres_campos_entity\" value=\""+ nombres_campos_entity[i] + "\">") ;

		out.write("\n <table align=\"center\" border=\"1\" class=\"tabla_form\" width=\"100%\"> \n");
		out.write(" 	<tr> \n");
		
		for(int i=0;nombres_campos_entity!=null && i <nombres_campos_entity.length;i++)
		out.write("<th>"+ nombres_campos_entity[i] + "\n");
		
		//ahora si con el collection saco los valores....
		Iterator ite= lista.iterator();

		if(lista.isEmpty()) {
			out.write("<TR> <TD COLSPAN='20'>NO HAY REGISTROS EN LA BUSQUEDA </tr> </table> ");
		} 
			
		else  {
			
		while(ite.hasNext()) {
			Object objeto = ite.next(); 

			out.write(" 	<tr> \n");
		 for(int i=0; campos_entity!=null && i<campos_entity.length;i++) {
			 	 
			 
			 	
			 
			 //ciclo para generar los campos del pick:
			 out.write("<td><a href=\"javascript:pick(");
			 for(int j=0; campos_pick!=null && j< campos_pick.length;j++) {
				 
				 out.write("'" + "" + helperPopup.getCampo( campos_pick[j], objeto, entidad  ) +  "'" + ( j==campos_pick.length-1 ?"" : ","  ) );
			 }
			 
			 String dato = "";
			 
			 //aki verifico que haya llaves foraneas:
			 if(campos_foranea!=null) {
			 for(int jj=0 ; campos_foranea!=null && jj < campos_foranea.length ; jj ++) {
				 

				 int pos = Integer.parseInt( campos_foranea[jj]);
				 
				 if(i==pos) {
				 String tabla = tablas_foranea[jj];
				 String llavepk = primarias_foranea[jj];
				 String campodesc = desc_foranea[jj];
				 
				 String sql = "select " + campodesc + "  from " + tabla + " where " + llavepk + " = " + (helperPopup.getCampo( campos_entity[i], objeto, entidad  ));
				 ResultSet  res= db.executeQuery(sql);
				 String desc = "";

				 if(res.next()) desc = res.getString(campodesc);
					 dato = desc;
					 break;
				 } else {
					 dato = helperPopup.getCampo( campos_entity[i], objeto, entidad  );
				 }
				 
			 }
			 
			 out.write(")\"> "  + "" + dato  +" </a></td>");
			 
			 	out.write("\n\n");
		 	}
		  else  {
			 // NO HAY LLAVES FORANEAS, QUEDA IGUAL:
		  
			  out.write(")\"> "  + "" + helperPopup.getCampo( campos_entity[i], objeto, entidad  )  +" </a></td>");
				 
			 	out.write("\n\n");
		  
		  }	 
		 }
//		 'campo0','campo1',....)">dato1			
			
		}
		out.write("   	</table>  \n    	</form> \n ");
//		out.write(mensaje==null ?"": mensaje);    	
		    	
		    	
		    	
		} // if de que si hay registros
		    	
		    
out.write("</body>");
        } catch (Exception e) {
        	e.printStackTrace();
	            throw new JspException ("Error: IOException" + 
				                        e.getMessage());
	        }

		        
		        
		        
		        
		        
		        
		        return SKIP_BODY;
		    }
			
		    public int doEndTag() throws JspException {
		        return EVAL_PAGE;
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
			 * @uml.property  name="lista"
			 */
			public Collection getLista() {
				return lista;
			}

			/**
			 * @param lista
			 * @uml.property  name="lista"
			 */
			public void setLista(Collection lista) {
				this.lista = lista;
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

	/*		public String getParam() {
				return param;
			}

			public void setParam(String param) {
				this.param = param;
			}
		*/    
		    

}
