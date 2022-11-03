package registro.control;

import java.sql.SQLException;
import java.util.Collection;

import db.GstTabla;
import db.beanConnector;
import registro.entity.registro_almacenamiento;
import registro.form.registro_almacenamientoForm;

public class gstregistro_almacenamiento extends GstTabla {

	public gstregistro_almacenamiento() {
		db = new beanConnector();
		classEntidad = registro_almacenamiento.class;
	}

	public gstregistro_almacenamiento(beanConnector db) {
		this.db = db;
		classEntidad = registro_almacenamiento.class;
	}

	public Collection getlistaregistro_almacenamiento() {
		String consulta = " SELECT * FROM registro_almacenamiento order by realcodsx desc ";
		return getLista(consulta);
	}

	

	public Collection getlistaregistro_almacenamiento_pendientes(String empleado) {
		String consulta = " SELECT * FROM registro_almacenamiento where realempleado = " + empleado + " and realestado = 'TRAMITE' order by realcodsx asc ";
		return getLista(consulta);
	}

	public int crearregistro_almacenamiento(String realaccion, String realempleado) throws SQLException {
		String insert = "INSERT INTO registro_almacenamiento (realaccion, realfecha, realempleado, realhoin, realestado) VALUES ("
				+ (realaccion == null ? "NULL" : "'" + realaccion + "'")
				+ ", current_date" 
				+ ", " + (realempleado == null ? "NULL" : "'" + realempleado + "'")
				+ ", current_time"
				+ ", 'TRAMITE'"
				+ ") RETURNING realcodsx"; 
		return getConteo(insert);
	}

	public registro_almacenamiento getregistro_almacenamiento(String realcodsx) {
		String cad = "SELECT * FROM registro_almacenamiento WHERE realcodsx ='" + realcodsx + "'";
		return  (registro_almacenamiento) getEntidad(cad);
	}


	public boolean updateregistro_almacenamiento(registro_almacenamiento entity) throws SQLException {
		String cad = "update registro_almacenamiento set "		
					+ " realaccion = " + (entity.getRealaccion() == null ? "NULL" : "'" + entity.getRealaccion() + "'")
					+ ", realfecha = " + (entity.getRealfecha() == null ? "NULL" : "'" + (entity.getRealfecha()) + "'")
					+ ", realempleado = " + (entity.getRealempleado() == null ? "NULL" : "'" + (entity.getRealempleado()) + "'")
					+ ", realhoin = " + (entity.getRealhoin() == null ? "NULL" : "'" + (entity.getRealhoin()) + "'")
					+ ", realhofi = " + (entity.getRealhofi() == null ? "NULL" : "'" + (entity.getRealhofi()) + "'")
					+ ", realcantestibas = " + (entity.getRealcantestibas() == null ? "NULL" : "'" + (entity.getRealcantestibas()) + "'")
					+ ", realestado = " + (entity.getRealestado() == null ? "NULL" : "'" + (entity.getRealestado()) + "'")
					+ " where realcodsx = " + (entity.getRealcodsx() == null ? "NULL" : "'" + (entity.getRealcodsx()) + "'");
		int resp = db.executeUpdate(cad);
		return resp != 0;
	}

	public boolean updateregistro_almacenamiento(registro_almacenamientoForm entity) throws SQLException {
		String cad = "update registro_almacenamiento set "		
					+ " realaccion = " + (entity.getRealaccion() == null ? "NULL" : "'" + entity.getRealaccion() + "'")
					+ ", realfecha = " + (entity.getRealfecha() == null ? "NULL" : "'" + (entity.getRealfecha()) + "'")
					+ ", realempleado = " + (entity.getRealempleado() == null ? "NULL" : "'" + (entity.getRealempleado()) + "'")
					+ ", realhoin = " + (entity.getRealhoin() == null ? "NULL" : "'" + (entity.getRealhoin()) + "'")
					+ ", realhofi = " + (entity.getRealhofi() == null ? "NULL" : "'" + (entity.getRealhofi()) + "'")
					+ ", realcantestibas = " + (entity.getRealcantestibas() == null ? "NULL" : "'" + (entity.getRealcantestibas()) + "'")
					+ ", realestado = " + (entity.getRealestado() == null ? "NULL" : "'" + (entity.getRealestado()) + "'")
					+ " where realcodsx = " + (entity.getRealcodsx() == null ? "NULL" : "'" + (entity.getRealcodsx()) + "'");
		int resp = db.executeUpdate(cad);
		return resp != 0;
	}
	
	public boolean eliminar(String realcodsx) throws SQLException {
		String elim = "DELETE FROM registro_almacenamiento WHERE realcodsx = " + realcodsx;
		int r = db.executeUpdate(elim);
		return r != 0;
	}
	
	public boolean cerrarregistro_almacenamiento(String realcodsx) throws SQLException {
		String cad = "update registro_almacenamiento set "		
					+ "  realhofi = current_time"
					+ ", realcantestibas = 1" 
					+ ", realestado = 'FINALIZADO'" 
					+ " where realcodsx = " + realcodsx;
		int resp = db.executeUpdate(cad);
		return resp != 0;
	}

}
