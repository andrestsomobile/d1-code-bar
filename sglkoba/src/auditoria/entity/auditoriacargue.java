package auditoria.entity;

public class auditoriacargue {

	private String accodsx;

	private String accodcia;

	private String acactividad;

	private String acfechainicio;

	private String acfechafinal;

	private String acobservacion;

	private String accodusuario;

	private String acarchivo;

	private String acinconsistencias;

	public auditoriacargue(String accodsx, String accodcia, String acactividad, String acfechainicio, String acfechafinal, String acobservacion, String accodusuario, String acarchivo, String acinconsistencias) {
		super();
		this.accodsx = accodsx;
		this.accodcia = accodcia;
		this.acactividad = acactividad;
		this.acfechainicio = acfechainicio;
		this.acfechafinal = acfechafinal;
		this.acobservacion = acobservacion;
		this.accodusuario = accodusuario;
		this.acarchivo = acarchivo;
		this.acinconsistencias = acinconsistencias;
	}

	public String getAccodsx() {
		return accodsx;
	}

	public void setAccodsx(String accodsx) {
		this.accodsx = accodsx;
	}

	public String getAccodcia() {
		return accodcia;
	}

	public void setAccodcia(String accodcia) {
		this.accodcia = accodcia;
	}

	public String getAcactividad() {
		return acactividad;
	}

	public void setAcactividad(String acactividad) {
		this.acactividad = acactividad;
	}

	public String getAcfechainicio() {
		return acfechainicio;
	}

	public void setAcfechainicio(String acfechainicio) {
		this.acfechainicio = acfechainicio;
	}

	public String getAcfechafinal() {
		return acfechafinal;
	}

	public void setAcfechafinal(String acfechafinal) {
		this.acfechafinal = acfechafinal;
	}

	public String getAcobservacion() {
		return acobservacion;
	}

	public void setAcobservacion(String acobservacion) {
		this.acobservacion = acobservacion;
	}

	public String getAccodusuario() {
		return accodusuario;
	}

	public void setAccodusuario(String accodusuario) {
		this.accodusuario = accodusuario;
	}

	public String getAcarchivo() {
		return acarchivo;
	}

	public void setAcarchivo(String acarchivo) {
		this.acarchivo = acarchivo;
	}

	public String getAcinconsistencias() {
		return acinconsistencias;
	}

	public void setAcinconsistencias(String acinconsistencias) {
		this.acinconsistencias = acinconsistencias;
	}

}
