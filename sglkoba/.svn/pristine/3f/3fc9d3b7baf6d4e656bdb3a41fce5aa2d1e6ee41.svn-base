package ingreso.control;

import java.sql.SQLException;
import java.util.Collection;

import db.GstTabla;
import db.beanConnector;
import ingreso.entity.entrada_locacion;
import ingreso.form.entrada_locacionForm;

public class gstentrada_locacion extends GstTabla {

	public gstentrada_locacion() {
		db = new beanConnector();
		this.classEntidad = entrada_locacion.class;
	}

	public gstentrada_locacion(beanConnector db) {
		this.db = db;
		this.classEntidad = entrada_locacion.class;
	}
	
	public Collection getlistaentrada_locacion(String start, String param) {

		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM entrada_locacion where " + getTextoBusquedaResumen(param) + " order by elcodsx desc " + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistaentrada_locacion(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM entrada_locacion where  " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);

	}
	
	public entrada_locacion getentrada_locacion(String elcodsx) {
		String consulta = "SELECT * FROM entrada_locacion WHERE elcodsx = " + elcodsx;
		return (entrada_locacion) getEntidad(consulta);
	}
	
	public entrada_locacion getentrada_locacion_last(String elcodsx) {
		String consulta = "SELECT * FROM entrada_locacion order by 1 desc limit 1";
		return (entrada_locacion) getEntidad(consulta);
	}
	
	public boolean crearentrada_locacion(String elcodentrada, String elcodlocacionorigen, String elcodlocaciondestino, String elcantidadnac, String elsaldonac, String elcantidadsnac, String elsaldosnac, String elfecha, String elpersona) throws SQLException {
		String insert = "INSERT INTO entrada_locacion ( elcodentrada, elcodlocacionorigen, elcodlocaciondestino, " + 
				"            elcantidadnac, elsaldonac, elcantidadsnac, elsaldosnac, elfecha, " + 
				"            elpersona, resumen) VALUES ("
				+ (elcodentrada == null ? "NULL" : "'" + elcodentrada + "'")
				+ ","
				+ (elcodlocacionorigen == null ? "NULL" : "'" + elcodlocacionorigen + "'")
				+ ","
				+ (elcodlocaciondestino == null ? "NULL" : "'" + elcodlocaciondestino + "'")
				+ ","
				+ (elcantidadnac == null ? "NULL" : "'" + elcantidadnac + "'")
				+ ","
				+ (elsaldonac == null ? "NULL" : "'" + elsaldonac + "'")
				+ ","
				+ (elcantidadsnac == null ? "NULL" : "'" + elcantidadsnac + "'")
				+ ","
				+ (elsaldosnac == null ? "NULL" : "'" + elsaldosnac + "'")
				+ ","
				+ (elfecha == null ? "NULL" : "'" + elfecha + "'")
				+ ","
				+ (elpersona == null ? "NULL" : "'" + elpersona + "'")
				+ ","
				+ (elpersona == null ? "NULL" : "' '")
				+ ")";
				
		int resp = db.executeUpdate(insert);
		return resp ==0 ? false : true;

	}

	public boolean updateentrada_locacion( entrada_locacionForm entity ) throws SQLException { 
		String cad = " update entrada_locacion set  " 
				 + " elcodlocacionorigen = " + ( entity.getElcodlocacionorigen() == null ? "NULL": "'" + entity.getElcodlocacionorigen() + "'" ) 
				 + "," + " elcodlocaciondestino = " +( entity.getElcodlocaciondestino() == null ? "NULL": "'" + entity.getElcodlocaciondestino() + "'" ) 
				 + " where elcodsx = " +  entity.getElcodsx() ; 
		int resp= db.executeUpdate(cad);
		return resp ==0 ? false : true ;    
	} 
	
	public boolean updateentrada_locacion( entrada_locacion entity ) throws SQLException { 
		String cad = " update entrada_locacion set  " 
				 + " elcodlocacionorigen = " + ( entity.getElcodlocacionorigen() == null ? "NULL": "'" + entity.getElcodlocacionorigen() + "'" ) 
				 + "," + " elcodlocaciondestino = " +( entity.getElcodlocaciondestino() == null ? "NULL": "'" + entity.getElcodlocaciondestino() + "'" ) 
				 + " where elcodsx = " +  entity.getElcodsx() ; 
		int resp= db.executeUpdate(cad);
		return resp ==0 ? false : true ;    
	} 
	
	public boolean eliminar(String elcodsx) throws SQLException {  
		 String elim = " delete from entrada_locacion where elcodsx = '"+ elcodsx + "'";
		 int r = db.executeUpdate(elim) ;
		 return  r==0? false : true ; 
	}
}