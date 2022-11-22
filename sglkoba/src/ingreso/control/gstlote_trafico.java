package ingreso.control;import ingreso.form.*;import ingreso.entity.*;import db.*;import java.util.Collection;import java.sql.SQLException;public class gstlote_trafico extends GstTabla {	public gstlote_trafico() {		db = new beanConnector();		this.classEntidad = lote_trafico.class;	}	public gstlote_trafico(beanConnector db) {		this.db = db;		this.classEntidad = lote_trafico.class;	}	public Collection getlistalote_trafico() {		String consulta = " SELECT * FROM lote_trafico";		return getLista(consulta);	}	public Collection getlistalote_trafico(String ltrafnumtrafico) {		String consulta = " SELECT * FROM lote_trafico where " + "  ltrafnumtrafico=" + ltrafnumtrafico;		return getLista(consulta);	}			public Collection getlistalote_trafico_vencimiento(String start, String param, String filtro) {		start = start == null ? "0" : start;		param = param == null ? "" : param;		filtro = filtro != null && filtro.equals("S") ? " and ltrafvencimiento <= current_date " : "";		String consulta = " SELECT lote_trafico.* FROM lote_trafico inner join trafico on trafcodsx = ltrafnumtrafico "		        + " where ( ltraflote like '%" + param + "%' or trafnumdta like '%" + param + "%' ) " 				+ filtro				+ " order by trafnumdta,ltraflote " 				+ "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);		return getLista(consulta);	}	public int getTotalPaginaslistalote_trafico_vencimiento(String param, String filtro) {		param = param == null ? "" : param;		filtro = filtro != null && filtro.equals("S") ? " and ltrafvencimiento <= current_date " : "";		String consulta = " SELECT count(1) FROM lote_trafico inner join trafico on trafcodsx = ltrafnumtrafico "					+ " where ( ltraflote like '%" + param + "%' or trafnumdta like '%" + param + "%' ) " 					+ filtro;		return getPaginas(consulta);	}		public Collection getlistalote_trafico(String ltrafnumtrafico, String ltrafcodproducto) {		String consulta = " SELECT ltrafcodsx, ltraflote,"				+ " ltrafnumtrafico, ltrafelaboracion, ltrafvencimiento, " 				+ " ltrafproveedor, ltrafproducto, ltrafcodproducto FROM lote_trafico  " 				+ " WHERE ltrafnumtrafico = " + ltrafnumtrafico				+ (ltrafcodproducto == null ? " " : " AND ltrafcodproducto = " + ltrafcodproducto ) 				+ " order by ltraflote";		return getLista(consulta);	}	public boolean crearlote_trafico(String ltrafnumtrafico, String ltraflote, String ltrafelaboracion, String ltrafvencimiento,			 String ltrafproveedor, String ltrafproducto, String ltrafcodproducto) throws SQLException {		String insert = "INSERT INTO lote_trafico (ltrafnumtrafico,ltraflote,ltrafelaboracion,ltrafvencimiento,ltrafproveedor"				+ ",ltrafproducto,ltrafcodproducto) VALUES (" 	            + (ltrafnumtrafico == null ? "NULL" : "'" + ltrafnumtrafico + "'") + "," 				+ (ltraflote == null ? "NULL" : "'" + ltraflote + "'") + ","				+ (ltrafelaboracion == null ? "NULL" : "'" + ltrafelaboracion + "'") + ","				+ (ltrafvencimiento == null ? "NULL" : "'" + ltrafvencimiento + "'") + ","				+ (ltrafproveedor == null ? "NULL" : "'" + ltrafproveedor + "'") + ","				+ (ltrafproducto == null ? "NULL" : "'" + ltrafproducto + "'") + ","				+ (ltrafcodproducto == null ? "NULL" : "'" + ltrafcodproducto + "'")				+ ")";		int resp = db.executeUpdate(insert);		return resp == 0 ? false : true;	}	public lote_trafico getlote_trafico(String ltrafcodsx) {		String cad = "SELECT * FROM lote_trafico WHERE ltrafcodsx='" + ltrafcodsx + "'";		return (lote_trafico) getEntidad(cad);	}		public lote_trafico getLoteByProducto(String contenedor, String trafico, String producto) {		String cad = "SELECT lt.* FROM lote_contenedor_trafico lc, lote_trafico lt where "				+ " lctraflote IN (SELECT ltrafcodsx FROM lote_trafico where ltrafnumtrafico = " + trafico				+ " and ltrafcodproducto = " + producto				+ " ) and lctrafcontenedor = " + contenedor				+ " and lc.lctraflote = lt.ltrafcodsx ";		return (lote_trafico) getEntidad(cad);	}	public boolean updatelote_trafico(lote_trafico entity) throws SQLException {		String cad = " update lote_trafico set  " 	            + " ltrafnumtrafico = " + (entity.getLtrafnumtrafico() == null ? "NULL" : "'" + entity.getLtrafnumtrafico() + "'")				+ " ,ltraflote = " + (entity.getLtraflote() == null ? "NULL" : "'" + entity.getLtraflote() + "'") 				+ " ,ltrafelaboracion = " + (entity.getLtrafelaboracion() == null || (entity.getLtrafelaboracion() != null && entity.getLtrafelaboracion().equals("")) ? "NULL" : "'" + entity.getLtrafelaboracion() + "'")				+ " ,ltrafvencimiento = " + (entity.getLtrafvencimiento() == null || (entity.getLtrafvencimiento() != null && entity.getLtrafvencimiento().equals("")) ? "NULL" : "'" + entity.getLtrafvencimiento() + "'")				+ " ,ltrafproveedor = " + (entity.getLtrafproveedor() == null ? "NULL" : "'" + entity.getLtrafproveedor() + "'") 				+ " ,ltrafproducto = " + (entity.getLtrafproducto() == null ? "NULL" : "'" + entity.getLtrafproducto() + "'") 				+ " ,ltrafcodproducto = " + (entity.getltrafcodproducto() == null ? "NULL" : "'" + entity.getltrafcodproducto() + "'") 				+ " where ltrafcodsx = " + entity.getLtrafcodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean updatelote_trafico(lote_traficoForm entity) throws SQLException {		String cad = " update lote_trafico set  " 	            + " ltrafnumtrafico = " + (entity.getLtrafnumtrafico() == null ? "NULL" : "'" + entity.getLtrafnumtrafico() + "'")				+ " ,ltraflote = " + (entity.getLtraflote() == null ? "NULL" : "'" + entity.getLtraflote() + "'") 				+ " ,ltrafelaboracion = " + (entity.getLtrafelaboracion() == null || (entity.getLtrafelaboracion() != null && entity.getLtrafelaboracion().equals("")) ? "NULL" : "'" + entity.getLtrafelaboracion() + "'")				+ " ,ltrafvencimiento = " + (entity.getLtrafvencimiento() == null || (entity.getLtrafvencimiento() != null && entity.getLtrafvencimiento().equals("")) ? "NULL" : "'" + entity.getLtrafvencimiento() + "'")				+ " ,ltrafproveedor = " + (entity.getLtrafproveedor() == null ? "NULL" : "'" + entity.getLtrafproveedor() + "'") 				+ " ,ltrafproducto = " + (entity.getLtrafproducto() == null ? "NULL" : "'" + entity.getLtrafproducto() + "'") 				+ " ,ltrafcodproducto = " + (entity.getltrafcodproducto() == null ? "NULL" : "'" + entity.getltrafcodproducto() + "'") 				+ " where ltrafcodsx = " + entity.getLtrafcodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean eliminar(String ltrafcodsx) throws SQLException {		String elim = " delete from lote_trafico where ltrafcodsx = '" + ltrafcodsx + "'";		int r = db.executeUpdate(elim);		return r == 0 ? false : true;	}}