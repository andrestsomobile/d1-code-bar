package ingreso.control;import ingreso.form.*;import ingreso.entity.*;import db.*;import java.util.Collection;import java.sql.SQLException;public class gstlote_contenedor_trafico extends GstTabla {	public gstlote_contenedor_trafico() {		db = new beanConnector();		this.classEntidad = lote_contenedor_trafico.class;	}	public gstlote_contenedor_trafico(beanConnector db) {		this.db = db;		this.classEntidad = lote_contenedor_trafico.class;	}	public Collection getlistalote_contenedor_trafico() {		String consulta = " SELECT * FROM lote_contenedor_trafico";		return getLista(consulta);	}	public Collection getlistalote_contenedor_trafico(String ltrafnumtrafico) {		String consulta = " SELECT lote_contenedor_trafico.* "				+ " FROM lote_contenedor_trafico "				+ " INNER JOIN lote_trafico ON ltrafcodsx = lctraflote "				+ " AND  ltrafnumtrafico = " + ltrafnumtrafico;		return getLista(consulta);	}		public Collection getListaContenedorTraficoByNumTrafico(String ltrafnumtrafico) {		String consulta = " SELECT * FROM lote_contenedor_trafico where lctraflote IN ( "				+ "SELECT ltrafcodsx FROM lote_trafico where ltrafnumtrafico = " + ltrafnumtrafico				+ " ) and exists ( "				+ "SELECT inretrafico FROM inspeccion_recibo where inretrafico = " + ltrafnumtrafico				+ "and lote_contenedor_trafico.lctrafcodsx = inspeccion_recibo.inrelctrafico "				+ " ) ";		return getLista(consulta);	}						public boolean crearlote_contenedor_trafico(String lctrafcontenedor, String lctraflote, String lctrafcantidad) throws SQLException {		String insert = "INSERT INTO lote_contenedor_trafico (lctrafcontenedor, lctraflote, lctrafcantidad) VALUES (" 	            + (lctrafcontenedor == null ? "NULL" : "'" + lctrafcontenedor + "'") + "," 				+ (lctraflote == null ? "NULL" : "'" + lctraflote + "'") + ","				+ (lctrafcantidad == null ? "0" : "'" + lctrafcantidad + "'") 				+ ")";		int resp = db.executeUpdate(insert);		return resp == 0 ? false : true;	}		public lote_contenedor_trafico getLoteContenedorByProducto(String contenedor, String trafico, String producto) {		String cad = "SELECT lc.* FROM lote_contenedor_trafico lc, lote_trafico lt where "				+ " lctraflote IN (SELECT ltrafcodsx FROM lote_trafico where ltrafnumtrafico = " + trafico				+ " and ltrafcodproducto = " + producto				+ " ) and lctrafcontenedor = " + contenedor				+ " and lc.lctraflote = lt.ltrafcodsx ";		return (lote_contenedor_trafico) getEntidad(cad);	}	public lote_contenedor_trafico getlote_contenedor_trafico(String lctrafcodsx) {		String cad = "SELECT * FROM lote_contenedor_trafico WHERE lctrafcodsx='" + lctrafcodsx + "'";		return (lote_contenedor_trafico) getEntidad(cad);	}		public Collection getContenedorLoteTraficoByContenedor(String contenedorId, String traficoId) {		String cad = "SELECT * FROM lote_contenedor_trafico where "				+ " lctraflote IN (SELECT ltrafcodsx FROM lote_trafico where ltrafnumtrafico = "+ traficoId				+ ") and lctrafcontenedor = " + contenedorId;		return getLista(cad);	}	public boolean updatelote_contenedor_trafico(lote_contenedor_trafico entity) throws SQLException {		String cad = " update lote_contenedor_trafico set  " 	            + " lctrafcontenedor = " + (entity.getlctrafcontenedor() == null ? "NULL" : "'" + entity.getlctrafcontenedor() + "'")				+ " ,lctraflote = " + (entity.getlctraflote() == null ? "NULL" : "'" + entity.getlctraflote() + "'") 				+ " ,lctrafcantidad = " + (entity.getlctrafcantidad()== null ? "NULL" : "'" + entity.getlctrafcantidad() + "'") 				+ " ,lctrafingreso = " + (entity.getlctrafingreso()== null ? "NULL" : "'" + entity.getlctrafingreso() + "'") 				+ " where lctrafcodsx = " + entity.getlctrafcodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean updatelote_contenedor_trafico(lote_contenedor_traficoForm entity) throws SQLException {		String cad = " update lote_contenedor_trafico set  " 	            + " lctrafcontenedor = " + (entity.getlctrafcontenedor() == null ? "NULL" : "'" + entity.getlctrafcontenedor() + "'")				+ " ,lctraflote = " + (entity.getlctraflote() == null ? "NULL" : "'" + entity.getlctraflote() + "'") 				+ " ,lctrafcantidad = " + (entity.getlctrafcantidad()== null ? "NULL" : "'" + entity.getlctrafcantidad() + "'") 				+ " ,lctrafingreso = " + (entity.getlctrafingreso()== null ? "NULL" : "'" + entity.getlctrafingreso() + "'") 				+ " where lctrafcodsx = " + entity.getlctrafcodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean eliminar(String lctrafcodsx) throws SQLException {		String elim = " delete from lote_contenedor_trafico where lctrafcodsx = '" + lctrafcodsx + "'";		int r = db.executeUpdate(elim);		return r == 0 ? false : true;	}		public Collection getlistaVehiculosDescargando() {		String consulta = " select lote_contenedor_trafico.* from lote_contenedor_trafico \r" + 				"inner join contenedor_trafico on ctrafcodsx = lctrafcontenedor\r" + 				"inner join trafico on trafcodsx = ctrafnumtrafico and trafestado = 'TRAMITE'\r" + 				"where ctrafestado != 'FINALIZADO' \r"				+ "order by 1 desc" ;		return getLista(consulta);	}}