package util;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;

import maestro.control.gstproducto;

/**
 * clase que tiene metodos para devolver collections
 * con listas armando todo a partir de parametros 
 * y con reflexion
 */
public class helperPopup {

	
	
	public static int getTotal(String _clase, String metodo_total, String entity,
				String[] parametros ) throws Exception {
		int resp=0;
		Class[] params = new Class[ parametros.length];
			for(int i=0; i <parametros.length ; i++) {
				params[i] = parametros[i].getClass();
			}
			
		try {
		Class clase = Class.forName(_clase);
		Constructor c = clase.getConstructor( null);
		
		Object objeto = c.newInstance(null);
		
		Method metodo = clase.getMethod( metodo_total, params);
		 resp = (Integer)metodo.invoke( objeto, parametros);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return resp;
	}
	
	public static Collection getLista(String _clase, String _metodo, String[] parametros) {
		Collection resp = new ArrayList();
		Class[] params = new Class[ parametros.length];
			for(int i=0; i <parametros.length ; i++) {
				params[i] = parametros[i].getClass();
			}
			
		try {
		Class clase = Class.forName(_clase);
		Constructor c = clase.getConstructor( null);
		
		Object objeto = c.newInstance(null);
		
		Method metodo = clase.getMethod( _metodo , params);
		 resp = (Collection)metodo.invoke( objeto, parametros);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return resp;
	}
	
	
	
	public static String getCampo(String campo, Object entidad, String entity){
		String resp = "";
		Class clase = entidad.getClass();
		Method metodo= null;
		try {
			metodo = clase.getMethod( "get" + campo , null);
			resp = (String)metodo.invoke(entidad, null );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 
		return resp==null ?"" : resp;
	}
}
