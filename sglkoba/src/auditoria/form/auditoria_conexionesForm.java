package auditoria.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getaudicodsx() {
ActionErrors errors = new ActionErrors(); 
 gstauditoria_conexiones gauditoria_conexiones= new gstauditoria_conexiones(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:

  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo crear , revise", false) );  
 return errors; 
 } 

 public void llenar (auditoria_conexiones entity ) { 
 

this.audicodsx =  entity.getaudicodsx(); 
}