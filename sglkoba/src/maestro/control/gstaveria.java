package maestro.control;import maestro.form.*;import maestro.entity.*;import db.*;import java.util.Collection; import java.sql.SQLException;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class gstaveria extends GstTabla { public gstaveria() {  db= new beanConnector();  this.classEntidad =averia.class; 
}public gstaveria(beanConnector db) {  this.db= db;  this.classEntidad =averia.class; 
}public Collection getlistaaveria() {String consulta = " SELECT * FROM averia";    return getLista(consulta);  }public Collection getlistaaveria(String start, String param ) { start= start==null ? "0" :  start;   param= param==null ? "" :  param; String consulta = " SELECT * FROM averia where " + " avedescripcion like '%" + param + "%' " +  "  limit " + this.maxfilas  + " offset  " + (Integer.parseInt(start) * this.maxfilas);     return getLista(consulta);  } public int getTotalPaginaslistaaveria(String param) {  param= param==null ? "" :  param; String consulta = " SELECT count(1) FROM averia where  " + " avedescripcion like '%" + param + "%'" + "  ";      return getPaginas(consulta);  	}  public boolean crearaveria(String avedescripcion) throws SQLException { String insert = "INSERT INTO averia (avedescripcion) VALUES (" +    (avedescripcion==null ? "NULL" : "'" + avedescripcion+"'")   + ")";int resp = db.executeUpdate(insert);return resp ==0 ? false : true;  } public averia getaveria(String avecodsx) { String cad = "SELECT * FROM averia WHERE avecodsx='"+avecodsx+ "'" ; return (averia)getEntidad(cad);  }public boolean updateaveria( averia entity ) throws SQLException {  String cad = " update averia set  " + " avedescripcion = " +( entity.getavedescripcion() == null ? "NULL": "'" + entity.getavedescripcion() + "'" ) + " where avecodsx = " +  entity.getavecodsx() ;   int resp= db.executeUpdate(cad);      return resp ==0 ? false : true ;      } public boolean updateaveria( averiaForm entity ) throws SQLException {  String cad = " update averia set  " + " avedescripcion = " +( entity.getavedescripcion() == null ? "NULL": "'" + entity.getavedescripcion() + "'" ) + " where avecodsx = " +  entity.getavecodsx() ;   int resp= db.executeUpdate(cad);      return resp ==0 ? false : true ;      }  public boolean eliminar(String avecodsx) throws SQLException {   String elim = " delete from averia where avecodsx = '"+ avecodsx+ "'"; int r = db.executeUpdate(elim) ; return  r==0? false : true ;  } }