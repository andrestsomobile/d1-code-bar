package maestro.entity;/** * CLASE GENERADA CON generator V2.0 By pablito****** */public class departamento implements java.io.Serializable { private String depcodigo;private String depnombre;private String depzona;/** * @uml.property  name="resumen" */private String resumen;public departamento(String depcodigo,String depnombre,String depzona, String resumen)  {this.depcodigo  =  depcodigo;this.depnombre  =  depnombre;this.depzona  =  depzona;this.resumen = resumen;}public String getdepcodigo() {return depcodigo;}public String getdepnombre() {return depnombre;}public String getdepzona() {return depzona;}public void setdepcodigo(String new_depcodigo) {this.depcodigo =  new_depcodigo;}public void setdepnombre(String new_depnombre) {this.depnombre =  new_depnombre;}public void setdepzona(String new_depzona) {this.depzona =  new_depzona;}/** * @return * @uml.property  name="resumen" */public String getResumen() {	return resumen;}/** * @param resumen * @uml.property  name="resumen" */public void setResumen(String resumen) {	this.resumen = resumen;}}