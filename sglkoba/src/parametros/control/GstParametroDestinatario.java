package parametros.control;

import db.GstTabla;
import db.beanConnector;
import parametros.entity.ParametroDestinatario;

public class GstParametroDestinatario extends GstTabla {
	public GstParametroDestinatario() {
		db = new beanConnector();
		this.classEntidad = ParametroDestinatario.class;
	}

	public GstParametroDestinatario(beanConnector db) {
		this.db = db;
		this.classEntidad = ParametroDestinatario.class;
	}

	public ParametroDestinatario getParametroDestinatario(String funcionalidad) {

		String consulta = " SELECT * FROM parametro_destinatario WHERE tipo_funcionalidad = '" + funcionalidad + "'";
		return (ParametroDestinatario) getEntidad(consulta);
	}
	
	public ParametroDestinatario getParametroDestinatarioTransportadora(String funcionalidad, String transportadora) {

		String consulta = " SELECT * FROM parametro_destinatario WHERE tipo_funcionalidad = '" + funcionalidad + "' AND transportadora = '" + transportadora + "'";
		System.out.println(consulta);
		return (ParametroDestinatario) getEntidad(consulta);
	}

}
