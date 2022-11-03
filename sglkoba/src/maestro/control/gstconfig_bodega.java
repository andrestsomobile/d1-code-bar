package maestro.control;

import java.util.Collection;

import db.GstTabla;
import db.beanConnector;
import maestro.entity.config_bodega;

public class gstconfig_bodega extends GstTabla {

	public gstconfig_bodega() {
		db = new beanConnector();
		this.classEntidad = config_bodega.class;
	}

	public gstconfig_bodega(beanConnector db) {
		this.db = db;
		this.classEntidad = config_bodega.class;
	}

	public Collection getlistaconfig_bodega() {
		String consulta = " SELECT * FROM config_bodega";
		return getLista(consulta);
	}
	
	public Collection getlistaconfig_bodega_posicion_vacia(String cbbodega) {
		String consulta = " SELECT cbbodega, cbestante, cbnivel, cbestante||cbposicion||cbfrente_pos as cbposicion, cbestado, cbentrada, cbcategoria, cbfrente_pos FROM config_bodega "
				+ " where cbbodega = " + cbbodega 
				+ " and cbestado = 'AC' "
				+ " and cbentrada is null "
				+ " order by cbestante, cbnivel, cbposicion";
		return getLista(consulta);
	}
	
	public boolean es_tunel(String bodega, String posicion) {
		String cad = "select * from movimiento.es_tunel(" + bodega + ",'" + posicion + "')";
		String res = getCampo(cad);
		return res != null && res.equals("1") ? true : false;
	}
	
	public boolean es_posicion_valida(String bodega, String posicion) {
		String cad = "select * from movimiento.valida_posicion_en_bodega(" + bodega + ",'" + posicion + "')";
		String res = getCampo(cad);
		return res != null && res.equals("1") ? true : false;
	}
	
	/*public Collection getMapa() {
		String consulta = "SELECT substring(estante,1,1)::text as estanteria, substring(estante,3,1)::int as nivel,*\r\n" + 
				"FROM crosstab_mapa('select cbestante||''-''||cbnivel, cbnivel::text,case when cbestado=''AC'' then cbposicion else ''XX-X'' end::text from config_bodega where cbnivel = substring(cbposicion,4,1)::int order by cbestante,cbnivel,cbposicion');";
		return getListaDeListas(consulta);
	}*/
	
	public Collection getMapa(String bodega, String estanteria) {
		String consulta = "SELECT substring(estante,1,1)::text as estanteria, substring(estante,3,1)::int as nivel,*\r\n" + 
				"FROM crosstab_mapa('select cbestante||''-''||cbnivel, cbnivel::text,case when cbestado=''AC'' then cbposicion else ''TUNEL/VIGA'' end::text from config_bodega where cbbodega = " + bodega + " and cbnivel = RIGHT(cbposicion,1)::int and cbestante = ''" + estanteria + "'' order by cbestante,cbnivel,cbposicion');";
		return getListaDeListas(consulta);
	}
	
	public String getMaterial(String estanteria, String nivel, String posicion) {
		String consulta = "select coalesce(cbproducto,'SIN DEFINIR') from config_bodega where cbestante= '" + estanteria + "' and cbnivel = " + nivel + " and cbposicion = '" + posicion + "'";
		return getCampo(consulta);
	}
	
	public Collection getPosicionesQR(String bodega,String estanteria) {
		String consulta = "select cbestante||cbposicion" + 
				" from config_bodega" + 
				" where cbbodega = '" + bodega + "'" +
				" and cbestante = '" + estanteria + "'" +
				" and cbestado = 'AC'" + 
				" order by cbestante, cbnivel, cbposicion";
		return getListaDeListas(consulta);
	}	

}
