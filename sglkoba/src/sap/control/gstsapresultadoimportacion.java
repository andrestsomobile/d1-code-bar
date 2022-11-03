package sap.control;

public class gstsapresultadoimportacion {
	
	private boolean success;      //Indica si la operación fué exitosa o no.
	private int     codigoError;  //Indica el código de error.
	private String  mensajeError; //Indica el mensaje a monstrar al usuario del error
	private String  mensajeErrorExtensionHtml; //Envía información adicional como HTML
	
	public gstsapresultadoimportacion(){
		this.success      				= true;
		this.codigoError  				= 0;
		this.mensajeError 				= "";
		this.mensajeErrorExtensionHtml  = "";
	}
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}


	public int getCodigoError() {
		return codigoError;
	}


	public void setCodigoError(int codigoError) {
		this.codigoError = codigoError;
	}


	public String getMensajeError() {
		return mensajeError;
	}


	public void setMensajeError(String mensajeError) {
		this.mensajeError = mensajeError;
	}

	public String getMensajeErrorExtensionHtml() {
		return mensajeErrorExtensionHtml;
	}

	public void setMensajeErrorExtensionHtml(String mensajeErrorExtensionHtml) {
		this.mensajeErrorExtensionHtml = mensajeErrorExtensionHtml;
	}


	

}
