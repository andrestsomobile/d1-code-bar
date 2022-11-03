package distrinal.control;

import java.sql.SQLException;
import java.util.Collection;

import db.GstTabla;
import db.beanConnector;
import distrinal.entity.distnal_ingreso;

public class gstdistnal_ingreso extends GstTabla implements java.io.Serializable {
	

	public gstdistnal_ingreso() {
		db = new beanConnector();
		this.classEntidad = distnal_ingreso.class;
	}

	public gstdistnal_ingreso(beanConnector db) {
		this.db = db;
		this.classEntidad = distnal_ingreso.class;
	}

	
	public boolean creardistnal_ingreso(String dnicodigocargue, String dnicompania, String dnifecha, String dniimportacion
			, String dniproveedor, String dniproducto, String dniumpestiba, String dnicantidad, String dnilote, String dnifechavencimiento
			, String dnicantcontenedor, String dnitipocontenedor, String dniumpesperadas, String dniumprecibidas, String dniaveriasrecibidas
			, String dniaveriasrecuperadas, String dniaveriastotales, String dnitransportadora, String dniplaca, String dnietarealcedi
			, String dnirecibelogistica) throws SQLException {
		String insert = "INSERT INTO distnal_ingreso (dnicodigocargue, dnicompania, dnifecha, dniimportacion, \r\n" + 
				"            dniproveedor, dniproducto, dniumpestiba, dnicantidad, dnilote, \r\n" + 
				"            dnifechavencimiento, dnicantcontenedor, dnitipocontenedor, dniumpesperadas, \r\n" + 
				"            dniumprecibidas, dniaveriasrecibidas, dniaveriasrecuperadas, \r\n" + 
				"            dniaveriastotales, dnitransportadora, dniplaca, dnietarealcedi, \r\n" + 
				"            dnirecibelogistica) VALUES (" + 
				(dnicodigocargue == null ? "NULL" : "'" + dnicodigocargue + "'") +
				"," + (dnicompania == null ? "NULL" : "'" + dnicompania + "'") +
				"," + (dnifecha == null ? "now()" : "'" + dnifecha + "'") +
				"," + (dniimportacion == null ? "NULL" : "'" + dniimportacion + "'") +				
				"," + (dniproveedor == null ? "NULL" : "'" + dniproveedor + "'") +
				"," + (dniproducto == null ? "NULL" : "'" + dniproducto + "'") +
				"," + (dniumpestiba == null ? "0" : "'" + dniumpestiba + "'") +
				"," + (dnicantidad == null ? "0" : "'" + dnicantidad + "'") +
				"," + (dnilote == null ? "NULL" : "'" + dnilote + "'") +
				"," + (dnifechavencimiento == null ? "NULL" : "'" + dnifechavencimiento + "'") +				
				"," + (dnicantcontenedor == null ? "0" : "'" + dnicantcontenedor + "'") +
				"," + (dnitipocontenedor == null ? "NULL" : "'" + dnitipocontenedor + "'") +				
				"," + (dniumpesperadas == null ? "0" : "'" + dniumpesperadas + "'") +
				"," + (dniumprecibidas == null ? "0" : "'" + dniumprecibidas + "'") +
				"," + (dniaveriasrecibidas == null ? "0" : "'" + dniaveriasrecibidas + "'") +
				"," + (dniaveriasrecuperadas == null ? "0" : "'" + dniaveriasrecuperadas + "'") +				
				"," + (dniaveriastotales == null ? "0" : "'" + dniaveriastotales + "'") +
				"," + (dnitransportadora == null ? "NULL" : "'" + dnitransportadora + "'") +
				"," + (dniplaca == null ? "0" : "'" + dniplaca + "'") +
				"," + (dnietarealcedi == null ? "NULL" : "'" + dnietarealcedi + "'") +				
				"," + (dnirecibelogistica == null ? "0" : "'" + dnirecibelogistica + "'") +
				")";
		int resp = db.executeUpdate(insert);		
		return resp == 0 ? false : true;
	}
	

	public distnal_ingreso getdistnal_ingreso(String dnicodsx) {
		String cad = "SELECT * FROM distnal_ingreso WHERE dnicodsx = " + dnicodsx + " ORDER BY dnicodsx DESC LIMIT 1";
		return (distnal_ingreso) getEntidad(cad);
	}
	
	public Collection getlistadistnal_ingreso(String dnicodigocargue) {
		String cad = "SELECT * FROM distnal_ingreso WHERE dnicodigocargue = '"
				+ dnicodigocargue + "' ORDER BY 1";
		return getListaDeListas(cad);
	}
	
	public Collection getlistadistnal_ingreso(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param.toUpperCase();
		String cad = "SELECT * FROM distnal_ingreso  ORDER BY 1";
		return getLista(cad);
	}
	
	public int getTotalPaginasdistnal_ingreso(String param) {
		param = param == null ? "" : param.toUpperCase();
		String cad = "SELECT count(*) FROM distnal_ingreso";
		return getConteo(cad);
	}
	
	
	
	public boolean eliminardistnal_ingreso(String dnicodigocargue) throws SQLException {
		String elim = " delete from distnal_ingreso where dnicodigocargue=  '" + dnicodigocargue + "'";
		int r = db.executeUpdate(elim);
		if (r == 0)
			return false;
		return true;
	}
		
	
}
