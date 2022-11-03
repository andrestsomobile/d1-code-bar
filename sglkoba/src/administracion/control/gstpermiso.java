package administracion.control;import administracion.form.*;import administracion.entity.*;import db.*;import java.util.ArrayList;import java.util.Collection;import java.io.File;import java.sql.SQLException;import javax.naming.InitialContext;import javax.naming.NamingException;import javax.servlet.ServletContext;import javax.servlet.http.HttpSession;/******************************************************************************* * CLASE GENERADA CON generator V3.0 By pablito**** ******************************************************************************/public class gstpermiso extends GstTabla {	public gstpermiso() {		db = new beanConnector();		this.classEntidad = permiso.class;	}	public gstpermiso(beanConnector db) {		this.db = db;		this.classEntidad = permiso.class;	}	public Collection getlistapermiso() {		String consulta = " SELECT * FROM permiso";		return getLista(consulta);	}	public Collection getlistapermiso(String start, String param) {		start = start == null ? "0" : start;		param = param == null ? "" : param;		String consulta = " SELECT * FROM permiso where " +		getTextoBusquedaResumen(param) + 			"order by percodsx desc " + "  limit "				+ this.maxfilas + " offset  "				+ (Integer.parseInt(start) * this.maxfilas);		return getLista(consulta);	}	public int getTotalPaginaslistapermiso(String param) {		param = param == null ? "" : param;		String consulta = " SELECT count(1) FROM permiso where  " +			getTextoBusquedaResumen(param);		return getPaginas(consulta);	}	public boolean crearpermiso(String pergrupo, String perapp,			String permodulo, String peracceso) throws SQLException {		String insert = "INSERT INTO permiso (pergrupo,perapp,permodulo,peracceso) VALUES ("				+ (pergrupo == null ? "NULL" : "'" + pergrupo + "'")				+ ","				+ (perapp == null ? "NULL" : "'" + perapp + "'")				+ ","				+ (permodulo == null ? "NULL" : "'" + permodulo + "'")				+ ","				+ (peracceso == null ? "NULL" : "'" + peracceso + "'") + ")";		int resp = db.executeUpdate(insert);		return resp == 0 ? false : true;	}	public permiso getpermiso(String percodsx) {		String cad = "SELECT * FROM permiso WHERE percodsx='" + percodsx + "'";		return (permiso) getEntidad(cad);	}	public permiso getpermiso(String pergrupo,String  perapp, String permodulo) {		String cad = "SELECT * FROM permiso WHERE pergrupo='" + pergrupo + "' and perapp='" + perapp + "' and " +				" permodulo='" + permodulo + "'";		return (permiso) getEntidad(cad);	}	public boolean updatepermiso(permiso entity) throws SQLException {		String cad = " update permiso set  "				+ " pergrupo = "				+ (entity.getpergrupo() == null ? "NULL" : "'"						+ entity.getpergrupo() + "'")				+ ","				+ " perapp = "				+ (entity.getperapp() == null ? "NULL" : "'"						+ entity.getperapp() + "'")				+ ","				+ " permodulo = "				+ (entity.getpermodulo() == null ? "NULL" : "'"						+ entity.getpermodulo() + "'")				+ ","				+ " peracceso = "				+ (entity.getperacceso() == null ? "NULL" : "'"						+ entity.getperacceso() + "'") + " where percodsx = "				+ entity.getpercodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean updatepermiso(permisoForm entity) throws SQLException {		String cad = " update permiso set  "				+ " pergrupo = "				+ (entity.getpergrupo() == null ? "NULL" : "'"						+ entity.getpergrupo() + "'")				+ ","				+ " perapp = "				+ (entity.getperapp() == null ? "NULL" : "'"						+ entity.getperapp() + "'")				+ ","				+ " permodulo = "				+ (entity.getpermodulo() == null ? "NULL" : "'"						+ entity.getpermodulo() + "'")				+ ","				+ " peracceso = "				+ (entity.getperacceso() == null ? "NULL" : "'"						+ entity.getperacceso() + "'") + " where percodsx = "				+ entity.getpercodsx();		int resp = db.executeUpdate(cad);		return resp == 0 ? false : true;	}	public boolean eliminar(String percodsx) throws SQLException {		String elim = " delete from permiso where percodsx = '" + percodsx				+ "'";		int r = db.executeUpdate(elim);		return r == 0 ? false : true;	}	public boolean verHeader(String grupo, String app) {		String cad = "select count(1) from permiso where pergrupo=" + grupo				+ " and perapp='" + app + "' and peracceso!=0";		int resp = getConteo(cad);		return resp == 0 ? false : true;	}	public boolean verIzquierdo(String grupo, String app, String modulo) {		String cad = "select count(1) from permiso where pergrupo=" + grupo				+ " and perapp='" + app + "' " + " and permodulo='" + modulo				+ "' and peracceso!=0";		int resp = getConteo(cad);		return resp == 0 ? false : true;	}	public int getNivelpermiso(String pergrupo,String  perapp, String permodulo) {		String cad = "SELECT peracceso FROM permiso WHERE pergrupo='" + pergrupo + "' and perapp='" + perapp + "' and " +				" permodulo='" + permodulo + "'";		return getConteo(cad);	}		public static int getNivel(HttpSession session, String app, String modulo){		int resp=0;		try {		grupo gru = (grupo)session.getAttribute("grupo");		gstpermiso gper = new gstpermiso();		resp = gper.getNivelpermiso(gru.getgcodsx(), app, modulo );		}catch(Exception ex) { ex.printStackTrace(); }		return resp;	}	public static boolean getEscritura(HttpSession session, String app, String modulo){		int resp=0;		try {		grupo gru = (grupo)session.getAttribute("grupo");		gstpermiso gper = new gstpermiso();		resp = gper.getNivelpermiso(gru.getgcodsx(), app, modulo );		}catch(Exception ex) { ex.printStackTrace(); }		return resp>=2 ? true : false;	}	public static boolean getLectura(HttpSession session, String app, String modulo){		int resp=0;		try {		grupo gru = (grupo)session.getAttribute("grupo");		gstpermiso gper = new gstpermiso();		resp = gper.getNivelpermiso(gru.getgcodsx(), app, modulo );		}catch(Exception ex) { ex.printStackTrace(); }		return resp>=1 ? true : false;	}		public static boolean getAdministracion(HttpSession session, String app, String modulo){		int resp=0;		try {		grupo gru = (grupo)session.getAttribute("grupo");		gstpermiso gper = new gstpermiso();		resp = gper.getNivelpermiso(gru.getgcodsx(), app, modulo );		}catch(Exception ex) { ex.printStackTrace(); }		return resp>=3 ? true : false;	}		public static boolean getAutorizaciones(HttpSession session, String app, String modulo){		int resp=0;		try {		grupo gru = (grupo)session.getAttribute("grupo");		gstpermiso gper = new gstpermiso();		resp = gper.getNivelpermiso(gru.getgcodsx(), app, modulo );		}catch(Exception ex) { ex.printStackTrace(); }		return resp>=4 ? true : false;	}			public Collection getListaApp(String app, String pag, String param) throws NamingException{		InitialContext ic = new InitialContext();		ServletContext sc = (ServletContext)ic.lookup("servletcontext");		String ruta =  sc.getRealPath(File.separator+ File.separator) + File.separator + "files" + File.separator + app + File.separator;				File[] files = new File( ruta ).listFiles();		 Collection list = new ArrayList(); 		 for(int i=0; i< files.length ; i++){			permiso per = new permiso( files[i].getName(), "","","","","" );			 list.add(per);		 }		return list;	}			public int getTotalListaApp( String app, String param){		return 0;	}		public boolean getpermisoCompania(HttpSession session, String app, String modulo, String codcia){		int resp=0;		try {			usuario usu = (usuario) session.getAttribute("usuario");			String sql = "select count(*) from usuario_compania where usucodigo =  " + usu.getusucodsx() + " and comcodigo = " + codcia; 						resp = getConteo(sql);		}	catch(Exception ex) { 			ex.printStackTrace(); 		}		return resp > 0 ? true : false;	}			public static void main(String args[]) { 	gstpermiso pg = new gstpermiso();	//pg.getListaApp("", "0", "");		}	}