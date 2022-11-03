/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package util.properties;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
 import java.util.HashMap;
 import java.io.FileInputStream;
 
 public  class Propiedades {
 
   private static  String fileConfiguracion;
   private static  String ruta;
   private static HashMap propiedades;
 
   
   
 
   public Propiedades(String ruta, String archivo) throws  FileNotFoundException, IOException {
       String rutaArchivo = ruta+File.separator+"WEB-INF"+File.separator+archivo;
       fileConfiguracion = rutaArchivo;
       this.ruta = ruta;
       FileInputStream f = new FileInputStream(fileConfiguracion);
       Properties propiedadesTemporales = new Properties();
       propiedadesTemporales.load(f);
       f.close();
       propiedades = new HashMap(propiedadesTemporales);
   }
 
   public static String getPropiedad(String nombre)
         throws FaltaPropiedadException {
	 
	   System.out.println("********************"+nombre);
     String valor = (String) propiedades.get(nombre);
     System.out.println("***************"+valor);
     if (valor == null)
       throw new FaltaPropiedadException(nombre);
 
     return valor;
   }

    public static String getRuta() {
        return ruta;
    }
   
   
   
 }