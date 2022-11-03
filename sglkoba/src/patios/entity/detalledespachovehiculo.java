package patios.entity;

public class detalledespachovehiculo implements java.io.Serializable {
	private String ddvcodsx;

	private String ddvcoddespacho;

	private String ddvcoddetpedido;

	public detalledespachovehiculo(String ddvcodsx, String ddvcoddespacho, String ddvcoddetpedido) {
		super();
		this.ddvcodsx = ddvcodsx;
		this.ddvcoddespacho = ddvcoddespacho;
		this.ddvcoddetpedido = ddvcoddetpedido;
	}

	public String getDdvcodsx() {
		return ddvcodsx;
	}

	public void setDdvcodsx(String ddvcodsx) {
		this.ddvcodsx = ddvcodsx;
	}

	public String getDdvcoddespacho() {
		return ddvcoddespacho;
	}

	public void setDdvcoddespacho(String ddvcoddespacho) {
		this.ddvcoddespacho = ddvcoddespacho;
	}

	public String getDdvcoddetpedido() {
		return ddvcoddetpedido;
	}

	public void setDdvcoddetpedido(String ddvcoddetpedido) {
		this.ddvcoddetpedido = ddvcoddetpedido;
	}

}
