package ingreso.entity;

public class lote_trafico implements java.io.Serializable {
	private String ltrafcodsx;

	private String ltraflote;

	private String ltrafnumtrafico;

	private String ltrafelaboracion;

	private String ltrafvencimiento;

	private String ltrafproveedor;

	private String ltrafproducto;

	private String ltrafcodproducto;

	public lote_trafico(String ltrafcodsx, String ltraflote, String ltrafnumtrafico, String ltrafelaboracion, String ltrafvencimiento, String ltrafproveedor, String ltrafproducto, String ltrafcodproducto) {
		super();
		this.ltrafcodsx = ltrafcodsx;
		this.ltraflote = ltraflote;
		this.ltrafnumtrafico = ltrafnumtrafico;
		this.ltrafelaboracion = ltrafelaboracion;
		this.ltrafvencimiento = ltrafvencimiento;
		this.ltrafproveedor = ltrafproveedor;
		this.ltrafproducto = ltrafproducto;
		this.ltrafcodproducto = ltrafcodproducto;
	}

	public String getLtrafcodsx() {
		return ltrafcodsx;
	}

	public void setLtrafcodsx(String ltrafcodsx) {
		this.ltrafcodsx = ltrafcodsx;
	}

	public String getLtraflote() {
		return ltraflote;
	}

	public void setLtraflote(String ltraflote) {
		this.ltraflote = ltraflote;
	}

	public String getLtrafnumtrafico() {
		return ltrafnumtrafico;
	}

	public void setLtrafnumtrafico(String ltrafnumtrafico) {
		this.ltrafnumtrafico = ltrafnumtrafico;
	}

	public String getLtrafelaboracion() {
		return ltrafelaboracion;
	}

	public void setLtrafelaboracion(String ltrafelaboracion) {
		this.ltrafelaboracion = ltrafelaboracion;
	}

	public String getLtrafvencimiento() {
		return ltrafvencimiento;
	}

	public void setLtrafvencimiento(String ltrafvencimiento) {
		this.ltrafvencimiento = ltrafvencimiento;
	}

	public String getLtrafproveedor() {
		return ltrafproveedor;
	}

	public void setLtrafproveedor(String ltrafproveedor) {
		this.ltrafproveedor = ltrafproveedor;
	}

	public String getLtrafproducto() {
		return ltrafproducto;
	}

	public void setLtrafproducto(String ltrafproducto) {
		this.ltrafproducto = ltrafproducto;
	}

	public String getltrafcodproducto() {
		return ltrafcodproducto;
	}

	public void settrafcodproducto(String ltrafcodproducto) {
		this.ltrafcodproducto = ltrafcodproducto;
	}

}
