/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package util.properties;

 public class FaltaPropiedadException extends Exception {
 
   private String nombreParametro;
 
   public FaltaPropiedadException(String nombreParametro) {
     super("Falta parametro de configuracion: '" + nombreParametro + "'");
     this.nombreParametro = nombreParametro;
   }
 
   public String getNombreParametro() {
     return nombreParametro;
   }
 }
