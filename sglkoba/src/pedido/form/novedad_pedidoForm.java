package pedido.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getnovcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstnovedad_pedido gnovedad_pedido= new gstnovedad_pedido(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:
  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (novedad_pedido entity ) { 
 

this.novcodsx =  entity.getnovcodsx(); 
}