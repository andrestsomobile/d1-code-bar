package patios.control;

import java.sql.SQLException;
import java.util.Collection;

import patios.entity.detalledespachovehiculo;
import db.GstTabla;
import db.beanConnector;

public class gstdetalledespachovehiculo extends GstTabla {

	public gstdetalledespachovehiculo() {
		db = new beanConnector();
		this.classEntidad = detalledespachovehiculo.class;
	}

	public gstdetalledespachovehiculo(beanConnector db) {
		this.db = db;
		this.classEntidad = detalledespachovehiculo.class;
	}

	public Collection getlistadetalledespachovehiculo() {
		String consulta = " SELECT * FROM detalledespachovehiculo";
		return getLista(consulta);
	}

	public Collection getlistadetalledespachovehiculo(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM detalledespachovehiculo where" + getTextoBusquedaResumen(param) + " order by evcodsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistadetalledespachovehiculo(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM detalledespachovehiculo where " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);
	}

	 
	public int creardetalledespachovehiculo(String ddvcoddespacho, String ddvcoddetpedido) throws SQLException {
		String insert = "INSERT INTO detalledespachovehiculo (ddvcodsx, ddvcoddespacho, ddvcoddetpedido) VALUES (default," 
			+ (ddvcoddespacho == null ? "NULL" : ddvcoddespacho) + "," 
			+ (ddvcoddetpedido == null ? "NULL" : ddvcoddetpedido) + ") RETURNING ddvcodsx";
		return getConteo(insert);
	}

	public detalledespachovehiculo getdetalledespachovehiculo(String ddvcodsx) {
		String cad = "SELECT * FROM detalledespachovehiculo WHERE ddvcodsx = " + ddvcodsx;
		return (detalledespachovehiculo) getEntidad(cad);
	}

	public boolean eliminar(String ddvcodsx) throws SQLException {
		String elim = " delete from detalledespachovehiculo where ddvcodsx = " + ddvcodsx;
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}

	public Collection getlistadetalledespachovehiculo(String ddvcoddespacho) {
		String consulta = "SELECT * FROM detalledespachovehiculo WHERE ddvcoddespacho = " + ddvcoddespacho;
		return getLista(consulta);
	}
	
	public int getTotalPaginaslistadetalledespachovehiculo(String ddvcoddespacho, String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM detalledespachovehiculo where ddvcoddespacho = " + ddvcoddespacho;
		return getPaginas(consulta);
	}
}
