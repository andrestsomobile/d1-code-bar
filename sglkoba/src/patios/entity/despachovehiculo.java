package patios.entity;

public class despachovehiculo implements java.io.Serializable {
	private String dvcodsx;

	private String dvfecha;

	private String dvcodpedido;

	private String dvcodtransportadora;

	private String dvestado;

	private String dvnotificacion;
	
	private String resumen;

	public despachovehiculo(String dvcodsx, String dvfecha, String dvcodpedido, String dvcodtransportadora, String dvestado, String dvnotificacion, String resumen) {
		super();
		this.dvcodsx = dvcodsx;
		this.dvfecha = dvfecha;
		this.dvcodpedido = dvcodpedido;
		this.dvcodtransportadora = dvcodtransportadora;
		this.dvestado = dvestado;
		this.dvnotificacion = dvnotificacion;
		this.resumen = resumen;
	}

	public String getDvcodsx() {
		return dvcodsx;
	}

	public void setDvcodsx(String dvcodsx) {
		this.dvcodsx = dvcodsx;
	}

	public String getDvfecha() {
		return dvfecha;
	}

	public void setDvfecha(String dvfecha) {
		this.dvfecha = dvfecha;
	}

	public String getDvcodpedido() {
		return dvcodpedido;
	}

	public void setDvcodpedido(String dvcodpedido) {
		this.dvcodpedido = dvcodpedido;
	}

	public String getDvcodtransportadora() {
		return dvcodtransportadora;
	}

	public void setDvcodtransportadora(String dvcodtransportadora) {
		this.dvcodtransportadora = dvcodtransportadora;
	}

	public String getDvestado() {
		return dvestado;
	}

	public void setDvestado(String dvestado) {
		this.dvestado = dvestado;
	}

	public String getDvnotificacion() {
		return dvnotificacion;
	}

	public void setDvnotificacion(String dvnotificacion) {
		this.dvnotificacion = dvnotificacion;
	}

	public String getResumen() {
		return resumen;
	}

	public void setResumen(String resumen) {
		this.resumen = resumen;
	}
}
