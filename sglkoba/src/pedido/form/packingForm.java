package pedido.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getpackcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstpacking gpacking= new gstpacking(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete") || opcion.equals("activar")|| opcion.equals("descomprometer")  ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo Guardar los datos , revise", false) );  
 return errors; 
 } 

 public void llenar (packing entity ) { 
 

this.packcodsx =  entity.getpackcodsx(); 
}