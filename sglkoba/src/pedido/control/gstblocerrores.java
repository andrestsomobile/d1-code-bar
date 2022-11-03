package pedido.control;

import java.sql.SQLException;
import java.util.Collection;

import pedido.entity.pedido;
import pedido.form.pedidoForm;
import db.GstTabla;
import db.beanConnector;

public class gstblocerrores extends GstTabla {
	
	public gstblocerrores() {
		db = new beanConnector();
		this.classEntidad = pedido.class;
	}
	public gstblocerrores(beanConnector db) {
		this.db = db;
		this.classEntidad = pedido.class;
	}
	public Collection getlistablocerrores() {

		String consulta = " SELECT * FROM blocerrores";
		return getLista(consulta);
	}
	public Collection getlistablocerrores(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM blocerrores where " + getTextoBusquedaResumen(param) + " order by pedcodsx desc " + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistapedido(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM blocerrores where  " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);

	}

	public boolean crearblocerrores(String bloc_fecha, String bloc_cant_reg, String bloc_datos_erroneos, String bloc_estado) throws SQLException {
		String insert = "INSERT INTO blocerrores (bloc_fecha,bloc_cant_reg,bloc_datos_erroneos,bloc_estado) VALUES ("
				+ (bloc_fecha == null ? "NULL" : "'" + bloc_fecha + "'")
				+ ","
				+ (bloc_cant_reg == null ? "NULL" : "'" + bloc_cant_reg + "'")
				+ ","
				+ (bloc_datos_erroneos == null ? "NULL" : "'" + bloc_datos_erroneos + "'")
				+ ","
				+ (bloc_estado == null ? "NULL" : "'" + bloc_estado + "'")+ ")";
		int resp = db.executeUpdate(insert);
		return resp == 0 ? false : true;
	}
	public pedido getblocerrores(String idblocerrores) {
		String cad = "SELECT * FROM blocerrores WHERE idblocerrores='" + idblocerrores + "'";
		return (pedido) getEntidad(cad);
	}
	

	public boolean eliminar(String idblocerrores) throws SQLException {
		String elim = " delete from blocerrores where idblocerrores = '" + idblocerrores + "'";
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}

}
