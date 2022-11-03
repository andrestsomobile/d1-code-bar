package patios.control;

import java.sql.SQLException;
import java.util.Collection;
import patios.entity.entradavehiculo;
import patios.form.entradavehiculoForm;
import db.GstTabla;
import db.beanConnector;

public class gstentradavehiculo extends GstTabla {

	public gstentradavehiculo() {
		db = new beanConnector();
		this.classEntidad = entradavehiculo.class;
	}

	public gstentradavehiculo(beanConnector db) {
		this.db = db;
		this.classEntidad = entradavehiculo.class;
	}

	public Collection getlistaentradavehiculo() {
		String consulta = " SELECT * FROM entradavehiculo";
		return getLista(consulta);
	}

	public Collection getlistaentradavehiculo(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM entradavehiculo where" + getTextoBusquedaResumen(param) + " order by evcodsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistaentradavehiculo(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM entradavehiculo where " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);
	}

	public int crearentradavehiculo(String evcodcia, String evfecha, String evdocumento, String evestado) throws SQLException {
		String insert = "INSERT INTO entradavehiculo (evcodsx, evcodcia, evfecha, evdocumento, evestado) VALUES (default," + (evcodcia == null ? "NULL" : evcodcia) + "," + (evfecha == null ? "NULL" : "'" + evfecha + "'") + "," + (evdocumento == null ? "NULL" : "'" + evdocumento + "'") + ","
				+ (evestado == null ? "NULL" : "'" + evestado + "'") + ") RETURNING evcodsx";
		return getConteo(insert);
	}

	public entradavehiculo getentradavehiculo(String evcodsx) {
		String cad = "SELECT * FROM entradavehiculo WHERE evcodsx = " + evcodsx;
		return (entradavehiculo) getEntidad(cad);
	}
	
	public entradavehiculo getentradavehiculo_BL(String bl) {
		String cad = "SELECT * FROM entradavehiculo WHERE evdocumento = '" + bl + "' order by 1 desc limit 1";
		return (entradavehiculo) getEntidad(cad);
	}
	

	public boolean updateentradavehiculo(entradavehiculo entity) throws SQLException {
		String cad = " update entradavehiculo set evcodcia = " + (entity.getEvcodcia() == null ? "NULL" : entity.getEvcodcia()) + "," 
				+ "evfecha = " + (entity.getEvfecha() == null ? "NULL" : "'" + entity.getEvfecha() + "'") + "," 
				+ "evdocumento = " + (entity.getEvdocumento() == null ? "NULL" : "'" + entity.getEvdocumento() + "'") + ","
				+ "evestado = " + (entity.getEvestado() == null ? "NULL" : "'" + entity.getEvestado() + "'") 
				+ " where evcodsx = " + entity.getEvcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean updateentradavehiculo(entradavehiculoForm entity) throws SQLException {
		String cad = " update entradavehiculo set evcodcia = " + (entity.getEvcodcia() == null ? "NULL" : entity.getEvcodcia()) + "," 
		+ "evfecha = " + (entity.getEvfecha() == null ? "NULL" : "'" + entity.getEvfecha() + "'") + "," 
		+ "evdocumento = " + (entity.getEvdocumento() == null ? "NULL" : "'" + entity.getEvdocumento() + "'") + ","
		+ "evestado = " + (entity.getEvestado() == null ? "NULL" : "'" + entity.getEvestado() + "'") 
		+ " where evcodsx = " + entity.getEvcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean eliminar(String evcodsx) throws SQLException {
		String elim = " delete from entradavehiculo where evcodsx = " + evcodsx;
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}

	public int getTotalUnidades(String evcodsx) {
		String cad = "SELECT count(1) FROM detalleentradavehiculo WHERE devcodentrada = " + evcodsx;
		return getConteo(cad);
	}
}
