package maestro.control;import maestro.form.*;import maestro.entity.*;import db.*;import java.util.Collection;import java.sql.SQLException;import util.Listado;/******************************************************************************* * CLASE GENERADA CON generator V3.0 By pablito**** ******************************************************************************/public class gstciudad extends GstTabla {	public gstciudad() {		db = new beanConnector();		this.classEntidad = ciudad.class;	}	public gstciudad(beanConnector db) {		this.db = db;		this.classEntidad = ciudad.class;	}	public Collection getlistaciudad() {		String consulta = " SELECT * FROM ciudad order by ciudepto, ciunombre asc";		return getLista(consulta);	}	public Collection getlistaciudad(String start, String param) {		start = start == null ? "0" : start;		param = param == null ? "" : param;		String consulta = " SELECT * FROM ciudad where " +				getTextoBusquedaResumen(param) +				" order by ciucodigo limit " + this.maxfilas + " offset  "				+ (Integer.parseInt(start) * this.maxfilas);		return getLista(consulta);	}				public ciudad getciudad_by_ukeyCodigo(String ciucodigo) {		 String cad = "SELECT * FROM ciudad WHERE ciucodigo='"+ciucodigo+ "'" ;		 return (ciudad)getEntidad(cad);		 }		public ciudad getciudad_by_ukeyNombre(String nombreCiudad) {		 String cad = "SELECT * FROM ciudad WHERE ciunombre='"+nombreCiudad+ "'" ;		 return (ciudad)getEntidad(cad);		 }		public ciudad getciudad_by_ukeyNombre(String ciunombre , String ciudepto) {		 String cad = "SELECT * FROM ciudad WHERE ciunombre ='"+ciunombre+ "' AND ciudepto = '"+ciudepto+"'" ;		 return (ciudad)getEntidad(cad);  }	public int getTotalPaginaslistaciudad(String param) {		param = param == null ? "" : param;		String consulta = " SELECT count(1) FROM ciudad where  " +			getTextoBusquedaResumen(param);		return getPaginas(consulta);	}	public boolean crearciudad(String ciucodigo, String ciunombre, String ciudepto, String ciusaferbo)			throws SQLException {		String insert = "INSERT INTO ciudad (ciucodigo,ciunombre,ciudepto,ciusaferbo) VALUES ('"			+ ciucodigo + "',"				+ (ciunombre == null ? "NULL" : "'" + ciunombre + "'") + ","				+ (ciudepto == null ? "NULL" : "'" + ciudepto + "'") + ","				+ (ciusaferbo == null ? "NULL" : "'" + ciusaferbo + "'") + ")";		int resp = db.executeUpdate(insert);		return resp == 0 ? false : true;	}	public ciudad getciudad(String ciucodigo) {		String cad = "SELECT * FROM ciudad WHERE ciucodigo='" + ciucodigo + "'";		return (ciudad) getEntidad(cad);	}	public boolean updateciudad(ciudad entity) throws SQLException {		String cad = " update ciudad set  "				+ " ciunombre = " + (entity.getciunombre() == null ? "NULL" : "'" + entity.getciunombre() + "'") + ","				+ " ciudepto = "  + (entity.getciudepto() == null ? "NULL" : "'" + entity.getciudepto() + "'") + ","				+ " ciucodigo = " + (entity.getciucodigo() == null ? "NULL" : "'" + entity.getciucodigo() + "'") + ","				+ " ciusaferbo = " + (entity.getciusaferbo() == null ? "NULL" : "'" + entity.getciusaferbo() + "'") + 				" where ciucodigo = " + entity.getciucodigo();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean updateciudad(ciudadForm entity) throws SQLException {		String cad = " update ciudad set  "				+ " ciunombre = " + (entity.getciunombre() == null ? "NULL" : "'" + entity.getciunombre() + "'") + ","				+ " ciudepto = "  + (entity.getciudepto() == null ? "NULL" : "'" + entity.getciudepto() + "'") + ","				+ " ciucodigo = " + (entity.getciucodigo() == null ? "NULL" : "'" + entity.getciucodigo() + "'") + ","				+ " ciusaferbo = " + (entity.getciusaferbo() == null ? "NULL" : "'" + entity.getciusaferbo() + "'") + 				" where ciucodigo = " + entity.getciucodigo();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean eliminar(String ciucodigo) throws SQLException {		String elim = " delete from ciudad where ciucodigo = '" + ciucodigo				+ "'";		int r = db.executeUpdate(elim);		return r == 0 ? false : true;	}			public Collection getlistaciudadByDepto(String ciudepto , String start, String param) {		start = start == null ? "0" : start;		param = param == null ? "" : param;		 String cad = "SELECT * FROM ciudad WHERE ciudepto='" + ciudepto + "'  and" + 		 getTextoBusquedaResumen(param) +			"  limit " + this.maxfilas + " offset  "+ (Integer.parseInt(start) * this.maxfilas);		 return getLista(cad);  		 }	public int getTotalPaginaslistaciudadByDepto(String ciudepto , String start, String param) {		param = param == null ? "" : param;		String cad = "SELECT count(1) FROM ciudad WHERE ciudepto = '"+ciudepto+"'  and " +		getTextoBusquedaResumen(param) ;		return getPaginas(cad);	}		public Collection getlistaciudadConDepto(String start, String param) {		start = start == null ? "0" : start;		param = param == null ? "" : param;		this.classEntidad = Listado.class;		String consulta = " SELECT ciucodigo, ciunombre, depnombre, depcodigo,'','','' FROM ciudad, departamento where " +				" ciudepto = depcodigo and " +				getTextoBusquedaResumen("ciudad", param) +				" order by ciucodigo limit " + this.maxfilas + " offset  "				+ (Integer.parseInt(start) * this.maxfilas);		Collection resp = getLista(consulta);		this.classEntidad = ciudad.class;		return resp;	}		public int getTotalPaginaslistaciudadConDepto(String param) {		param = param == null ? "" : param;		String consulta = " SELECT count(1) FROM ciudad where  " +			getTextoBusquedaResumen(param);		return getPaginas(consulta);	}}