package patios.control;

import java.sql.SQLException;
import java.util.Collection;
import patios.entity.nacionalizacionvehiculo;
import patios.form.nacionalizacionvehiculoForm;
import db.GstTabla;
import db.beanConnector;

public class gstnacionalizacionvehiculo extends GstTabla {

	public gstnacionalizacionvehiculo() {
		db = new beanConnector();
		this.classEntidad = nacionalizacionvehiculo.class;
	}

	public gstnacionalizacionvehiculo(beanConnector db) {
		this.db = db;
		this.classEntidad = nacionalizacionvehiculo.class;
	}

	public Collection getlistanacionalizacionvehiculo() {
		String consulta = " SELECT * FROM nacionalizacionvehiculo";
		return getLista(consulta);
	}

	public Collection getlistanacionalizacionvehiculo(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM nacionalizacionvehiculo where" + getTextoBusquedaResumen(param) + " order by nvcodsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistanacionalizacionvehiculo(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM nacionalizacionvehiculo where " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);
	}

	public int crearnacionalizacionvehiculo(String nvfmm, String nvfecha, String nvcodvin) throws SQLException {
		String insert = "INSERT INTO nacionalizacionvehiculo (nvcodsx, nvfmm, nvfecha, nvcodvin) VALUES (default," + (nvfmm == null ? "NULL" : nvfmm) + "," 
		+ (nvfecha == null ? "NULL" : "'" + nvfecha + "'") + "," 
		+ (nvcodvin == null ? "NULL" : nvcodvin )  + ") RETURNING nvcodsx";
		return getConteo(insert);
	}

	public nacionalizacionvehiculo getnacionalizacionvehiculo(String nvcodsx) {
		String cad = "SELECT * FROM nacionalizacionvehiculo WHERE nvcodsx = " + nvcodsx;
		return (nacionalizacionvehiculo) getEntidad(cad);
	}
	
	public nacionalizacionvehiculo getnacionalizacionvehiculo_vin(String nvcodvin) {
		String cad = "SELECT * FROM nacionalizacionvehiculo WHERE nvcodvin = " + nvcodvin;
		return (nacionalizacionvehiculo) getEntidad(cad);
	}
	
	public boolean updatenacionalizacionvehiculo(nacionalizacionvehiculo entity) throws SQLException {
		String cad = " update nacionalizacionvehiculo set nvfmm = " + (entity.getNvfmm() == null ? "NULL" : entity.getNvfmm()) + "," 
				+ "nvfecha = " + (entity.getNvfecha() == null ? "NULL" : "'" + entity.getNvfecha() + "'") + "," 
				+ "nvcodvin = " + (entity.getNvcodvin() == null ? "NULL" : entity.getNvcodvin())
				+ " where nvcodsx = " + entity.getNvcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean updatenacionalizacionvehiculo(nacionalizacionvehiculoForm entity) throws SQLException {
		String cad = " update nacionalizacionvehiculo set nvfmm = " + (entity.getNvfmm() == null ? "NULL" : entity.getNvfmm()) + "," 
		+ "nvfecha = " + (entity.getNvfecha() == null ? "NULL" : "'" + entity.getNvfecha() + "'") + "," 
		+ "nvcodvin = " + (entity.getNvcodvin() == null ? "NULL" : entity.getNvcodvin())
		+ " where nvcodsx = " + entity.getNvcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean eliminar(String nvcodsx) throws SQLException {
		String elim = " delete from nacionalizacionvehiculo where nvcodsx = " + nvcodsx;
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}
}
