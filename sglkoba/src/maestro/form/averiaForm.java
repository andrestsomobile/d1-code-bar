package maestro.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getavecodsx() {
ActionErrors errors = new ActionErrors(); 
 gstaveria gaveria= new gstaveria(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (averia entity ) { 
 

this.avecodsx =  entity.getavecodsx(); 
}