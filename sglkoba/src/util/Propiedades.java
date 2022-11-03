package util;

import java.util.Locale;
import java.util.ResourceBundle;

public class Propiedades extends Object {

	/**
	 * Constructor
	 */
 	public Propiedades() {
	}

 
 	public static String getProperties(String clave){
 		ResourceBundle archivoPropiedades;
   		String cadena = null;
    	if (clave != null) {
        	archivoPropiedades = ResourceBundle.getBundle("parametros",Locale.getDefault());
   			cadena = archivoPropiedades.getString(clave);
        }
   		return cadena;
	}//fin getProperties

}


