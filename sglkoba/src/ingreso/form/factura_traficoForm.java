package ingreso.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getftrafcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstfactura_trafico gfactura_trafico= new gstfactura_trafico(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null;
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:
 } 

 public void llenar (factura_trafico entity ) { 
 

this.ftrafcodsx =  entity.getftrafcodsx(); 
}