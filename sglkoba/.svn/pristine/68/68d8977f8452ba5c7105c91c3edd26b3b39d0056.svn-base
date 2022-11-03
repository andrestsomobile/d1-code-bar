package sap.control;

import java.util.ArrayList;

public class ResultadoLeerInterface {

	private boolean 			parseadoCorrecto; //indica si el archivo fué correctamente parseado.	
	
	private ArrayList<String[]> dataRaw; //Información completa del archivo.
	private int                 codigoError; //Indica el codigo de error. 0 en caso de no haber error.
	private String              mensajeError; //Mensaje de error explicandolo.
	private String              tipoArchivo; //Tipo de archivo 940, 943, etc.
	private String              idDocumento; //Identificador del documento 00000001212445 etc.
	private String              dataArchivo; //Contenido del archivo cargado.
	

	public ResultadoLeerInterface() {
		this.parseadoCorrecto = false;
		this.dataRaw		  = new ArrayList<String[]>();
		this.codigoError 	  = 0;
		this.tipoArchivo      = "";
		this.idDocumento      = "";
		this.setDataArchivo("");
	}

	public void setDataRaw(ArrayList<String[]> dataRaw){
		
		this.dataRaw = dataRaw;
		tipoArchivo  = "";
		idDocumento  = "";
		
		for(String[] campos : this.dataRaw){			 
			 if(campos.length >= 3){
				 String codigoFila = campos[0];				 
				 if(codigoFila.equals("ST")){
					 this.tipoArchivo = campos[1];
					 this.idDocumento = campos[2];
					 
				 }				 
			 }			 				
		 }		
	}
	
	public ArrayList<String[]>  getDataRaw(){
		return this.dataRaw;
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
	
	public boolean isParseadoCorrecto() {
		return parseadoCorrecto;
	}

	public void setParseadoCorrecto(boolean parseadoCorrecto) {
		this.parseadoCorrecto = parseadoCorrecto;
	}
	
	public String getTipoArchivo() {
		return tipoArchivo;
	}

	public void setTipoArchivo(String tipoArchivo) {
		this.tipoArchivo = tipoArchivo;
	}
	
	public String getIdDocumento() {
		return idDocumento;
	}

	public void setIdDocumento(String idDocumento) {
		this.idDocumento = idDocumento;
	}
	
	//Genera una representación en html del dataRaw
	public String getTableHtmlDataRaw() {
		 String resultado = "<table class=\"tabledata\">";
		 for(String[] campos : this.dataRaw){
			 resultado += "<tr>";
			 for(String campo : campos){
				 resultado += "<td>"+campo+"</td>";
			 }
			 resultado += "</tr>";				 
		 }
		 resultado += "</table>";
		 return resultado;
	}

	public String getDataArchivo() {
		return dataArchivo;
	}

	public void setDataArchivo(String dataArchivo) {
		this.dataArchivo = dataArchivo;
	}
	
		
}
