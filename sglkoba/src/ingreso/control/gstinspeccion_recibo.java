package ingreso.control;

import java.sql.SQLException;

import db.GstTabla;
import db.beanConnector;
import ingreso.entity.inspeccion_recibo;

public class gstinspeccion_recibo extends GstTabla {

	public gstinspeccion_recibo() {
		db = new beanConnector();
		this.classEntidad = inspeccion_recibo.class;
	}

	public gstinspeccion_recibo(beanConnector db) {
		this.db = db;
		this.classEntidad = inspeccion_recibo.class;
	}

	public inspeccion_recibo getinspeccion_recibo(String inretrafico, String inrelctrafico) {
		String cad = "SELECT inspeccion_recibo.* FROM inspeccion_recibo WHERE inretrafico = " + inretrafico + "  and inrelctrafico= " + inrelctrafico;
		return (inspeccion_recibo) getEntidad(cad);
	}
	
	public boolean eliminar(String inretrafico, String inrelctrafico) throws SQLException {
		String elim = " delete from inspeccion_recibo WHERE inretrafico = " + inretrafico + "  and inrelctrafico= " + inrelctrafico;
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}
	
	public boolean crearinspeccion_recibo(String inretrafico, String inrelctrafico, String inremuelle, String inreprecinto, String inrevencimiento, String inrelote, String inreestibas, String inrecajas, String inresaldo, String inrenovedades, String inrerecuperadas, String inretotalump,
			String inreesibasrequeridas, String inrepesoestibavacia, String inrepesototalestibasvacias, String inrepesoestibapaletizada, String inrepesoporump, String inrepesonetoproducto, String inreobservaciones, String inrearlvigente_cal, String inrearlvigente_obs, String inrecarnet_cal,
			String inrecarnet_obs, String inreproteccion_cal, String inreproteccion_obs, String inrefumigacion_cal, String inrefumigacion_obs, String inremanipulacion_cal, String inremanipulacion_obs, String inreaseovehiculo_cal, String inreaseovehiculo_obs, String inresustanciasquimicas_cal,
			String inresustanciasquimicas_obs, String inretemperatura_cal, String inretemperatura_obs, String inreestadogeneral_cal, String inreestadogeneral_obs, String inrerevisiones_cal, String inrerevisiones_obs, String inreumprecibidas_cal, String inreumprecibidas_obs,
			String inreumprevisadas_cal, String inreumprevisadas_obs, String inretablanutricional_cal, String inretablanutricional_obs, String inreimportacioncinc_cal, String inreimportacioncinc_obs, String inrecalificacion_cal, String inrecalificacion_obs, String inrerecibido, String inreconductor,
			String inrefechagenerado) throws SQLException {
		String insert = "	INSERT INTO inspeccion_recibo("
				+ "            inretrafico, inrelctrafico, inremuelle, inreprecinto, inrevencimiento,"
				+ "            inrelote, inreestibas, inrecajas, inresaldo, inrenovedades, inrerecuperadas,"
				+ "            inretotalump, inreesibasrequeridas, inrepesoestibavacia, inrepesototalestibasvacias," 
				+ "            inrepesoestibapaletizada, inrepesoporump, inrepesonetoproducto," 
				+ "            inreobservaciones, inrearlvigente_cal, inrearlvigente_obs, inrecarnet_cal," 
				+ "            inrecarnet_obs, inreproteccion_cal, inreproteccion_obs, inrefumigacion_cal," 
				+ "            inrefumigacion_obs, inremanipulacion_cal, inremanipulacion_obs, "
				+ "            inreaseovehiculo_cal, inreaseovehiculo_obs, inresustanciasquimicas_cal," 
				+ "            inresustanciasquimicas_obs, inretemperatura_cal, inretemperatura_obs, "
				+ "            inreestadogeneral_cal, inreestadogeneral_obs, inrerevisiones_cal, "
				+ "            inrerevisiones_obs, inreumprecibidas_cal, inreumprecibidas_obs, "
				+ "            inreumprevisadas_cal, inreumprevisadas_obs, inretablanutricional_cal, "
				+ "            inretablanutricional_obs, inreimportacioncinc_cal, inreimportacioncinc_obs, "
				+ "            inrecalificacion_cal, inrecalificacion_obs, inrerecibido, inreconductor," 
				+ "            inrefechagenerado) VALUES ("
				
				+ (inretrafico == null ? "NULL" : "'" + inretrafico + "'") 
				+ "," + (inrelctrafico == null ? "NULL" : "'" + inrelctrafico + "'") 
				+ "," + (inremuelle == null ? "NULL" : "'" + inremuelle + "'") 
				+ "," + (inreprecinto == null ? "NULL" : "'" + inreprecinto + "' ") 
				+ "," + (inrevencimiento == null ? "NULL" : "'" + inrevencimiento + "' ") 
				+ "," + (inrelote == null ? "NULL" : "'" + inrelote + "' ") 
				+ "," + (inreestibas == null ? "NULL" : "'" + inreestibas + "' ") 
				+ "," + (inrecajas == null ? "NULL" : "'" + inrecajas + "' ") 
				+ "," + (inresaldo == null ? "NULL" : "'" + inresaldo + "' ") 
				+ "," + (inrenovedades == null ? "NULL" : "'" + inrenovedades + "' ") 
				+ "," + (inrerecuperadas == null ? "NULL" : "'" + inrerecuperadas + "' ") 
				+ "," + (inretotalump == null ? "NULL" : "'" + inretotalump + "' ") 
				+ "," + (inreesibasrequeridas == null ? "NULL" : "'" + inreesibasrequeridas + "' ") 
				+ "," + (inrepesoestibavacia == null ? "NULL" : "'" + inrepesoestibavacia + "' ") 
				+ "," + (inrepesototalestibasvacias == null ? "NULL" : "'" + inrepesototalestibasvacias + "' ") 
				+ "," + (inrepesoestibapaletizada == null ? "NULL" : "'" + inrepesoestibapaletizada + "' ") 
				+ "," + (inrepesoporump == null ? "NULL" : "'" + inrepesoporump + "' ") 
				+ "," + (inrepesonetoproducto == null ? "NULL" : "'" + inrepesonetoproducto + "' ") 
				+ "," + (inreobservaciones == null ? "NULL" : "'" + inreobservaciones + "' ") 
				+ "," + (inrearlvigente_cal == null ? "NULL" : "'" + inrearlvigente_cal + "' ") 
				+ "," + (inrearlvigente_obs == null ? "NULL" : "'" + inrearlvigente_obs + "' ") 
				+ "," + (inrecarnet_cal == null ? "NULL" : "'" + inrecarnet_cal + "' ") 
				+ "," + (inrecarnet_obs == null ? "NULL" : "'" + inrecarnet_obs + "' ") 
				+ "," + (inreproteccion_cal == null ? "NULL" : "'" + inreproteccion_cal + "' ") 
				+ "," + (inreproteccion_obs == null ? "NULL" : "'" + inreproteccion_obs + "' ") 
				+ "," + (inrefumigacion_cal == null ? "NULL" : "'" + inrefumigacion_cal + "' ") 
				+ "," + (inrefumigacion_obs == null ? "NULL" : "'" + inrefumigacion_obs + "' ") 
				+ "," + (inremanipulacion_cal == null ? "NULL" : "'" + inremanipulacion_cal + "' ") 
				+ "," + (inremanipulacion_obs == null ? "NULL" : "'" + inremanipulacion_obs + "' ") 
				+ "," + (inreaseovehiculo_cal == null ? "NULL" : "'" + inreaseovehiculo_cal + "' ") 
				+ "," + (inreaseovehiculo_obs == null ? "NULL" : "'" + inreaseovehiculo_obs + "' ") 
				+ "," + (inresustanciasquimicas_cal == null ? "NULL" : "'" + inresustanciasquimicas_cal + "' ") 
				+ "," + (inresustanciasquimicas_obs == null ? "NULL" : "'" + inresustanciasquimicas_obs + "' ") 
				+ "," + (inretemperatura_cal == null ? "NULL" : "'" + inretemperatura_cal + "' ") 
				+ "," + (inretemperatura_obs == null ? "NULL" : "'" + inretemperatura_obs + "' ") 
				+ "," + (inreestadogeneral_cal == null ? "NULL" : "'" + inreestadogeneral_cal + "' ") 
				+ "," + (inreestadogeneral_obs == null ? "NULL" : "'" + inreestadogeneral_obs + "' ") 
				+ "," + (inrerevisiones_cal == null ? "NULL" : "'" + inrerevisiones_cal + "' ") 
				+ "," + (inrerevisiones_obs == null ? "NULL" : "'" + inrerevisiones_obs + "' ") 
				+ "," + (inreumprecibidas_cal == null ? "NULL" : "'" + inreumprecibidas_cal + "' ") 
				+ "," + (inreumprecibidas_obs == null ? "NULL" : "'" + inreumprecibidas_obs + "' ") 
				+ "," + (inreumprevisadas_cal == null ? "NULL" : "'" + inreumprevisadas_cal + "' ") 
				+ "," + (inreumprevisadas_obs == null ? "NULL" : "'" + inreumprevisadas_obs + "' ") 
				+ "," + (inretablanutricional_cal == null ? "NULL" : "'" + inretablanutricional_cal + "' ") 
				+ "," + (inretablanutricional_obs == null ? "NULL" : "'" + inretablanutricional_obs + "' ") 
				+ "," + (inreimportacioncinc_cal == null ? "NULL" : "'" + inreimportacioncinc_cal + "' ") 	
				+ "," + (inreimportacioncinc_obs == null ? "NULL" : "'" + inreimportacioncinc_obs + "' ") 
				+ "," + (inrecalificacion_cal == null ? "NULL" : "'" + inrecalificacion_cal + "' ") 
				+ "," + (inrecalificacion_obs == null ? "NULL" : "'" + inrecalificacion_obs + "' ") 
				+ "," + (inrerecibido == null ? "NULL" : "'" + inrerecibido + "' ") 
				+ "," + (inreconductor == null ? "NULL" : "'" + inreconductor + "' ") 
				+ "," + (inrefechagenerado == null ? "current_date" : "'" + inrefechagenerado + "' ") 
				+ ")";
		int resp = db.executeUpdate(insert);
		return resp == 0 ? false : true;
	}
	
}