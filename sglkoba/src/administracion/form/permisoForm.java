package administracion.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getpercodsx() {
ActionErrors errors = new ActionErrors(); 
 gstpermiso gpermiso= new gstpermiso(); 
 opcion = opcion==null || opcion.equals("") ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete") ||  opcion.equals("setapp")) return null; 
 if(opcion.equals("crear")   ) { 
	 permiso per = gpermiso.getpermiso(pergrupo, perapp, permodulo);
} 

//valido campos requeridos:
 } 

 public void llenar (permiso entity ) { 
 

this.percodsx =  entity.getpercodsx(); 
}