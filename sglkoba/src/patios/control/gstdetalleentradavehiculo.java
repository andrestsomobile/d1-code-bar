package patios.control;

import java.sql.SQLException;
import java.util.Collection;
import java.util.StringTokenizer;

import patios.entity.detalleentradavehiculo;
import patios.form.detalleentradavehiculoForm;
import db.GstTabla;
import db.beanConnector;

public class gstdetalleentradavehiculo extends GstTabla {

	public gstdetalleentradavehiculo() {
		db = new beanConnector();
		this.classEntidad = detalleentradavehiculo.class;
	}

	public gstdetalleentradavehiculo(beanConnector db) {
		this.db = db;
		this.classEntidad = detalleentradavehiculo.class;
	}

	public Collection getlistadetalleentradavehiculo() {
		String consulta = " SELECT * FROM detalleentradavehiculo";
		return getLista(consulta);
	}

	public Collection getlistadetalleentradavehiculo(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM detalleentradavehiculo where" + getTextoBusquedaResumen(param) + " order by devcodsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistadetalleentradavehiculo(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM detalleentradavehiculo where " + getTextoBusquedaResumen(param);
		return getPaginas(consulta);
	}

	public int creardetalleentradavehiculo(String devcodentrada, String devreferencia, String devmarca, String devmodelo, String devmotor, 
			String devvinchasis, String devlocacion, String devcolor, String devestado, String devfechaingreso, String devfechasalida, String devfechaalistamiento, String devnovedades) throws SQLException {
		String insert = "INSERT INTO detalleentradavehiculo (devcodsx, devcodentrada, devreferencia, devmarca, devmodelo, devmotor, devvinchasis, devlocacion, devcolor, devestado, devfechaingreso, devfechasalida, devfechaalistamiento, devnovedades) VALUES (default," 
			+ (devcodentrada == null ? "NULL" : devcodentrada) + "," 
			+ (devreferencia == null ? "NULL" : "'" + devreferencia + "'") + "," 
			+ (devmarca == null ? "NULL" : "'" + devmarca + "'") + ","
			+ (devmodelo == null ? "NULL" : "'"+ devmodelo + "'") + "," 
			+ (devmotor == null ? "NULL" : "'" + devmotor + "'") + "," 
			+ (devvinchasis == null ? "NULL" : "'" + devvinchasis + "'") + ","	
			+ (devlocacion == null ? "NULL" : "'" + devlocacion + "'") + "," 
			+ (devcolor == null ? "NULL" : "'" + devcolor + "'") + ","
			+ (devestado == null ? "NULL" : "'"+ devestado + "'") + "," 
			+ (devfechaingreso == null ? "NULL" : "'" + devfechaingreso + "'") + "," 
			+ (devfechasalida == null ? "NULL" : "'" + devfechasalida + "'") + ","	
			+ (devfechaalistamiento == null ? "NULL" : "'" + devfechaalistamiento + "'") + ","	
			+ (devnovedades == null ? "NULL" : "'" + devnovedades + "'") + ") RETURNING devcodsx";
		return getConteo(insert);
	}

	public detalleentradavehiculo getdetalleentradavehiculo(String devcodsx) {
		String cad = "SELECT * FROM detalleentradavehiculo WHERE devcodsx = " + devcodsx;
		return (detalleentradavehiculo) getEntidad(cad);
	}

	public detalleentradavehiculo getdetalleentradavehiculo_vin(String vin) {
		String cad = "SELECT * FROM detalleentradavehiculo WHERE devvinchasis = '" + vin + "'";
		return (detalleentradavehiculo) getEntidad(cad);
	}
	
	public boolean updatedetalleentradavehiculo(detalleentradavehiculo entity) throws SQLException {
		String cad = " update detalleentradavehiculo set "
			+ "devcodentrada = " + (entity.getDevcodentrada() == null ? "NULL" : entity.getDevcodentrada()) + "," 
			+ "devreferencia = " + (entity.getDevreferencia() == null ? "NULL" : "'" + entity.getDevreferencia() + "'") + "," 
			+ "devmarca = " + (entity.getDevmarca() == null ? "NULL" : "'" + entity.getDevmarca() + "'") + ","
			+ "devmodelo = " + (entity.getDevmodelo() == null ? "NULL" : "'" + entity.getDevmodelo() + "'") + "," 
			+ "devmotor = " + (entity.getDevmotor() == null ? "NULL" : "'" + entity.getDevmotor() + "'") + ","
			+ "devvinchasis = " + (entity.getDevvinchasis() == null ? "NULL" : "'" + entity.getDevvinchasis() + "'") + "," 
			+ "devlocacion = " + (entity.getDevlocacion() == null ? "NULL" : "'" + entity.getDevlocacion() + "'") + ","
			+ "devcolor = " + (entity.getDevcolor() == null ? "NULL" : "'" + entity.getDevcolor() + "'") + "," 
			+ "devestado = " + (entity.getDevestado() == null ? "NULL" : "'" + entity.getDevestado() + "'") + "," 
			+ "devfechaingreso = " + (entity.getDevfechaingreso() == null ? "NULL" : "'" + entity.getDevfechaingreso() + "'") + ","
			+ "devfechasalida = " + (entity.getDevfechasalida() == null ? "NULL" : "'" + entity.getDevfechasalida() + "'") + ","
			+ "devfechaalistamiento = " + (entity.getDevfechaalistamiento() == null ? "NULL" : "'" + entity.getDevfechaalistamiento() + "'") + ","
			+ "devnovedades = " + (entity.getDevnovedades() == null ? "NULL" : "'" + entity.getDevnovedades() + "'") 
			+ " where devcodsx = " + entity.getDevcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean updatedetalleentradavehiculo(detalleentradavehiculoForm entity) throws SQLException {
		String cad = " update detalleentradavehiculo set " 
		+ "devcodentrada = " + (entity.getDevcodentrada() == null ? "NULL" : entity.getDevcodentrada()) + "," 
		+ "devreferencia = " + (entity.getDevreferencia() == null ? "NULL" : "'" + entity.getDevreferencia() + "'") + "," 
		+ "devmarca = " + (entity.getDevmarca() == null ? "NULL" : "'" + entity.getDevmarca() + "'") + ","
		+ "devmodelo = " + (entity.getDevmodelo() == null ? "NULL" : "'" + entity.getDevmodelo() + "'") + "," 
		+ "devmotor = " + (entity.getDevmotor() == null ? "NULL" : "'" + entity.getDevmotor() + "'") + ","
		+ "devvinchasis = " + (entity.getDevvinchasis() == null ? "NULL" : "'" + entity.getDevvinchasis() + "'") + "," 
		+ "devlocacion = " + (entity.getDevlocacion() == null ? "NULL" : "'" + entity.getDevlocacion() + "'") + ","
		+ "devcolor = " + (entity.getDevcolor() == null ? "NULL" : "'" + entity.getDevcolor() + "'") + "," 
		+ "devestado = " + (entity.getDevestado() == null ? "NULL" : "'" + entity.getDevestado() + "'") + "," 
		+ "devfechaingreso = " + (entity.getDevfechaingreso() == null ? "NULL" : "'" + entity.getDevfechaingreso() + "'") + ","
		+ "devfechasalida = " + (entity.getDevfechasalida() == null ? "NULL" : "'" + entity.getDevfechasalida() + "'") + ","
		+ "devfechaalistamiento = " + (entity.getDevfechaalistamiento() == null ? "NULL" : "'" + entity.getDevfechaalistamiento() + "'") + ","
		+ "devnovedades = " + (entity.getDevnovedades() == null ? "NULL" : "'" + entity.getDevnovedades() + "'") 
		+ " where devcodsx = " + entity.getDevcodsx();
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public boolean eliminar(String devcodsx) throws SQLException {
		String elim = " delete from detalleentradavehiculo where devcodsx = " + devcodsx;
		int r = db.executeUpdate(elim);
		return r == 0 ? false : true;
	}

	public Collection getlistadetalleentradavehiculo(String evcodsx) {
		String consulta = "SELECT * FROM detalleentradavehiculo WHERE devcodentrada = " + evcodsx;
		return getLista(consulta);
	}
	
	public int getTotalPaginaslistadetalleentradavehiculo(String evcodsx, String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM detalleentradavehiculo where devcodentrada = " + evcodsx;
		return getPaginas(consulta);
	}
	
	
	public Collection getlista_busqueda(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM detalleentradavehiculo where " + getTextoBusquedaResumen_OR(param) + " order by devcodsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}
	
	private String getVinBusqueda_OR(String cadena){
		
		if(cadena.equals("")) return " vin like '%%'";
		
		StringTokenizer stk = new StringTokenizer(cadena.toUpperCase(), " ");
		cadena = "(" ;
		int tokens = stk.countTokens();
		int i=1;
		while(stk.hasMoreElements()) {
			cadena += " vin like '%"  + new String(stk.nextElement().toString()).toUpperCase() + "%' ";
			if(tokens != i++)		cadena += " or ";
		}
		cadena +=")";
		return cadena;
	}
	
	public int getTotalPaginaslista_busqueda(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM cargue where " + getVinBusqueda_OR(param);
		return getPaginas(consulta);
	}
	
	public boolean updatecargue(String vin, String campo, String valor) throws SQLException {
		String cad;
		if (campo != null && campo.startsWith("fecha") ) {
			valor = "to_date( '" + valor + "','dd/mm/yyyy')";
			cad = " update cargue set " + campo + " = " + valor + " where vin = upper('" + vin + "')";
		} else {
			cad = " update cargue set " + campo + " = '" + valor + "'" + " where vin = upper('" + vin + "')";
		}
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}

	public Collection getlista_busquedaCargue(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT ciclico, code, marca, engine, vin, ubicacion, color, coalesce(to_char(fechadespacho,'YYYY-MM-DD'),'') as fechadespacho, alist, estado, " +
		" destino, transp, nac, to_char(fechaingreso,'YYYY-MM-DD'), bl, novedad, novedadtransp, fmm, " +
		" coalesce(to_char(fechaalist,'YYYY-MM-DD'),'') as fechaalist, coalesce(to_char(fechatrasladope,'YYYY-MM-DD'),'') as fechatrasladope, " +
		" coalesce(fechadespacho,CURRENT_DATE)-coalesce(fechaalist,CURRENT_DATE) as diaspdi, coalesce(fechadespacho,CURRENT_DATE)-fechaingreso as diaspatios, planilla " +
		" FROM cargue where " + getVinBusqueda_OR(param) + " order by vin";
		return getListaDeListas(consulta);
	}
	
	public Collection getlista_busquedaCargue(String filtro,String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT ciclico, code, marca, engine, vin, ubicacion, color, coalesce(to_char(fechadespacho,'YYYY-MM-DD'),'') as fechadespacho, alist, estado, " +
		" destino, transp, nac, to_char(fechaingreso,'YYYY-MM-DD'), bl, novedad, novedadtransp, fmm, " +
		" coalesce(to_char(fechaalist,'YYYY-MM-DD'),'') as fechaalist, coalesce(to_char(fechatrasladope,'YYYY-MM-DD'),'') as fechatrasladope, " +
		" coalesce(fechadespacho,CURRENT_DATE)-fechaalist as diaspdi, coalesce(fechadespacho,CURRENT_DATE)-fechaingreso as diaspatios, planilla " +
		" FROM cargue where " + filtro + " = '" + param + "' order by vin";
		return getListaDeListas(consulta);
	}
	
	public Collection getResumenInvCargue()  {
		String consulta = "select dev.marca,count(1),d1.serviautos,d2.pdi,d3.nac " + 
			"from cargue dev " +
			"left outer join (select dev1.marca, count(dev1.vin) as serviautos from cargue dev1 where dev1.estado in ('SER','SERVIAUTOS') group by dev1.marca ) as d1 on d1.marca = dev.marca " +
			"left outer join (select dev2.marca, count(dev2.vin) as pdi from cargue dev2 where dev2.alist = 'SI' and dev2.estado != 'ENTREGADO' group by dev2.marca ) as d2 on d2.marca = dev.marca " +
			"left outer join (select dev3.marca, count(dev3.vin) as nac from cargue dev3 where dev3.nac ='SI' and dev3.estado != 'ENTREGADO' group by dev3.marca ) as d3 on d3.marca = dev.marca " +
			"where dev.estado != 'ENTREGADO' " + 
			"group by dev.marca,d1.serviautos,d2.pdi,d3.nac " +
			"order by marca " ;	
		return getListaDeListas(consulta);
	}
	
	public int creaplanilla(String notif, String transp, String nomcond, String cedcond, String placa) throws SQLException {
		String insert = "INSERT INTO planilla (codsx, fecha, notif, transp, nomcond, cedcond, placa) VALUES (default,CURRENT_DATE," 
			+ (notif == null ? "NULL" : "'" + notif + "'") + "," 
			+ (transp == null ? "NULL" : "'" + transp + "'") + ","
			+ (nomcond == null ? "NULL" : "'"+ nomcond + "'") + "," 
			+ (cedcond == null ? "NULL" : "'" + cedcond + "'") + "," 
			+ (placa == null ? "NULL" : "'" + placa + "'")  + ") RETURNING codsx";
		return getConteo(insert);
	}
	
	public Collection getlistaplanilla(String start) {
		start = start == null ? "0" : start;
		String consulta = "SELECT codsx, fecha, notif, transp, nomcond, cedcond, placa FROM planilla order by codsx desc" + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
		return getListaDeListas(consulta);
	}
	
	public Collection getplanilla(String codsx) {
		String consulta = "SELECT codsx, fecha, notif, transp, nomcond, cedcond, placa FROM planilla where codsx =  " + codsx;
		return getListaDeListas(consulta);
	}
	
	public boolean updatecargue_planilla(String planilla) throws SQLException {
		String cad = "update cargue set planilla = null where planilla = " + planilla;
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}
	
	public boolean elimina_planilla(String planilla) throws SQLException {
		String cad = "delete from planilla where codsx = " + planilla;
		int resp = db.executeUpdate(cad);
		return resp == 0 ? false : true;
	}
	
	public Collection getlista_CarguePlanilla(String planilla) {
		String consulta = "SELECT ciclico, code, marca, engine, vin, ubicacion, color, coalesce(to_char(fechadespacho,'YYYY-MM-DD'),'') as fechadespacho, alist, estado, " +
		" destino, transp, nac, to_char(fechaingreso,'YYYY-MM-DD'), bl, novedad, novedadtransp, fmm, " +
		" coalesce(to_char(fechaalist,'YYYY-MM-DD'),'') as fechaalist, coalesce(to_char(fechatrasladope,'YYYY-MM-DD'),'') as fechatrasladope, " +
		" coalesce(fechadespacho,CURRENT_DATE)-coalesce(fechaalist,CURRENT_DATE) as diaspdi, coalesce(fechadespacho,CURRENT_DATE)-fechaingreso as diaspatios, planilla " +
		" FROM cargue where planilla =" + planilla + " order by vin";
		return getListaDeListas(consulta);
	}
}
