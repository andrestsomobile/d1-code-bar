package pedido.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getcaupcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstcausal_pedido gcausal_pedido= new gstcausal_pedido(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete" +
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (causal_pedido entity ) { 
 

this.caupcodsx =  entity.getcaupcodsx(); 
}