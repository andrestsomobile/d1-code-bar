package maestro.control;import java.sql.SQLException;import java.util.Collection;import maestro.entity.categoria_oster;import maestro.form.categoria_osterForm;import db.GstTabla;import db.beanConnector;public class gstcategoria_oster extends GstTabla {	public gstcategoria_oster() {		db = new beanConnector();		this.classEntidad = categoria_oster.class;	}	public gstcategoria_oster(beanConnector db) {		this.db = db;		this.classEntidad = categoria_oster.class;	}	public Collection getlistacategoria_oster() {		String consulta = " SELECT * FROM categoria_oster order by 1 asc";		return getLista(consulta);	}	public Collection getlistacategoria_oster(String start, String param) {		start = start == null ? "0" : start;		param = param == null ? "" : param;		String consulta = " SELECT * FROM categoria_oster where " +			getTextoBusquedaResumen( param) +" order by catocodsx desc " +				"limit " +				 this.maxfilas + " offset  "				+ (Integer.parseInt(start) * this.maxfilas);		return getLista(consulta);	}	public int getTotalPaginaslistacategoria_oster(String param) {		param = param == null ? "" : param;		String consulta = " SELECT count(1) FROM categoria_oster where  " +			getTextoBusquedaResumen( param);		return getPaginas(consulta);	}		public boolean crearcategoria_oster(String catodescripcion) throws SQLException {		String insert = "INSERT INTO categoria_oster (catodescripcion) VALUES ("				+ (catodescripcion == null ? "NULL" : "'" + catodescripcion + "'")				+ ")";		int resp = db.executeUpdate(insert);		return resp == 0 ? false : true;	}	public categoria_oster getcategoria_oster(String catocodsx) {		String cad = "SELECT * FROM categoria_oster WHERE catocodsx = '" + catocodsx				+ "'";		return (categoria_oster) getEntidad(cad);	}	public boolean updatecategoria_oster(categoria_oster entity) throws SQLException {		String cad = " update categoria_oster set  "				+ " catodescripcion = "				+ (entity.getcatodescripcion() == null ? "NULL" : "'"						+ entity.getcatodescripcion() + "'")				+ " where catocodsx = "				+ entity.getcatocodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean updatecategoria_oster(categoria_osterForm entity) throws SQLException {		String cad = " update categoria_oster set  "				+ " catodescripcion = "				+ (entity.getcatodescripcion() == null ? "NULL" : "'"						+ entity.getcatodescripcion() + "'")				+ " where catocodsx = "				+ entity.getcatocodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean eliminar(String catocodsx) throws SQLException {		String elim = " delete from categoria_oster where catocodsx = '" + catocodsx				+ "'";		int r = db.executeUpdate(elim);		return r == 0 ? false : true;	}	}