package registro.control;

import java.sql.SQLException;
import java.util.Collection;

import db.GstTabla;
import db.beanConnector;
import registro.entity.registro_almacenamiento_detalle;
import registro.form.registro_almacenamiento_detalleForm;

public class gstregistro_almacenamiento_detalle extends GstTabla {

	public gstregistro_almacenamiento_detalle() {
		db = new beanConnector();
		classEntidad = registro_almacenamiento_detalle.class;
	}

	public gstregistro_almacenamiento_detalle(beanConnector db) {
		this.db = db;
		classEntidad = registro_almacenamiento_detalle.class;
	}

	public Collection getlistaregistro_almacenamiento_detalle() {
		String consulta = " SELECT * FROM registro_almacenamiento_detalle order by radecodsx desc ";
		return getLista(consulta);
	}

	public int crearregistro_almacenamiento_detalle(String raderegalm, String radecodentrada, String radecodreubicacion, String radeestibas) throws SQLException {
		String insert = "INSERT INTO registro_almacenamiento_detalle ( raderegalm, radecodentrada, radecodreubicacion, radeestibas, radetiempo) VALUES ("
				+ (raderegalm == null ? "NULL" : "'" + raderegalm + "'")
				+ ", " + (radecodentrada == null ? "NULL" : "'" + radecodentrada + "'")
				+ ", " + (radecodreubicacion == null ? "NULL" : "'" + radecodreubicacion + "'")
				+ ", " + (radeestibas == null ? "NULL" : "'" + radeestibas + "'")
				+ ", current_time"
				+ ") RETURNING radecodsx"; 
		return getConteo(insert);
	}

	public registro_almacenamiento_detalle getregistro_almacenamiento_detalle(String radecodsx) {
		String cad = "SELECT * FROM registro_almacenamiento_detalle WHERE radecodsx ='" + radecodsx + "'";
		return  (registro_almacenamiento_detalle) getEntidad(cad);
	}


	public boolean updateregistro_almacenamiento_detalle(registro_almacenamiento_detalle entity) throws SQLException {
		String cad = "update registro_almacenamiento_detalle set "		
/*					+ " realaccion = " + (entity.getRealaccion() == null ? "NULL" : "'" + entity.getRealaccion() + "'")
					+ ", realfecha = " + (entity.getRealfecha() == null ? "NULL" : "'" + (entity.getRealfecha()) + "'")
					+ ", realempleado = " + (entity.getRealempleado() == null ? "NULL" : "'" + (entity.getRealempleado()) + "'")
					+ ", realhoin = " + (entity.getRealhoin() == null ? "NULL" : "'" + (entity.getRealhoin()) + "'")
					+ ", realhofi = " + (entity.getRealhofi() == null ? "NULL" : "'" + (entity.getRealhofi()) + "'")
					+ ", realcantestibas = " + (entity.getRealcantestibas() == null ? "NULL" : "'" + (entity.getRealcantestibas()) + "'")
					+ ", realestado = " + (entity.getRealestado() == null ? "NULL" : "'" + (entity.getRealestado()) + "'")
*/					+ " where radecodsx = " + (entity.getRadecodsx() == null ? "NULL" : "'" + (entity.getRadecodsx()) + "'");
		int resp = db.executeUpdate(cad);
		return resp != 0;
	}

	public boolean updateregistro_almacenamiento_detalle(registro_almacenamiento_detalleForm entity) throws SQLException {
		String cad = "update registro_almacenamiento_detalle set "		
/*					+ " realaccion = " + (entity.getRealaccion() == null ? "NULL" : "'" + entity.getRealaccion() + "'")
					+ ", realfecha = " + (entity.getRealfecha() == null ? "NULL" : "'" + (entity.getRealfecha()) + "'")
					+ ", realempleado = " + (entity.getRealempleado() == null ? "NULL" : "'" + (entity.getRealempleado()) + "'")
					+ ", realhoin = " + (entity.getRealhoin() == null ? "NULL" : "'" + (entity.getRealhoin()) + "'")
					+ ", realhofi = " + (entity.getRealhofi() == null ? "NULL" : "'" + (entity.getRealhofi()) + "'")
					+ ", realcantestibas = " + (entity.getRealcantestibas() == null ? "NULL" : "'" + (entity.getRealcantestibas()) + "'")
					+ ", realestado = " + (entity.getRealestado() == null ? "NULL" : "'" + (entity.getRealestado()) + "'")
*/					+ " where radecodsx = " + (entity.getRadecodsx() == null ? "NULL" : "'" + (entity.getRadecodsx()) + "'");
		int resp = db.executeUpdate(cad);
		return resp != 0;
	}
	
	public boolean eliminar(String radecodsx) throws SQLException {
		String elim = "DELETE FROM registro_almacenamiento_detalle WHERE radecodsx = " + radecodsx;
		int r = db.executeUpdate(elim);
		return r != 0;
	}

}