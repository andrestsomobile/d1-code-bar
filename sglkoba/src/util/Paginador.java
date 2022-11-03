package util;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.*;

public class Paginador extends TagSupport{

	/**
	 * url de destino
	 */
	private String url;
	/**
	 * el total son el numero de paginas que salen, de 1 a n...
	 */
	private int total;
	/**
	 * pagina actual, es el numero que equivale al total
	 */
	private String actual;
	/**
	 * el tipo de busquedas a efectuar, dependeran de cada modulo en particular
	 */ 
	
	public void setactual(String actu){
		actual = actu;
	}
	public void settotal(int totaljsp) {
		total = totaljsp;
	}
	public void seturl(String urlJSP) {
		url = urlJSP;
	}
/**
 * metodo lanzado por el contenedor para mostrar el contenido
 */
	 public int doStartTag() throws JspException {

		 JspWriter out = pageContext.getOut(); 
		    System.out.println("actual:"+ actual);
		    System.out.println("total:"+ total);
		    
		    
		    try{  
		    	int _actual = 0;
		    	_actual = actual==null ? 0 : Integer.parseInt(actual);
		    	
		    	
		    	int anterior = _actual - 1;
		    	int siguiente =_actual + 1;
		    
		    	 if(anterior<=0)  	anterior=0;
				 if(siguiente<=0)    	siguiente=0;
				  total = total ==0 ? 1 : total;  
				    
		  out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0'>");
		  out.write("<tr>");
	      out.write( "   <td width='60%'>Pagina "+  ( _actual +1 ) +  " de " + ( total )+ "</td> ");
	      
	      out.write("  <td width='20%'>"+  ( _actual!=0 ? "<a href='"+ url + "&pag=" + anterior + "'> &lt;&lt;Anterior </a> </td>" : "&nbsp;") );
	      out.write("    <td width='20%'>"+ (_actual!= total - 1 ? "<a href='"+ url + "&pag=" + siguiente + "'>Siguiente &gt;&gt; </a> </td> " : "" ));
	      out.write("  </tr> 	      </table>");
	      
		    

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
		    
		    

}
