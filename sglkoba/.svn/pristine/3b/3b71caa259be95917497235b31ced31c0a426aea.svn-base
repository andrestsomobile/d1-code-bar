package sap.control;

import java.sql.SQLException;
import java.util.Collection;

import org.apache.commons.lang.StringUtils;

import db.GstTabla;
import db.beanConnector;
import sap.entity.interface944;


public class gstinterface944 extends GstTabla {

	public gstinterface944() {
		db = new beanConnector();
		this.classEntidad = interface944.class;
	}

	public gstinterface944(beanConnector db) {
		this.db = db;
		this.classEntidad = interface944.class;
	}

	public Collection getlistainterface944() {
		String consulta = " SELECT * FROM interface944";
		return getLista(consulta);
	}
	
	public Collection getlistainterface944(String start, String param) {

		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		//String consulta = " SELECT * FROM interface944 where " + getTextoBusquedaResumen(param) + " order by intcodsx desc " + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		String consulta = " SELECT * FROM interface944 order by intcodsx desc " + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistainterface944(String param) {
		param = param == null ? "" : param;
		//String consulta = " SELECT count(1) FROM interface944 where  " + getTextoBusquedaResumen(param);
		String consulta = " SELECT count(1) FROM interface944";
		return getPaginas(consulta);

	}

//	public Collection getlistainterface944(String trafcompania, String start, String param) {
//
//		start = start == null ? "0" : start;
//		param = param == null ? "" : param;
//		String consulta = " SELECT * FROM interface944 where trafcompania = " + trafcompania + " AND " + getTextoBusquedaResumen(param) + " order by intcodsx desc " + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
//		return getLista(consulta);
//	}

//	public int getTotalPaginaslistainterface944(String trafcompania, String param) {
//		param = param == null ? "" : param;
//		String consulta = " SELECT count(1) FROM interface944 where trafcompania = " + trafcompania + " AND " + getTextoBusquedaResumen(param);
//		return getPaginas(consulta);
//
//	}

	
	
	public boolean crearinterface944(String usucodsx, String usulogin, String intfecha, String intfilecode,
			String intfilename, String trafcodsx, String intcontenidoarchivo) throws SQLException {
		String insert = "INSERT INTO interface944 (usucodsx, usulogin, intfecha, intfilecode, intfilename, trafcodsx, intcontenidoarchivo ) VALUES ("
				//+ (intcodsx == null ? "NULL" : "'" + intcodsx + "'")
				//+ ","
				+ (usucodsx == null ? "NULL" : "'" + usucodsx + "'")
				+ ","
				+ (usulogin == null ? "NULL" : "'" + usulogin + "'")
				+ ","
				+ (intfecha == null ? "NULL" : "'" + intfecha + "'")
				+ ","
				+ (intfilecode == null ? "NULL" : "'" + intfilecode + "'")
				+ ","
				+ (intfilename == null ? "NULL" : "'" + intfilename + "'")
				+ ","
				+ (trafcodsx == null ? "NULL" : "'" + trafcodsx + "'")
				+ ","
				+ (intcontenidoarchivo == null ? "NULL" : "'" + intcontenidoarchivo + "'")
				+ ")";
		int resp = db.executeUpdate(insert);
		return resp == 0 ? false : true;
	}

	public interface944 getinterface944(String intcodsx) {
		String cad = "SELECT * FROM interface944 WHERE intcodsx='" + intcodsx + "'";
		return (interface944) getEntidad(cad);
	}
	
	public interface944 getinterface944_by_intfilecode(String intfilecode) {
		String cad = "SELECT * FROM interface944 WHERE intfilecode='" + intfilecode + "'";
		return (interface944) getEntidad(cad);
	}

	public boolean updateinterface944(interface944 entity) throws SQLException {
		String cad = " update interface944 set  " 
				//+ " intcodsx = " 
				//+ (entity.getIntcodsx() == null ? "NULL" : "'" + entity.getIntcodsx() + "'") 
				//+ ","
				+ " usucodsx = " 
				+ (entity.getUsucodsx() == null ? "NULL" : "'" + entity.getUsucodsx() + "'") 
				+ ","
				+ " usulogin = " 
				+ (entity.getUsulogin() == null ? "NULL" : "'" + entity.getUsulogin() + "'") 
				+ ","
				+ " intfecha = " 
				+ (entity.getIntfecha() == null ? "NULL" : "'" + entity.getIntfecha() + "'") 
				+ ","
				+ " intfilecode = " 
				+ (entity.getIntfilecode() == null ? "NULL" : "'" + entity.getIntfilecode() + "'") 
				+ ","
				+ " intfilename = " 
				+ (entity.getIntfilename() == null ? "NULL" : "'" + entity.getIntfilename() + "'") 
				+ ","
				+ " trafcodsx = " 
				+ (entity.getTrafcodsx() == null ? "NULL" : "'" + entity.getTrafcodsx() + "'") 				
				+ " where intcodsx = " + entity.getIntcodsx();
		
		int resp = db.executeUpdate(cad);

		return resp == 0 ? false : true;
	}

	public boolean updateinterface944CifFob(interface944 entity) throws SQLException {
		String cad = " update interface944 set  " 
				+ " usucodsx = " 
				+ (entity.getUsucodsx() == null ? "NULL" : "'" + entity.getUsucodsx() + "'") 
				+ ","
				+ " usulogin = " 
				+ (entity.getUsulogin() == null ? "NULL" : "'" + entity.getUsulogin() + "'") 
				+ ","
				+ " intfecha = " 
				+ (entity.getIntfecha() == null ? "NULL" : "'" + entity.getIntfecha() + "'") 
				+ ","
				+ " intfilecode = " 
				+ (entity.getIntfilecode() == null ? "NULL" : "'" + entity.getIntfilecode() + "'") 
				+ ","
				+ " intfilename = " 
				+ (entity.getIntfilename() == null ? "NULL" : "'" + entity.getIntfilename() + "'") 
				+ ","
				+ " trafcodsx = " 
				+ (entity.getTrafcodsx() == null ? "NULL" : "'" + entity.getTrafcodsx() + "'") 
				+ " where intcodsx = " + entity.getIntcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	/*
	public boolean updateinterface944(interface944Form entity) throws SQLException {
		String cad = " update interface944 set  " + " trafcompania = " + (entity.gettrafcompania() == null ? "NULL" : "'" + entity.gettrafcompania() + "'") + "," + " traffechacreacion = " + (entity.gettraffechacreacion() == null ? "NULL" : "'" + entity.gettraffechacreacion() + "'") + ","
				+ " trafdocumento = " + (entity.gettrafdocumento() == null ? "NULL" : "'" + entity.gettrafdocumento() + "'") + "," + " trafembarque = " + (entity.gettrafembarque() == null ? "NULL" : "'" + entity.gettrafembarque() + "'") + "," + " traftransportadora = "
				+ (entity.gettraftransportadora() == null ? "NULL" : "'" + entity.gettraftransportadora() + "'") + "," + " trafprocedencia = " + (entity.gettrafprocedencia() == null ? "NULL" : "'" + entity.gettrafprocedencia() + "'") + "," + " traffechaarribopuerto = "
				+ (entity.gettraffechaarribopuerto() == null ? "NULL" : "'" + entity.gettraffechaarribopuerto() + "'") + "," + " traffechapresentdta = " + (entity.gettraffechapresentdta() == null ? "NULL" : "'" + entity.gettraffechapresentdta() + "'") + "," + " traffechaaprobaciondta = "
				+ (entity.gettraffechaaprobaciondta() == null ? "NULL" : "'" + entity.gettraffechaaprobaciondta() + "'") + "," + " traffob = " + (entity.gettraffob() == null ? "NULL" : "'" + entity.gettraffob() + "'") + "," + " trafcif = "
				+ (entity.gettrafcif() == null ? "NULL" : "'" + entity.gettrafcif() + "'") + "," + " trafconsec = " + (entity.gettrafconsec() == null ? "NULL" : "'" + entity.gettrafconsec() + "'") + "," + " trafnumerofmm = "
				+ (entity.gettrafnumerofmm() == null ? "NULL" : "'" + entity.gettrafnumerofmm() + "'") + "," + " traftrm = " + (entity.gettraftrm() == null ? "NULL" : "'" + entity.gettraftrm() + "'") + "," + " trafnumdta = "
				+ (entity.gettrafnumdta() == null ? "NULL" : "'" + entity.gettrafnumdta() + "'") + "," + " trafnumsobordo = " + (entity.gettrafnumsobordo() == null ? "NULL" : "'" + entity.gettrafnumsobordo() + "'") + "," + " traffechadescargue = "
				+ (entity.gettraffechadescargue() == null ? "NULL" : "'" + entity.gettraffechadescargue() + "'") + "," + " traffechalevante = " + (entity.gettraffechalevante() == null ? "NULL" : "'" + entity.gettraffechalevante() + "'") + "," + " traffechaingresozf = "
				+ (entity.gettraffechaingresozf() == null ? "NULL" : "'" + entity.gettraffechaingresozf() + "'") + "," + " trafentregadocusia = " + (entity.gettrafentregadocusia() == null ? "NULL" : "'" + entity.gettrafentregadocusia() + "'") + "," + " trafobservaciones = "
				+ (entity.gettrafobservaciones() == null ? "NULL" : "'" + entity.gettrafobservaciones() + "'") + "," + " trafpesobruto = " + (entity.gettrafpesobruto() == null ? "NULL" : "'" + entity.gettrafpesobruto() + "'") + "," + " trafusuario = "
				+ (entity.gettrafusuario() == null ? "NULL" : "'" + entity.gettrafusuario() + "'") + "," + " traffechasobordo = " + (entity.gettraffechasobordo() == null ? "NULL" : "'" + entity.gettraffechasobordo() + "'") + "," + " traforigen = "
				+ (entity.gettraforigen() == null ? "NULL" : "'" + entity.gettraforigen() + "'") + "," + " trafpesoneto = " + (entity.gettrafpesoneto() == null ? "NULL" : "'" + entity.gettrafpesoneto() + "'") + "," + " traffletesseguro = "
				+ (entity.gettraffletesseguro() == null ? "NULL" : "'" + entity.gettraffletesseguro() + "'") + "," + " trafestado = " + (entity.getTrafestado() == null ? "NULL" : "'" + entity.getTrafestado() + "'") + "," + " trafpedido = "
				+ (entity.getTrafpedido() == null ? "NULL" : "'" + entity.getTrafpedido() + "'") + "," + " trafmotonave = " + (entity.getTrafmotonave() == null ? "NULL" : "'" + entity.getTrafmotonave() + "'")
				+ " where intcodsx = " + entity.getintcodsx();
		int resp = db.executeUpdate(cad);

		return resp == 0 ? false : true;
	}*/

	public boolean eliminar(String intcodsx) throws SQLException {
		String elim = " delete from interface944 where intcodsx = '" + intcodsx + "'";
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}
	
	// Recupera el contenido del archivo original indicando el codigo del trafico  
	public String getContenidoArchivoByTrafcodsx(String trafcodsx) {
		String cad = "SELECT intcontenidoarchivo FROM interface944 WHERE trafcodsx='" + trafcodsx + "' ORDER BY intcodsx DESC LIMIT 1 ";
		String r   = getCampo(cad);
		return r;
	}
	
	// Recupera el contenido del archivo original indicando el codigo del trafico  
	public String getContenidoArchivoByIntcodsx(String intcodsx) {
		String cad = "SELECT intcontenidoarchivo FROM interface944 WHERE intcodsx='" + intcodsx + "' ORDER BY intcodsx DESC LIMIT 1 ";
		String r   = getCampo(cad);
		return r;
	}
	
	public String getSiguiente944outputfileID(){		
		String cad = "SELECT nextval('interfaces.interface944_outputfile_seq')";
		String r   = getCampo(cad);
		r = StringUtils.leftPad(r, 4, "0");
		return r;
	}

	
	
}
