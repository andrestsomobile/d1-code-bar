package nacionalizacion.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getnadcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstnacionalizacion_detalle gnacionalizacion_detalle= new gstnacionalizacion_detalle(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")  || opcion.equals("nacionalizar_referencia") || opcion.equals("nacionalizar_referencia_cantidad") ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 

//valido campos requeridos:
 } 

 public void llenar (nacionalizacion_detalle entity ) { 
 

this.nadcodsx =  entity.getnadcodsx(); 
}