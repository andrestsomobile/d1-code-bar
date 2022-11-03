package patios.control;

import java.sql.SQLException;
import java.util.Collection;

import patios.entity.despachovehiculo;
import patios.form.despachovehiculoForm;
import db.GstTabla;
import db.beanConnector;

public class gstdespachovehiculo extends GstTabla {

	public gstdespachovehiculo() {
		db = new beanConnector();
		this.classEntidad = despachovehiculo.class;
	}

	public gstdespachovehiculo(beanConnector db) {
		this.db = db;
		this.classEntidad = despachovehiculo.class;
	}

	public Collection getlistadespachovehiculo() {
		String consulta = " SELECT * FROM despachovehiculo";
		return getLista(consulta);
	}

	public Collection getlistadespachovehiculo(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM despachovehiculo where" + getTextoBusquedaResumen(param) + " order by dvcodsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistadespachovehiculo(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM despachovehiculo where  " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);
	}

	public int creardespachovehiculo(String dvfecha, String dvcodpedido, String dvcodtransportadora, String dvestado, String dvnotificacion) throws SQLException {
		String insert = "INSERT INTO despachovehiculo (dvcodsx, dvfecha, dvcodpedido, dvcodtransportadora, dvestado, dvnotificacion) VALUES (default," 
			+ (dvfecha == null ? "NULL" : "'" + dvfecha + "'") + "," 
			+ (dvcodpedido == null ? "NULL" : "'" + dvcodpedido + "'" ) + ","
			+ (dvcodtransportadora == null ? "NULL" : "'" + dvcodtransportadora + "'" ) + "," 
			+ (dvestado == null ? "NULL" : "'" + dvestado + "'") + "," 
			+ (dvnotificacion == null ? "NULL" : "'" + dvnotificacion + "'" ) + ") RETURNING dvcodsx";
		return getConteo(insert);
	}

	public despachovehiculo getdespachovehiculo(String dvcodsx) {
		String cad = "SELECT * FROM despachovehiculo WHERE dvcodsx='" + dvcodsx + "'";
		return (despachovehiculo) getEntidad(cad);
	}

	public boolean updatedespachovehiculo(despachovehiculo entity) throws SQLException {
		String cad = " update despachovehiculo set  " 
			+ " dvfecha = " + (entity.getDvfecha() == null ? "NULL" : "'" + entity.getDvfecha() + "'") + "," 
			+ " dvcodpedido = " + (entity.getDvcodpedido() == null ? "NULL" : "'" + entity.getDvcodpedido() + "'") + ","
			+ " dvcodtransportadora = " + (entity.getDvcodtransportadora() == null ? "NULL" : "'" + entity.getDvcodtransportadora() + "'") + "," 
			+ " dvestado = " + (entity.getDvestado() == null ? "NULL" : "'" + entity.getDvestado() + "'") + "," 
			+ " dvnotificacion = " + (entity.getDvnotificacion() == null ? "NULL" : "'" + entity.getDvnotificacion() + "'") 
			+ " where pvcodsx = " + entity.getDvcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean updatedespachovehiculo(despachovehiculoForm entity) throws SQLException {
		String cad = " update despachovehiculo set  " 
			+ " dvfecha = " + (entity.getDvfecha() == null ? "NULL" : "'" + entity.getDvfecha() + "'") + "," 
			+ " dvcodpedido = " + (entity.getDvcodpedido() == null ? "NULL" : "'" + entity.getDvcodpedido() + "'") + ","
			+ " dvcodtransportadora = " + (entity.getDvcodtransportadora() == null ? "NULL" : "'" + entity.getDvcodtransportadora() + "'") + "," 
			+ " dvestado = " + (entity.getDvestado() == null ? "NULL" : "'" + entity.getDvestado() + "'") + "," 
			+ " dvnotificacion = " + (entity.getDvnotificacion() == null ? "NULL" : "'" + entity.getDvnotificacion() + "'") 
			+ " where pvcodsx = " + entity.getDvcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean eliminar(String dvcodsx) throws SQLException {
		String elim = " delete from despachovehiculo where dvcodsx = '" + dvcodsx + "'";
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}
	
	public boolean finalizar(String dvcodsx) throws SQLException {
		String elim = " update detalledespachovehiculo set  where dvcodsx = '" + dvcodsx + "'";
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}
	
	public int getTotalUnidades(String dvcodsx) {
		String cad = "SELECT count(1) FROM detalledespachovehiculo WHERE ddvcoddespacho = " + dvcodsx;
		return getConteo(cad);
	}
}
