package pedido.form;

 
 public String getopcion() { return this.opcion; }
public String getpedcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstpedido gpedido= new gstpedido(); 
 opcion = opcion==null ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete") || opcion.equals("activar")  || opcion.equals("fijar_factura") ) return null; 
 if(opcion.equals("crear")   ) { 
 //@todo COMPLETAR EL CREAR, SOLO LLAVES UNICAS O REPETIDAS 
} 
pedpicking = pedpicking!=null && pedpicking.equals("") ? null : pedpicking;
//valido campos requeridos:
   if(pedcausal_hit.equals("") ) errors.add("pedcausal_hit", new ActionMessage("El Causal HIT de pedido no puede ser vacio", false) );
 return errors; 
 } 

 public void llenar (pedido entity ) { 
 

this.pedcodsx =  entity.getpedcodsx(); 
}