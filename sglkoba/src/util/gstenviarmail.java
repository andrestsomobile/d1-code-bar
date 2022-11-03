package util;

import java.sql.SQLException;
import java.util.Collection;

import db.GstTabla;
import db.beanConnector;

public class gstenviarmail extends GstTabla {

	public gstenviarmail() {
		this.db = new beanConnector();
	}

	public Collection getlistaPendientes() {
		String consulta = "select emcodsx, emcorreo, emasunto, emmensaje from enviarmail where emenviado = 'N' order by 1";
		return getListaDeListas(consulta);
	}

	public boolean setEnviado(String emcodsx) throws SQLException {
		String consulta = "UPDATE enviarmail SET emenviado='S' WHERE emcodsx = " + emcodsx;
		return db.executeUpdate(consulta) == 0 ? false : true;
	}

	public boolean crea(String emcorreo, String emasunto, String emmensaje) throws SQLException {
		String cad = "INSERT INTO enviarmail(emcorreo, emasunto, emmensaje) VALUES (" + (emcorreo == null ? "NULL" : "'" + emcorreo + "'") + "," + (emasunto == null ? "NULL" : "'" + emasunto + "'") + "," + (emmensaje == null ? "NULL" : "'" + emmensaje + "'") + ")";
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}
}
