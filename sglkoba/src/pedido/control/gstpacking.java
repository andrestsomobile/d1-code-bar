package pedido.control;import pedido.form.*;import pedido.entity.*;import db.*;import java.util.Collection;import java.math.BigDecimal;import java.sql.SQLException;  /*************************************************************CLASE GENERADA CON generator V3.0 By pablito*******/public class gstpacking extends GstTabla { public gstpacking() {  db= new beanConnector();  this.classEntidad =packing.class; 
}public gstpacking(beanConnector db) {  this.db= db;  this.classEntidad =packing.class; 
}public Collection getlistapacking() {String consulta = " SELECT * FROM packing";    return getLista(consulta);  }public Collection getlistapacking(String start, String param ) { start= start==null ? "0" :  start;   param= param==null ? "" :  param; String consulta = " SELECT * FROM packing where " + getTextoBusquedaResumen(param) + " order by packcodsx desc  limit " + this.maxfilas  + " offset  " + (Integer.parseInt(start) * this.maxfilas);     return getLista(consulta);  } public int getTotalPaginaslistapacking(String param) {  param= param==null ? "" :  param; String consulta = " SELECT count(1) FROM packing where  " + getTextoBusquedaResumen(param);      return getPaginas(consulta);  	}  public boolean crearpacking(String packempresa,String packfecha,String packobservaciones,String packestado) throws SQLException { String insert = "INSERT INTO packing (packempresa,packfecha,packobservaciones,packestado) VALUES (" +    (packempresa==null ? "NULL" : "'" + packempresa+"'") + "," +   (packfecha==null ? "NULL" : "'" + packfecha+"'") + "," +   (packobservaciones==null ? "NULL" : "'" + packobservaciones+"'") + "," +   (packestado==null ? "NULL" : "'" + packestado+"'")   + ")";int resp = db.executeUpdate(insert);return resp ==0 ? false : true;  } public packing getpacking(String packcodsx) { String cad = "SELECT * FROM packing WHERE packcodsx='"+packcodsx+ "'" ; return (packing)getEntidad(cad);  }public boolean updatepacking( packing entity ) throws SQLException {  String cad = " update packing set  " + " packempresa = " + ( entity.getpackempresa() == null ? "NULL": "'" + entity.getpackempresa() + "'" ) + "," + " packfecha = " + ( entity.getpackfecha() == null ? "NULL": "'" + entity.getpackfecha() + "'" ) + "," + " packobservaciones = " + ( entity.getpackobservaciones() == null ? "NULL": "'" + entity.getpackobservaciones() + "'" ) + "," + " packestado = " +( entity.getpackestado() == null ? "NULL": "'" + entity.getpackestado() + "'" ) + " where packcodsx = " +  entity.getpackcodsx() ;   int resp= db.executeUpdate(cad);      return resp ==0 ? false : true ;      } public boolean updatepacking( packingForm entity ) throws SQLException {  String cad = " update packing set  " + " packempresa = " + ( entity.getpackempresa() == null ? "NULL": "'" + entity.getpackempresa() + "'" ) + "," + " packfecha = " + ( entity.getpackfecha() == null ? "NULL": "'" + entity.getpackfecha() + "'" ) + "," + " packobservaciones = " + ( entity.getpackobservaciones() == null ? "NULL": "'" + entity.getpackobservaciones() + "'" ) + "," + " packestado = " +( entity.getpackestado() == null ? "NULL": "'" + entity.getpackestado() + "'" ) + " where packcodsx = " +  entity.getpackcodsx() ;   int resp= db.executeUpdate(cad);      return resp ==0 ? false : true ;      }  public boolean eliminar(String packcodsx) throws SQLException {   String elim = " delete from packing where packcodsx = '"+ packcodsx+ "'"; int r = db.executeUpdate(elim) ; return  r==0? false : true ;  }   public packing getpacking(String packempresa, String packfecha) {	 String cad = "SELECT * FROM packing WHERE packempresa="+packempresa+ " and packfecha='" +  packfecha + "'" ;	 return (packing)getEntidad(cad);  } public Collection getlistapacking(String packempresa,String packestado,  String start, String param ) {	 start= start==null ? "0" :  start;  	 param= param==null ? "" :  param; 	String consulta = " SELECT * FROM packing where packempresa=" + packempresa + "  and packestado='" + packestado + "' " + 	 getTextoBusquedaResumen( param) + 	 " order by packcodsx desc  limit " + this.maxfilas  + " offset  " + (Integer.parseInt(start) * this.maxfilas); 	    return getLista(consulta); 	 }	 public int getTotalPaginaslistapacking(String packempresa, String packestado, String param) { 	 param= param==null ? "" :  param; 		String consulta = " SELECT * FROM packing where packempresa=" + packempresa + "  and packestado='" + packestado + "' " + 		getTextoBusquedaResumen( param);      		return getPaginas(consulta); 	 	}	 	 	 public Collection getlistapackingConSaldo(String packempresa, String start, String param ) {		 start= start==null ? "0" :  start;  		 param= param==null ? "" :  param; 				 String consulta = " select distinct packing.* from packing, packing_detalle, " +				" packing_detalle_posicion where packestado = 'FINALIZADO' and packempresa = "+ packempresa +  				" and packcodsx = packdpacking and packppackingdet = packdcodsx and packpsaldo >0 " +				" and "+ 				getTextoBusquedaResumen( "packing", param) +				" order by packcodsx desc limit " + this.maxfilas  + " offset  " + (Integer.parseInt(start) * this.maxfilas);				    return getLista(consulta); 		 }		 public int getTotalPaginaslistapackingConSaldo(String packempresa, String param) { 		 param= param==null ? "" :  param; 		 String consulta = " select count(distinct packing.packcodsx) from packing, packing_detalle, " +			" packing_detalle_posicion where packestado = 'FINALIZADO' and packempresa = "+ packempresa +  			" and packcodsx = packdpacking and packppackingdet = packdcodsx and packpsaldo >0 " +			" and " +			getTextoBusquedaResumen( "packing",  param);			return getPaginas(consulta); 		 	}	 	 public boolean tienePicking(String packcodsx){		 String cad= "select count(1) from picking where pickcodpacking=" + packcodsx;		 int resp = getConteo(cad);		 return resp!=0;	 }	 	 	 public boolean descomprometerSaldo(String packpcodsx) {		 String cad = "select descomprometer_packing(" + packpcodsx +")";		 int resp = getConteo(cad);		 return resp==1;	 }	 	 	 public BigDecimal getSaldoReservadoPacking(String procodsx) {		 String consulta = "select sum(packpsaldo) from packing, packing_detalle, packing_detalle_posicion where " +		 	" packcodsx = packdpacking and packdcodsx = packppackingdet and packdproducto=" + procodsx;		String resp = getCampo(consulta); 		return resp==null || resp.equals("") ? BigDecimal.ZERO : new BigDecimal(resp);	 }	 	 public Collection getlistapacking(String packempresa ,String start, String param ) {		 start= start==null ? "0" :  start;  		 param= param==null ? "" :  param; 		String consulta = " SELECT * FROM packing where packempresa= " + packempresa + " and " + 		getTextoBusquedaResumen(param) +		 " order by packcodsx desc  limit " + this.maxfilas  + " offset  " + (Integer.parseInt(start) * this.maxfilas); 		    return getLista(consulta); 		 }		 public int getTotalPaginaslistapacking(String packempresa , String param) { 		 param= param==null ? "" :  param; 		String consulta = " SELECT count(1) FROM packing where  packempresa= " + packempresa + " and " + 		getTextoBusquedaResumen(param);      return getPaginas(consulta); 		 	} } 