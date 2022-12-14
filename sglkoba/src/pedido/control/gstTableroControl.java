package pedido.control;

import java.sql.SQLException;
import java.util.Collection;

import maestro.entity.transportadora;
import db.GstTabla;
import db.beanConnector;

public class gstTableroControl extends GstTabla  {
	
    public gstTableroControl() {
        db = new beanConnector();
    }

    public gstTableroControl(beanConnector db) {
        this.db = db;
    }
    
	public Collection pendientes_despacho(String codigoTransp) {
		String cond = codigoTransp != null && !codigoTransp.equals("0") && !codigoTransp.equals("") && !codigoTransp.equals("null")? " and transpcodsx = " + codigoTransp + " " : "";
		String consulta = "select "
			+ "transpnombre, ciunombre, clinombre, pedguia, pednumpedido, pedobservaciones, "
			+ "case when rpdecodsx is null then 'PENDIENTE' else empnombre end as alistamiento, "
			+ "case when rpdecodsx is null then 'PENDIENTE' else ( case when rpdeterminado = 'N' then 'EN ALISTAMIENTO' else 'LISTO PARA CARGUE' end ) end as estado, "
			+ "round(sum(refpcantidad)) as un, round(sum(refpcantidad/prounimasterpac) )as mp, round(sum(prokilovolumen*refpcantidad)) as kv, round(sum(refppesobrutototal)) as pb, coalesce(pcannumcarga,0) as carga "
			+ "from pedido "
			+ "inner join cliente on pedcliente=clicodsx "
			+ "inner join ciudad on ciucodigo=pedciudad||'' "
			+ "inner join transportadora on pedtransportadora=transpcodsx "  
			+ "inner join referencia_pedido on refpnumpedido = pedcodsx "
			+ "inner join entrada on entcodsx = refpentrada "
			+ "inner join producto on procodsx = refpproducto " 	 
			+ "left join despacho_pedido on despedpedido = pedcodsx "
			+ "left join registro_pedido_detalle on rpdenumpedido = pedcodsx "
			+ "left join registro_pedido on repecodsx = rpderegped "
			+ "left join empleado on empcodsx = repeempleado "
			+ "left join pedido_carga on pcanumpedido = pednumpedido "
			+ "where pedcompania IN (1,203) " 
			+ "and pedestado='FINALIZADO' "  
			+ "and pedfechasistema between now()- interval '7 days' and now() " 
			+ "and despedcodsx is null "
			+ cond
			+ "group by transpnombre, ciunombre, clinombre, pedguia, pednumpedido, pedobservaciones, pedestado, empnombre, rpdecodsx, rpdeterminado, pcannumcarga "
			+ "order by transpnombre, ciunombre, clinombre, pedguia, pednumpedido ";

		return getListaDeListas(consulta);
	}
	
	public Collection transp_pendientes_despacho() {
		String consulta = "select distinct transportadora.* "
			+ "from pedido "	 
			+ "inner join transportadora on pedtransportadora=transpcodsx "  
			+ "left join despacho_pedido on despedpedido = pedcodsx "
			+ "where pedcompania IN (1,203) " 
			+ "and pedestado='FINALIZADO' "  
			+ "and pedfechasistema between now()- interval '7 days' and now() " 
			+ "and despedcodsx is null "
			+ "order by transpnombre";
		this.classEntidad = transportadora.class;
		return getLista(consulta);
	}
	
	public int total_kv(String codigoTransp) {
		String consulta = "select "
			+ "round(sum(prokilovolumen*refpcantidad)) as kv "
			+ "from pedido "
			+ "inner join referencia_pedido on refpnumpedido = pedcodsx "
			+ "inner join entrada on entcodsx = refpentrada "
			+ "inner join producto on procodsx = refpproducto " 	 
			+ "left join despacho_pedido on despedpedido = pedcodsx "
			+ "where pedcompania IN (1,203) " 
			+ "and pedestado='FINALIZADO' "  
			+ "and pedfechasistema between now()- interval '7 days' and now() " 
			+ "and despedcodsx is null "
			+ "and pedtransportadora = " + codigoTransp;
		return getConteo(consulta);
	}
	
	public int total_kvc(String codigoTransp) {
		String consulta = "select "
			+ "round(sum(prokilovolumen*refpcantidad)) as kvc "
			+ "from pedido "
			+ "inner join referencia_pedido on refpnumpedido = pedcodsx "
			+ "inner join entrada on entcodsx = refpentrada "
			+ "inner join producto on procodsx = refpproducto " 	 
			+ "left join despacho_pedido on despedpedido = pedcodsx "
			+ "inner join pedido_carga on pcanumpedido = pednumpedido "
			+ "where pedcompania IN (1,203) " 
			+ "and pedestado='FINALIZADO' "  
			+ "and pedfechasistema between now()- interval '7 days' and now() " 
			+ "and despedcodsx is null "
			+ "and pedtransportadora = " + codigoTransp;
		return getConteo(consulta);
	}
	
	public Collection originalpendientes_despacho() {
		String consulta = "select pedfechasistema, pednumpedido,pedguia, pedfactura, " +
		 "clinombre,ciunombre, transpnombre, pedobservaciones " +
		 "from pedido, cliente, ciudad, transportadora   " +
		 "where ciucodigo=pedciudad  " +
		 "and pedcliente=clicodsx  " +
		 "and pedtransportadora=transpcodsx  " +
		 "and pedcodsx in (select distinct pedcodsx    " +              
		 "from pedido, referencia_pedido       " +         
		 "where pedcompania IN (1,203) and pedestado='FINALIZADO'  " +
		 "and pedfechasistema between now()- interval '7 days' and now() " + 
		 "and pedcodsx = refpnumpedido " +
		 "and pedcodsx not in (select despedpedido from despacho_pedido)    " +
		 "group by pedcodsx having sum(refpsaldo)>0  )   " +
		 "order by pednumpedido desc " ;
		return getListaDeListas(consulta);
	}
	
	public Collection tab_control_resumen() {
		String consulta = "select '[\"Pedidos En Tramite\",' ||count(1) ||', \"#DC143C\"]' from pedido where pedfechasistema >= current_date and pedestado = 'TRAMITE'"
			+ " union"
			+ " select '[\"Pedidos Finalizados\",' ||count(1) ||', \"#8B4513\"]' from pedido where pedfechasistema >= current_date and pedestado = 'FINALIZADO'"
			+ " union "
			+ " select '[\"Despachos En Tramite\",' ||count(1) ||', \"#FFA500\"]' from despacho where despfecha >= current_date and despestado = 'TRAMITE'"
			+ " union"
			+ " select '[\"Despachos Finalizados\",' ||count(1) ||', \"#7FFF00\"]' from despacho where despfecha >= current_date and despestado = 'FINALIZADO'"
			+ " union"
			+ " select '[\"Pedidos Despachados\",' ||count(1) ||', \"#2E8B57\"]' as cantidad from pedido "
			+ " inner join despacho_pedido on despedpedido = pedcodsx "
			+ " inner join despacho on despcodsx = despeddespacho and despestado = 'FINALIZADO'"
			+ " where pedfechasistema >= current_date and pedestado = 'FINALIZADO'"
			+ " union"
			+ " select '[\"Pedidos en Alistamiento\",' ||count(1) ||', \"#F4A460\"]' from pedido "
			+ " inner join despacho_pedido on despedpedido = pedcodsx "
			+ " inner join despacho on despcodsx = despeddespacho and despestado = 'TRAMITE'"
			+ " where pedfechasistema >= current_date and pedestado = 'FINALIZADO'";
		return getListaDeListas(consulta);
	}
	
	public Collection pendientes_despacho_ind_transportadora() {
		String consulta = "select transpnombre, " +
				 "sum(refpcantidad) as ud, sum(refpcantidad*prounimasterpac) as mp, sum(refpcantidad*prokilovolumen) as kv, sum(refpcantidad*refpvalortotal) as vr " + 
				 "from pedido, referencia_pedido, producto, transportadora   " +
				 "where refpnumpedido=pedcodsx  " +
				 "and refpproducto=procodsx  " +
				 "and pedtransportadora=transpcodsx  " +
				 "and pedcodsx in (select distinct pedcodsx " +             
				 "from pedido, referencia_pedido  " +              
				 "where pedcompania IN (1,203) and pedestado='FINALIZADO' " +
				 "and pedfechasistema between now()- interval '7 days' and now()  " +
				 "and pedcodsx = refpnumpedido " +  
				 "and pedcodsx not in (select despedpedido from despacho_pedido) " +    
				 "group by pedcodsx having sum(refpsaldo)>0  )  " + 
				 "group by transpnombre " +
				 "order by transpnombre desc " ;
		return getListaDeListas(consulta);
	}
	
	public Collection pendientes_despacho_ind_ciudad() {
		String consulta = "select ciunombre, " +
				 "sum(refpcantidad) as ud, sum(refpcantidad*prounimasterpac) as mp, sum(refpcantidad*prokilovolumen) as kv, sum(refpcantidad*refpvalortotal) as vr " + 
				 "from pedido, referencia_pedido, producto, ciudad " +
				 "where refpnumpedido=pedcodsx " +
				 "and refpproducto=procodsx " +
				 "and ciucodigo=pedciudad " +
				 "and pedcodsx in (select distinct pedcodsx " +             
				 "from pedido, referencia_pedido  " +              
				 "where pedcompania IN (1,203) and pedestado='FINALIZADO' " +
				 "and pedfechasistema between now()- interval '7 days' and now() " +
				 "and pedcodsx = refpnumpedido " +  
				 "and pedcodsx not in (select despedpedido from despacho_pedido) " +    
				 "group by pedcodsx having sum(refpsaldo)>0  )  " + 
				 "group by ciunombre " +
				 "order by ciunombre desc " ;
		return getListaDeListas(consulta);
	}
	
	public Collection pendientes_despacho_detallado() {
		String consulta = "select pedfechasistema, pednumpedido,pedguia, pedfactura, promodelo, " +
		 "refpcantidad, prokilovolumen, prounimasterpac,refpvalortotal , pedsubtotal ,  " +
		 "clinombre,ciunombre, transpnombre, pedobservaciones, prokiloreal  " +
		 "from pedido, referencia_pedido, producto, cliente, ciudad, transportadora   " +
		 "where refpnumpedido=pedcodsx  " +
		 "and refpproducto=procodsx  " +
		 "and ciucodigo=pedciudad  " +
		 "and pedcliente=clicodsx  " +
		 "and pedtransportadora=transpcodsx  " +
		 "and  pedcodsx in (select distinct pedcodsx    " +              
		 "from pedido, referencia_pedido       " +         
		 "where pedcompania IN (1,203) and pedestado='FINALIZADO'  " +
		 "and pedfechasistema between now()- interval '7 days' and now() " + 
		 "and pedcodsx = refpnumpedido " +
		 "and pedcodsx not in (select despedpedido from despacho_pedido)    " +
		 "group by pedcodsx having sum(refpsaldo)>0  )   " +
		 "order by pednumpedido desc " ;
		return getListaDeListas(consulta);
	}

	public Collection pedidos_en_alistamiento(String codempleado) {
		String consulta = "SELECT rpdecodsx, pednumpedido, empnombre,repefecha,pedfechasistema " +
				"FROM registro_pedido_detalle " +
				"inner join registro_pedido on repecodsx = rpderegped and repeesta = 'TRAMITE' and rpdeterminado = 'N' " +
				"inner join empleado on empcodsx = repeempleado and empcedula like '%" + codempleado + "%' " +
				"inner join pedido on pedcodsx = rpdenumpedido " +
				"order by rpdecodsx";
		return getListaDeListas(consulta);
	}
	
	public int existe_pedido_en_alistamiento(String codsxempleado,String pedcodsx) {
		String consulta = "select count(1) from registro_pedido_detalle " 
						+ "inner join registro_pedido on repecodsx = rpderegped " 
						+ "and rpdenumpedido = " + (pedcodsx == null ? "NULL" : "'" + pedcodsx + "' ");
						//+ "and repeempleado = " + (codsxempleado == null ? "NULL" : "'" + codsxempleado + "'");
		return getConteo(consulta);
	}
	
	//+ " AND rpderegped = repecodsx";
	public boolean finalizarDetalleAlistamiento(String rpdecodsx) throws SQLException {
		boolean r = false;
		String cad = "UPDATE registro_pedido_detalle set rpdeterminado = 'S', rpdetire = CURRENT_TIME-repehoin FROM registro_pedido "
					+ " WHERE rpdecodsx = " + (rpdecodsx == null ? "NULL" : "'" + rpdecodsx + "'");

			int resp = db.executeUpdate(cad);
			if (resp == 0)
				r = false;
			else
				r = true; 
		return r;
	}
	
	public Collection pedidos_listos_cargue() {
		String consulta = "select pedcompania, comnombre, rpdecodsx, pednumpedido, pedguia, empnombre, repefecha, pedfechasistema, pedcodsx " +
				"FROM registro_pedido_detalle " +
				"inner join registro_pedido on repecodsx = rpderegped and repefecha >= current_date - interval '30 days' and rpdeterminado = 'S' " +
				"inner join empleado on empcodsx = repeempleado " + 
				"inner join pedido on pedcodsx = rpdenumpedido " +
				"inner join compania on comcodsx = pedcompania and pedcompania IN (1,203) " +
				"left join despacho_pedido on despedpedido = pedcodsx " +
				"where despedpedido is null " +
				"order by pedfechasistema desc, pednumpedido asc ";
		return getListaDeListas(consulta);
	}
	
	public Collection lista_placas(String codcia) {
		String consulta = "SELECT despcodsx,despplaca " 
				+"FROM despacho " 
				+"WHERE despestado = 'TRAMITE' AND despempresa = " 
				+ (codcia == null ? "NULL" : "'" + codcia + "' ")
				+"order by despplaca asc ";
		return getListaDeListas(consulta);
	}
	
	public int crea_registro_pedido(String codsxempleado) throws SQLException {
		String insert = "INSERT INTO registro_pedido (repecodsx, repefecha, repeempleado, repehoin, repehofi, repecanped, repeesta) VALUES ("
				+ " (SELECT coalesce(max(repecodsx),0)+1 FROM registro_pedido), CURRENT_DATE,"
				+ (codsxempleado == null ? "NULL" : "'" + codsxempleado + "'") + ",CURRENT_TIME,'00:00:00','0','TRAMITE')" 
			+ " RETURNING repecodsx";
		return getConteo(insert);
	}
	
	public int crea_registro_pedido_detalle(String repecodsx, String pedcodsx) throws SQLException {
		String insert = "INSERT INTO registro_pedido_detalle (rpdecodsx, rpderegped, rpdenumpedido, rpdetire, rpdeterminado) VALUES ("
				+ " (SELECT coalesce(max(rpdecodsx),0)+1 FROM registro_pedido_detalle),"
				+ (repecodsx == null ? "NULL" : "'" + repecodsx + "',") 
				+ (pedcodsx == null ? "NULL" : "'" + pedcodsx + "',") 
				+ "'00:00:00','N')" 
				+ " RETURNING rpdecodsx";
		return getConteo(insert);
	}
	
	public Collection lista_despachos_kv() {
		String consulta = "select despcodsx, coalesce(despplaca,'Sin Definir') as despplaca, coalesce(despnombrecond,'Sin Definir') as despnombrecond, coalesce(transpnombre,'Sin Definir') as transpnombre, despestado, " +
				"to_char(coalesce(sum(despedvalor),0),'999G999G999G999D99') as valor, to_char(coalesce(sum(despedpesobruto),0),'999G999G999G999D99') as pesobruto , " +
				"to_char(coalesce(sum(despedbultos),0),'999G999G999G999D99') as bultos , to_char(round(coalesce(sum(kv),0)),'999G999G999G999D99') as kilovolumen, " +
				"case when coalesce(vehcapacidad,round(sum(kv)),0) = 0 then 0 else round( (sum(kv)*100)/coalesce(vehcapacidad,sum(kv),0) ) end as kv_cargado, " + 
				"coalesce(vehcapacidad,round(sum(kv)),0) as kv_total " +
				"from despacho " +
				"inner join compania on comcodsx = despempresa and despempresa IN (1,203) " +
				"left join despacho_pedido on despeddespacho  = despcodsx " +
				"left join pedido on pedcodsx = despedpedido " +
				"left join transportadora on transpcodsx = desptransportadora " +
				"left join ( select refddespacho_pedido, sum(prokilovolumen *  refdcant) as kv from referencia_despacho inner join producto on  procodsx = refdproducto group by refddespacho_pedido ) as rf on rf.refddespacho_pedido = despedcodsx " +
				"left join vehiculo on vehplaca = despplaca " +
				"where despfecha >= current_date " +
				"group by despcodsx, despplaca, despnombrecond, transpnombre, despestado, vehcapacidad " +
				"order by despestado desc, despcodsx desc";
		return getListaDeListas(consulta);
	}


	public int actualiza_vehiculo(String placa,String capacidad) {
		String consulta = "select * from actualiza_vehiculo(" + (placa == null ? "NULL" : "'" + placa + "', ")
						+ (capacidad == null ? "0" : capacidad + ")");
		return getConteo(consulta);
	}
	
	public int crea_pedido_carga(String numpedido) throws SQLException {
		String insert = "INSERT INTO pedido_carga (pcanumpedido, pcannumcarga) VALUES ("
				+ (numpedido == null ? "NULL" : "'" + numpedido + "',") 
				+ "1)" ;
		//int cont = getConteo(insert);
		int cont = db.executeUpdate(insert);
		if (cont == 0) {
			boolean r = false;
			String cad = "UPDATE pedido_carga set pcannumcarga = pcannumcarga + 1"
						+ " WHERE pcanumpedido = " + (numpedido == null ? "NULL" : "'" + numpedido + "'");
			 cont = db.executeUpdate(cad);
		}
		return cont;
	}
	
	public int get_pedido_carga(String numpedido) {
		String consulta = "SELECT coalesce(pcannumcarga,0) as cant from pedido_carga WHERE pcanumpedido = " + (numpedido == null ? "NULL" : "'" + numpedido + "'");
		return getConteo(consulta);
	}
}
