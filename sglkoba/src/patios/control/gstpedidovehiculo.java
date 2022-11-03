package patios.control;

import java.sql.SQLException;
import java.util.Collection;
import patios.entity.pedidovehiculo;
import patios.form.pedidovehiculoForm;
import db.GstTabla;
import db.beanConnector;

public class gstpedidovehiculo extends GstTabla {

	public gstpedidovehiculo() { 
		 db= new beanConnector(); 
		 this.classEntidad =pedidovehiculo.class; 
		}

	public gstpedidovehiculo(beanConnector db) { 
		 this.db= db; 
		 this.classEntidad =pedidovehiculo.class; 
	}
	
	public Collection getlistapedidovehiculo() {
		String consulta = " SELECT * FROM pedidovehiculo";
		return getLista(consulta); 
	} 
	
	public Collection getlistapedidovehiculo(String start, String param) {
		start = start == null ? "0" : start;
		param = param == null ? "" : param;
		String consulta = " SELECT * FROM pedidovehiculo where" +
		getTextoBusquedaResumen(param) +		
		" order by pvcodsx desc"+
		"  limit " + this.maxfilas + " offset  "
		+ (Integer.parseInt(start) * this.maxfilas);
		return getLista(consulta);
	}

	public int getTotalPaginaslistapedidovehiculo(String param) {
		param = param == null ? "" : param;
		String consulta = " SELECT count(1) FROM pedidovehiculo where  " +
		getTextoBusquedaResumen(param);
		return getPaginas(consulta);
	}

	public int crearpedidovehiculo(String pvfecha, String pvcodcia, String pvnumeropedido, String pvcodcliente, String pvcodciudaddestino, String pvdireccion, String pvestado) throws SQLException {
		String insert = "INSERT INTO pedidovehiculo (pvcodsx, pvfecha, pvcodcia, pvnumeropedido, pvcodcliente, pvcodciudaddestino, pvdireccion, pvestado) VALUES (default,"		
		+ (pvfecha == null ? "NULL" : "'" + pvfecha + "'") + ","
		+ (pvcodcia == null ? "NULL" : "'" + pvcodcia + "'") + ","
		+ (pvnumeropedido == null ? "NULL" : "'" + pvnumeropedido + "'") + ","
		+ (pvcodcliente == null ? "NULL" : "'" + pvcodcliente + "'") + ","
		+ (pvcodciudaddestino == null ? "NULL" : "'" + pvcodciudaddestino + "'") + ","
		+ (pvdireccion == null ? "NULL" : "'" + pvdireccion + "'") + ","
		+ (pvestado == null ? "NULL" : "'" + pvestado + "'") + ") RETURNING pvcodsx";
		return getConteo(insert);
	}

	public pedidovehiculo getpedidovehiculo(String pvcodsx) {
		String cad = "SELECT * FROM pedidovehiculo WHERE pvcodsx='" + pvcodsx + "'";
		return (pedidovehiculo) getEntidad(cad);
	}

	public boolean updatepedidovehiculo(pedidovehiculo entity) throws SQLException {
		String cad = " update pedidovehiculo set "
			+ " pvfecha = " + (entity.getPvfecha() == null ? "NULL" : "'" + entity.getPvfecha() + "'") + ","
			+ " pvcodcia = " + (entity.getPvcodcia() == null ? "NULL" : "'" + entity.getPvcodcia() + "'") + ","
			+ " pvnumeropedido = " + (entity.getPvnumeropedido() == null ? "NULL" : "'" + entity.getPvnumeropedido() + "'") + ","
			+ " pvcodcliente = " + (entity.getPvcodcliente() == null ? "NULL" : "'" + entity.getPvcodcliente() + "'") + ","
			+ " pvcodciudaddestino = " + (entity.getPvcodciudaddestino() == null ? "NULL" : "'" + entity.getPvcodciudaddestino() + "'") + ","
			+ " pvdireccion = " + (entity.getPvdireccion() == null ? "NULL" : "'" + entity.getPvdireccion() + "'") + ","
			+ " pvestado = " + (entity.getPvestado() == null ? "NULL" : "'" + entity.getPvestado() + "'") 
			+ " where pvcodsx = " + entity.getPvcodsx();
			int resp = db.executeUpdate(cad);
			return resp == 0 ? false : true;
	}

	public boolean updatepedidovehiculo(pedidovehiculoForm entity) throws SQLException {
		String cad = " update pedidovehiculo set  "
			+ " pvfecha = " + (entity.getPvfecha() == null ? "NULL" : "'" + entity.getPvfecha() + "'") + ","
			+ " pvcodcia = " + (entity.getPvcodcia() == null ? "NULL" : "'" + entity.getPvcodcia() + "'") + ","
			+ " pvnumeropedido = " + (entity.getPvnumeropedido() == null ? "NULL" : "'" + entity.getPvnumeropedido() + "'") + ","
			+ " pvcodcliente = " + (entity.getPvcodcliente() == null ? "NULL" : "'" + entity.getPvcodcliente() + "'") + ","
			+ " pvcodciudaddestino = " + (entity.getPvcodciudaddestino() == null ? "NULL" : "'" + entity.getPvcodciudaddestino() + "'") + ","
			+ " pvdireccion = " + (entity.getPvdireccion() == null ? "NULL" : "'" + entity.getPvdireccion() + "'") + ","
			+ " pvestado = " + (entity.getPvestado() == null ? "NULL" : "'" + entity.getPvestado() + "'") 
			+ " where pvcodsx = " + entity.getPvcodsx();
			int resp = db.executeUpdate(cad);
			return resp == 0 ? false : true;
	}

	public boolean eliminar(String pvcodsx) throws SQLException {
		String elim = " delete from pedidovehiculo where pvcodsx = '" + pvcodsx + "'";
		int r = db.executeUpdate(elim);
			return r == 0 ? false : true;
	}
	
	public int getTotalUnidades(String pvcodsx) {
		String cad = "SELECT count(1) FROM detallepedidovehiculo WHERE dpvcodpedido = " + pvcodsx;
		return getConteo(cad);
	}
	
    public Collection getlistapedidovehiculo_despachar(String dvcodsx, String start, String param) {
        start = start == null ? "0" : start;
        param = param == null ? "" : param;

        String consulta = " select * from pedidovehiculo where pvestado='FINALIZADO' and " + getTextoBusquedaResumen("pedidovehiculo", param)
                + " order by pvcodsx desc " + "  limit " + this.maxfilas + " offset  " + (Integer.parseInt(start) * this.maxfilas);
        return getLista(consulta);
    
        
    }

    public int getTotalPaginaslistapedido_despachar(String dvcodsx, String param) {
        param = param == null ? "" : param;
        String consulta = " select count(1) from pedidovehiculo where pvestado='FINALIZADO' and " + getTextoBusquedaResumen("pedidovehiculo", param);
        return getPaginas(consulta);

    }
}
