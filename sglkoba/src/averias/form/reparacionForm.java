package averias.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getrepcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstreparacion greparacion= new gstreparacion(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   || opcion.equals("crear_pedido") || opcion.equals("activar")) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (reparacion entity ) { 
 

this.repcodsx =  entity.getrepcodsx(); 
}