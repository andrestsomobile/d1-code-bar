package pedido.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getpackdcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstpacking_detalle gpacking_detalle= new gstpacking_detalle(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:
  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo guardar , revise", false) );  
 return errors; 
 } 

 public void llenar (packing_detalle entity ) { 
 

this.packdcodsx =  entity.getpackdcodsx(); 
}