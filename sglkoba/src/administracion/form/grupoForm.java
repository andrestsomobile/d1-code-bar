package administracion.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getgcodsx() {
ActionErrors errors = new ActionErrors(); 
 gstgrupo ggrupo= new gstgrupo(); 
 opcion = opcion==null || opcion.equals("") ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 if(opcion.equals("crear")   ) { 
	 
} 

//valido campos requeridos:
 } 

 public void llenar (grupo entity ) { 
 

this.gcodsx =  entity.getgcodsx(); 
}