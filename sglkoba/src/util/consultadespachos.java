package util;

import java.util.Collection;

import db.GstTabla;
import db.beanConnector;


public class consultadespachos extends GstTabla {

	public consultadespachos() {
		db = new beanConnector();
	}

	public consultadespachos(beanConnector db) {
		this.db = db;
	}

	public Collection getListaDespachos() {
		String consulta = "select despcodsx,comnombre,despfecha,transpnombre,despplaca,desptipoveh " +
				"from despacho " + 
				"inner join compania on comcodsx = despempresa " +
				"inner join transportadora on transpcodsx = desptransportadora " +
				"where despestado = 'TRAMITE' " +
				"order by despcodsx";
		return getListaDeListas(consulta);
	} 

	public Collection getListaPedidos(String despcodsx) {
		String consulta = "select pedcodsx, pednumpedido,pedguia, clinombre, peddireccion, ciunombre, depnombre, despedpesobruto, despedbultos, sum(prokilovolumen *  refdcant) as kv, empnombre, rpdeterminado " +
				"from despacho " + 
				"inner join despacho_pedido on despeddespacho = despcodsx " +
				"inner join pedido on pedcodsx = despedpedido " +
				"inner join cliente on clicodsx = pedcliente " +
				"inner join ciudad on ciucodigo = pedciudad " +
				"inner join departamento on depcodigo = peddepartamento " +
				"inner join referencia_despacho on refddespacho_pedido = despedcodsx " +
				"inner join producto on procodsx = refdproducto " +
				"left join registro_pedido_detalle on rpdenumpedido = pedcodsx " +
				"left join registro_pedido on repecodsx = rpderegped " +
				"left join empleado on empcodsx = repeempleado " +
				"where despcodsx = " + despcodsx + " " +
				"group by pedcodsx, pednumpedido,pedguia, clinombre, peddireccion, ciunombre, depnombre, despedpesobruto, despedbultos, empnombre, rpdeterminado " +
				"order by pedguia";
		return getListaDeListas(consulta);
	}
} 