package patios.entity;

public class detalleentradavehiculo implements java.io.Serializable {

	private String devcodsx;

	private String devcodentrada;

	private String devreferencia;

	private String devmarca;

	private String devmodelo;

	private String devmotor;

	private String devvinchasis;

	private String devlocacion;

	private String devcolor;

	private String devestado;

	private String devfechaingreso;

	private String devfechasalida;

	private String devfechaalistamiento;
	
	private String devnovedades;
	
	private String resumen;

	public detalleentradavehiculo(String devcodsx, String devcodentrada, String devreferencia, String devmarca, String devmodelo, String devmotor, String devvinchasis, String devlocacion, String devcolor, String devestado, String devfechaingreso, String devfechasalida, String devfechaalistamiento, String devnovedades, String resumen) {
		super();
		this.devcodsx = devcodsx;
		this.devcodentrada = devcodentrada;
		this.devreferencia = devreferencia;
		this.devmarca = devmarca;
		this.devmodelo = devmodelo;
		this.devmotor = devmotor;
		this.devvinchasis = devvinchasis;
		this.devlocacion = devlocacion;
		this.devcolor = devcolor;
		this.devestado = devestado;
		this.devfechaingreso = devfechaingreso;
		this.devfechasalida = devfechasalida;
		this.devfechaalistamiento = devfechaalistamiento;
		this.devnovedades = devnovedades;
		this.resumen = resumen;
	}

	public String getDevcodsx() {
		return devcodsx;
	}

	public void setDevcodsx(String devcodsx) {
		this.devcodsx = devcodsx;
	}

	public String getDevcodentrada() {
		return devcodentrada;
	}

	public void setDevcodentrada(String devcodentrada) {
		this.devcodentrada = devcodentrada;
	}

	public String getDevreferencia() {
		return devreferencia;
	}

	public void setDevreferencia(String devreferencia) {
		this.devreferencia = devreferencia;
	}

	public String getDevmarca() {
		return devmarca;
	}

	public void setDevmarca(String devmarca) {
		this.devmarca = devmarca;
	}

	public String getDevmodelo() {
		return devmodelo;
	}

	public void setDevmodelo(String devmodelo) {
		this.devmodelo = devmodelo;
	}

	public String getDevmotor() {
		return devmotor;
	}

	public void setDevmotor(String devmotor) {
		this.devmotor = devmotor;
	}

	public String getDevvinchasis() {
		return devvinchasis;
	}

	public void setDevvinchasis(String devvinchasis) {
		this.devvinchasis = devvinchasis;
	}

	public String getDevlocacion() {
		return devlocacion;
	}

	public void setDevlocacion(String devlocacion) {
		this.devlocacion = devlocacion;
	}

	public String getDevcolor() {
		return devcolor;
	}

	public void setDevcolor(String devcolor) {
		this.devcolor = devcolor;
	}

	public String getDevestado() {
		return devestado;
	}

	public void setDevestado(String devestado) {
		this.devestado = devestado;
	}

	public String getDevfechaingreso() {
		return devfechaingreso;
	}

	public void setDevfechaingreso(String devfechaingreso) {
		this.devfechaingreso = devfechaingreso;
	}

	public String getDevfechasalida() {
		return devfechasalida;
	}

	public void setDevfechasalida(String devfechasalida) {
		this.devfechasalida = devfechasalida;
	}

	public String getDevfechaalistamiento() {
		return devfechaalistamiento;
	}

	public void setDevfechaalistamiento(String devfechaalistamiento) {
		this.devfechaalistamiento = devfechaalistamiento;
	}

	public String getDevnovedades() {
		return devnovedades;
	}

	public void setDevnovedades(String devnovedades) {
		this.devnovedades = devnovedades;
	}

	public String getResumen() {
		return resumen;
	}

	public void setResumen(String resumen) {
		this.resumen = resumen;
	}
}
