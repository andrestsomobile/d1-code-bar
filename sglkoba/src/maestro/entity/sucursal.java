package maestro.entity;/** * CLASE GENERADA CON generator V2.0 By pablito****** */public class sucursal implements java.io.Serializable { private String succodsx;private String succodcliente;private String sucnit;private String sucnombre;private String succiudad;private String sucdepartamento;private String succontacto;private String succargo;private String sucemail;private String sucdireccion;private String suctelefono;/** * @uml.property  name="resumen" */private String resumen;/** * @uml.property  name="succodigo" */private String succodigo;public sucursal(String succodsx,String succodcliente,String sucnit,String sucnombre,String succiudad,String sucdepartamento,String succontacto,String succargo,String sucemail,String sucdireccion,String suctelefono, String resumen, String succodigo)  {this.succodsx  =  succodsx;this.succodcliente  =  succodcliente;this.sucnit  =  sucnit;this.sucnombre  =  sucnombre;this.succiudad  =  succiudad;this.sucdepartamento  =  sucdepartamento;this.succontacto  =  succontacto;this.succargo  =  succargo;this.sucemail  =  sucemail;this.sucdireccion  =  sucdireccion;this.suctelefono  =  suctelefono;this.resumen =  resumen;this.succodigo =succodigo;}public String getsuccodsx() {return succodsx;}public String getsuccodcliente() {return succodcliente;}public String getsucnit() {return sucnit;}public String getsucnombre() {return sucnombre;}public String getsucciudad() {return succiudad;}public String getsucdepartamento() {return sucdepartamento;}public String getsuccontacto() {return succontacto;}public String getsuccargo() {return succargo;}public String getsucemail() {return sucemail;}public String getsucdireccion() {return sucdireccion;}public String getsuctelefono() {return suctelefono;}public void setsuccodsx(String new_succodsx) {this.succodsx =  new_succodsx;}public void setsuccodcliente(String new_succodcliente) {this.succodcliente =  new_succodcliente;}public void setsucnit(String new_sucnit) {this.sucnit =  new_sucnit;}public void setsucnombre(String new_sucnombre) {this.sucnombre =  new_sucnombre;}public void setsucciudad(String new_succiudad) {this.succiudad =  new_succiudad;}public void setsucdepartamento(String new_sucdepartamento) {this.sucdepartamento =  new_sucdepartamento;}public void setsuccontacto(String new_succontacto) {this.succontacto =  new_succontacto;}public void setsuccargo(String new_succargo) {this.succargo =  new_succargo;}public void setsucemail(String new_sucemail) {this.sucemail =  new_sucemail;}public void setsucdireccion(String new_sucdireccion) {this.sucdireccion =  new_sucdireccion;}public void setsuctelefono(String new_suctelefono) {this.suctelefono =  new_suctelefono;}/** * @return * @uml.property  name="resumen" */public String getResumen() {	return resumen;}/** * @param resumen * @uml.property  name="resumen" */public void setResumen(String resumen) {	this.resumen = resumen;}/** * @return * @uml.property  name="succodigo" */public String getSuccodigo() {	return succodigo;}/** * @param succodigo * @uml.property  name="succodigo" */public void setSuccodigo(String succodigo) {	this.succodigo = succodigo;}}