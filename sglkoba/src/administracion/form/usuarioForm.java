package administracion.form;

 public void setopcion(String newopcion) { this.opcion = newopcion; }
 public String getopcion() { return this.opcion; }
public String getusucodsx() {
ActionErrors errors = new ActionErrors(); 
 gstusuario gusuario= new gstusuario(); 
 opcion = opcion==null || opcion.equals("") ? "crear" : opcion; 
 if(opcion.equals("set") || opcion.equals("delete")   ) return null; 
 
	 
} 

//valido campos requeridos:
 } 

 public void llenar (usuario entity ) { 
 

this.usucodsx =  entity.getusucodsx(); 
}