package parametros.entity;

public class ParametroDestinatario {
	
	private String parametroId;
	private String asunto;
	private String cuerpo;
	private String tipoFuncionalidad;
	private String correos;
	private String transportadora;
	
	
	
	public ParametroDestinatario(String parametroId, String asunto, String cuerpo, String tipoFuncionalidad, String correos, String transportadora) {
		super();
		this.parametroId = parametroId;
		this.asunto = asunto;
		this.cuerpo = cuerpo;
		this.tipoFuncionalidad = tipoFuncionalidad;
		this.correos = correos;
		this.transportadora = transportadora;
	}
	public String getParametroId() {
		return parametroId;
	}
	public void setParametroId(String parametroId) {
		this.parametroId = parametroId;
	}
	public String getAsunto() {
		return asunto;
	}
	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	public String getCuerpo() {
		return cuerpo;
	}
	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}
	public String getTipoFuncionalidad() {
		return tipoFuncionalidad;
	}
	public void setTipoFuncionalidad(String tipoFuncionalidad) {
		this.tipoFuncionalidad = tipoFuncionalidad;
	}
	public String getCorreos() {
		return correos;
	}
	public void setCorreos(String correos) {
		this.correos = correos;
	}
	public String getTransportadora() {
		return transportadora;
	}
	public void setTransportadora(String transportadora) {
		this.transportadora = transportadora;
	}
	
	

}
