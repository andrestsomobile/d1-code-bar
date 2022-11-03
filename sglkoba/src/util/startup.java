package util;

import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;


/**
 * Servlet implementation class for Servlet: startup
 *
 */
 public class startup extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	
	 InitialContext ic;
		Vector sesiones;
		ServletContext contexto;
		private temporizador temp;

		
		
	 public void init() throws ServletException {
			/**************++
			 * INICIO EL POOL Y EL TEMPORIZADOR Y LO FIJO EN EL CONTEXTO
			 */	
				try {
					ic = new InitialContext();
					ic.rebind("servletcontext", getServletContext());
					Vector x = new Vector();
					x.add("pablito816@gmail.com");
				//	sendmail.enviar( x, "pablito816@gmail.com", "adlgo" , "conte");
					System.out.println("Aplicacion SGL Iniciada...");
					
					temp = new temporizador();  
					temp.programarTemporizador();
					ic.rebind("temporizador",temp);
					
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
	 
			public void destroy() {
				super.destroy();
				try {
					ic.unbind("servletcontext");
					
					temp = (temporizador)ic.lookup("temporizador");
					temp.finalizarTemporizador();
					ic.unbind("temporizador");
					
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}	  	  	    
}