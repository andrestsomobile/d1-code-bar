package patios.control;

import java.sql.SQLException;
import java.util.Collection;

import patios.entity.detallepedidovehiculo;
import patios.form.detallepedidovehiculoForm;
import db.GstTabla;
import db.beanConnector;

public class gstdetallepedidovehiculo extends GstTabla {

	public gstdetallepedidovehiculo() {
		db = new beanConnector();
		this.classEntidad = detallepedidovehiculo.class;
	}

	public gstdetallepedidovehiculo(beanConnector db) {
		this.db = db;
		this.classEntidad = detallepedidovehiculo.class;
	}

	public Collection getlistadetallepedidovehiculo() {
		String consulta = " SELECT * FROM detallepedidovehiculo";
		return getLista(consulta);
	}

	public Collection getlistadetallepedidovehiculo(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM detallepedidovehiculo where" + getTextoBusquedaResumen(param) + " order by evcodsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistadetallepedidovehiculo(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM detallepedidovehiculo where " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);
	}

	public int creardetallepedidovehiculo(String dpvcodpedido, String dpvcodvin) throws SQLException {
		String insert = "INSERT INTO detallepedidovehiculo (dpvcodsx, dpvcodpedido, dpvcodvin) VALUES (default," 
			+ (dpvcodpedido == null ? "NULL" : dpvcodpedido) + "," 
			+ (dpvcodvin == null ? "NULL" : dpvcodvin) + ") RETURNING dpvcodsx";
		return getConteo(insert);
	}

	public detallepedidovehiculo getdetallepedidovehiculo(String dpvcodsx) {
		String cad = "SELECT * FROM detallepedidovehiculo WHERE dpvcodsx = " + dpvcodsx;
		return (detallepedidovehiculo) getEntidad(cad);
	}
	
	public detallepedidovehiculo getdetallepedidovehiculo_vin(String dpvcodvin) {
		String cad = "SELECT * FROM detallepedidovehiculo WHERE dpvcodvin = " + dpvcodvin;
		return (detallepedidovehiculo) getEntidad(cad);
	}

	public boolean eliminar(String dpvcodsx) throws SQLException {
		String elim = " delete from detallepedidovehiculo where dpvcodsx = " + dpvcodsx;
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}

	public Collection getlistadetallepedidovehiculo(String dpvcodpedido) {
		String consulta = "SELECT * FROM detallepedidovehiculo WHERE dpvcodpedido = " + dpvcodpedido;
		return getLista(consulta);
	}
	
	public int getTotalPaginaslistadetallepedidovehiculo(String dpvcodpedido, String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM detallepedidovehiculo where dpvcodpedido = " + dpvcodpedido;
		return getPaginas(consulta);
	}
}
