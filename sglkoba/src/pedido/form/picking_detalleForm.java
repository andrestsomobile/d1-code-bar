package pedido.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getpickdcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstpicking_detalle gpicking_detalle= new gstpicking_detalle(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:
   if(!validador.validarNumero(pickdvalorunit)) errors.add("pickdvalorunit", new ActionMessage("El valur unitario no puede ser vacio y debe ser numerico", false) );
  if(!errors.isEmpty()) errors.add("general", new ActionMessage("No se pudo guardar los datos , revise", false) );  
 return errors; 
 } 

 public void llenar (picking_detalle entity ) { 
 

this.pickdcodsx =  entity.getpickdcodsx(); 
}