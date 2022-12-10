package ingreso.entity;

public class lote_contenedor_trafico implements java.io.Serializable {
	
	private String lctrafcodsx;
	
	private String lctrafcontenedor;
	
	private String lctraflote;
	
	private String lctrafcantidad;
	
	private String lctrafingreso;

	public lote_contenedor_trafico(String lctrafcodsx, String lctrafcontenedor, String lctraflote, String lctrafcantidad, String lctrafingreso) {
		super();
		this.lctrafcodsx = lctrafcodsx;
		this.lctrafcontenedor = lctrafcontenedor;
		this.lctraflote = lctraflote;
		this.lctrafcantidad = lctrafcantidad;
		this.lctrafingreso = lctrafingreso;
	}
	
	

	public lote_contenedor_trafico(String lctrafcodsx) {
		super();
		this.lctrafcodsx = lctrafcodsx;
	}



	public String getlctrafcodsx() {
		return lctrafcodsx;
	}

	public void setlctrafcodsx(String lctrafcodsx) {
		this.lctrafcodsx = lctrafcodsx;
	}

	public String getlctrafcontenedor() {
		return lctrafcontenedor;
	}

	public void setlctrafcontenedor(String lctrafcontenedor) {
		this.lctrafcontenedor = lctrafcontenedor;
	}

	public String getlctraflote() {
		return lctraflote;
	}

	public void setlctraflote(String lctraflote) {
		this.lctraflote = lctraflote;
	}

	public String getlctrafcantidad() {
		return lctrafcantidad;
	}

	public void setlctrafcantidad(String lctrafcantidad) {
		this.lctrafcantidad = lctrafcantidad;
	}

	public String getlctrafingreso() {
		return lctrafingreso;
	}

	public void setlctrafingreso(String lctrafingreso) {
		this.lctrafingreso = lctrafingreso;
	}
	
	
	

}
