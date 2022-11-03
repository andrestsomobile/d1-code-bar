package distrinal.control;

import java.sql.SQLException;
import java.util.Collection;

import db.GstTabla;
import db.beanConnector;
import distrinal.entity.distnal_despacho;

public class gstdistnal_despacho extends GstTabla implements java.io.Serializable {
	

	public gstdistnal_despacho() {
		db = new beanConnector();
		this.classEntidad = distnal_despacho.class;
	}

	public gstdistnal_despacho(beanConnector db) {
		this.db = db;
		this.classEntidad = distnal_despacho.class;
	}

	
	public boolean creardistnal_despacho(String dndcodigocargue, String dndcompania, String dndpedido, String dndpetra, String dndfechavencimiento, String dndsucursal, String dnddireccion, String dndproducto, String dndcantidad, String dndvalorunit, String dndvalorfactunit,
			String dndtransportadora, String dndplaca, String dndtipoveh, String dhdcostoflete, String dndjustflete, String dndfechaflete, String dndfechaalistamiento, String dndfechadespacho, String dndfechaentrega) throws SQLException {
		String insert = "INSERT INTO distnal_despacho (dndcodigocargue, dndcompania, dndpedido, dndpetra, \r\n" + 
				"            dndfechavencimiento, dndsucursal, dnddireccion, dndproducto, \r\n" + 
				"            dndcantidad, dndvalorunit, dndvalorfactunit, dndtransportadora, \r\n" + 
				"            dndplaca, dndtipoveh, dhdcostoflete, dndjustflete, dndfechaflete, \r\n" + 
				"            dndfechaalistamiento, dndfechadespacho, dndfechaentrega) VALUES (" + 

				(dndcodigocargue == null ? "NULL" : "'" + dndcodigocargue + "'") +
				"," + (dndcompania == null ? "NULL" : "'" + dndcompania + "'") +
				"," + (dndpedido == null ? "now()" : "'" + dndpedido + "'") +
				"," + (dndpetra == null ? "NULL" : "'" + dndpetra + "'") +				
				"," + (dndfechavencimiento == null ? "NULL" : "'" + dndfechavencimiento + "'") +
				"," + (dndsucursal == null ? "NULL" : "'" + dndsucursal + "'") +
				"," + (dnddireccion == null ? "NULL" : "'" + dnddireccion + "'") +
				"," + (dndproducto == null ? "NULL" : "'" + dndproducto + "'") +
				"," + (dndcantidad == null ? "0" : "'" + dndcantidad + "'") +				
				"," + (dndvalorunit == null ? "0" : "'" + dndvalorunit + "'") +
				"," + (dndvalorfactunit == null ? "0" : "'" + dndvalorfactunit + "'") +				
				"," + (dndtransportadora == null ? "NULL" : "'" + dndtransportadora + "'") +
				"," + (dndplaca == null ? "NULL" : "'" + dndplaca + "'") +
				"," + (dndtipoveh == null ? "NULL" : "'" + dndtipoveh + "'") +
				"," + (dhdcostoflete == null ? "0" : "'" + dhdcostoflete + "'") +				
				"," + (dndjustflete == null ? "NULL" : "'" + dndjustflete + "'") +
				"," + (dndfechaflete == null ? "NULL" : "'" + dndfechaflete + "'") +
				"," + (dndfechaalistamiento == null ? "NULL" : "'" + dndfechaalistamiento + "'") +				
				"," + (dndfechadespacho == null ? "0" : "'" + dndfechadespacho + "'") +
				"," + (dndfechaentrega == null ? "0" : "'" + dndfechaentrega + "'") +
				")";
		int resp = db.executeUpdate(insert);		
		return resp == 0 ? false : true;
	}
	

	public distnal_despacho getdistnal_despacho(String dndcodsx) {
		String cad = "SELECT * FROM distnal_despacho WHERE dndcodsx = " + dndcodsx + " ORDER BY dndcodsx DESC LIMIT 1";
		return (distnal_despacho) getEntidad(cad);
	}
	
	public Collection getlistadistnal_despacho(String dndcodigocargue) {
		String cad = "SELECT * FROM distnal_despacho WHERE dndcodigocargue = '"
				+ dndcodigocargue + "' ORDER BY 1";
		return getListaDeListas(cad);
	}
	
	public Collection getlistadistnal_despacho(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param.toUpperCase();
		String cad = "SELECT * FROM distnal_despacho  ORDER BY 1";
		return getLista(cad);
	}
	
	public int getTotalPaginasdistnal_despacho(String param) {
		param = param == null ? "" : param.toUpperCase();
		String cad = "SELECT count(*) FROM distnal_despacho";
		return getConteo(cad);
	}
	
	
	
	public boolean eliminardistnal_despacho(String dndcodigocargue) throws SQLException {
		String elim = " delete from distnal_despacho where dndcodigocargue=  '" + dndcodigocargue + "'";
		int r = db.executeUpdate(elim);
		if (r == 0)
			return false;
		return true;
	}
		
	
}
