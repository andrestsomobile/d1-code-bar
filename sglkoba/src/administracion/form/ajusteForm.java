package administracion.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getajcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstajuste gajuste= new gstajuste(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:
   if(ajobservacion.equals("")) errors.add("ajobservacion", new ActionMessage("La observacion no puede ser vacio", false) );
  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (ajuste entity ) { 
 

this.ajcodsx =  entity.getajcodsx(); 
}