package administracion.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getempcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstempresa gempresa= new gstempresa(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:
 } 

 public void llenar (empresa entity ) { 
 

this.empcodsx =  entity.getempcodsx(); 
}