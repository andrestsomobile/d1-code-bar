package reportes.util;

import javax.servlet.http.HttpServletRequest;

import maestro.control.gstcausal;
import maestro.control.gstcompania;
import maestro.control.gstproducto;
import maestro.entity.producto;
import reportes.form.reportesForm;

/**
 * @author   palito
 */
public abstract class Command {
abstract public void execute(String ruta, HttpServletRequest request,  reportesForm repfor);
gstcompania gcomp = new gstcompania();
protected String getQuery(reportesForm repform, String reporte) {
	String resp = "";
	
	String cia_ini = repform.getCia_ini();
	String cia_fin = repform.getCia_fin();
	String fecha_ini = repform.getFecha_ini();
	String fecha_fin= repform.getFecha_fin();
	
	String cli_ini = repform.getCliente_ini();
	String cli_fin = repform.getCliente_fin();
	String ref_ini = repform.getRef_ini();
	String ref_fin = repform.getRef_fin(); 
	
	
	String embarque = repform.getEmbarque();
	String causal_devolucion = repform.getCausal_devolucion();
	
	String bodega = repform.getBodega();
	String posicion = repform.getPosicion();
	
		resp ="select * from " + reporte + " where " + 
        	  " comcodsx >=" + cia_ini + " and comcodsx <=" + cia_fin ;
		if(fecha_ini!=null && fecha_fin!=null)
			resp +="  and fecha >='" + fecha_ini + "' and fecha <='" + fecha_fin + "' ";
		
		if(ref_ini!=null && ref_fin!=null) {
        	 resp += (ref_ini.equals("")  ?"" : "and promodelo>='"  + ref_ini + "' " );
        	 resp += (ref_fin.equals("") ?  "" : " and promodelo <='" + ref_fin + "' " );
		}
		if(cli_ini!=null && cli_fin!=null) {
			  resp +=(cli_ini.equals("") ?"" : "and clicodsx>='"  + cli_ini + "' " );
			  resp +=(cli_fin.equals("") ?  "" : " and clicodsx <='" + cli_fin + "' " );
		}
		if(embarque!=null) {
			resp += embarque.equals("") ? " " : " and embarque like '%" + embarque + "%'";
		}
		if(causal_devolucion!=null) {
			resp += causal_devolucion.equals("TODOS") ? " " : " and causal=" + causal_devolucion;
		}
		if(bodega!=null) {
			resp += " and bodcodsx='" + bodega +"'";
		}
		if(posicion!=null) {
			if(!posicion.equals(""))
				resp += " and posicion='" + posicion +"'";
		}
	return resp;

}


protected String getCadParams(reportesForm repfor) {
	String cad_params = "";
	
	String cia_ini = repfor.getCia_ini();
	String cia_fin = repfor.getCia_fin();
		if(cia_ini!=null && cia_fin!=null) {
			cad_params = "Companias: " + repfor.getCia_ini() + " / " + repfor.getCia_fin();
			}
	
	String fecha_ini = repfor.getFecha_ini();
	String fecha_fin = repfor.getFecha_fin();
	
	if(fecha_ini!=null && fecha_fin!=null){
		cad_params +=" Fechas:" + repfor.getFecha_ini() + " / " + repfor.getFecha_fin();
	}

	String fecha= repfor.getFecha();
	if(fecha!=null){
		cad_params +=" Fecha Seleccionada:" + repfor.getFecha();
	}
	String ref_ini = repfor.getRef_ini();
	String ref_fin = repfor.getRef_fin();
	String cli_ini = repfor.getCliente_ini();
	String cli_fin = repfor.getCliente_fin();
	String embarque = repfor.getEmbarque();
	String causal_devolucion = repfor.getCausal_devolucion();
	
	String bodega = repfor.getBodega();
	String posicion = repfor.getPosicion();

	if(ref_ini!=null && ref_fin !=null && ref_ini.equals( ref_fin)  ) {
		if(ref_ini.equals("") && ref_ini.equals(ref_fin)) {
			cad_params +=", Referencias:";
			cad_params +=" TODOS";
		}else cad_params += ", Referencias:" + ref_ini + " / " + ref_fin;
	}
	
	if(cli_ini!=null && cli_fin !=null && cli_ini.equals( cli_fin)  ) {
		if(cli_ini.equals("") && cli_ini.equals(cli_fin)) {
			cad_params +=", Clientes:";
			cad_params +=" TODOS";
		}else cad_params += ", Clientes:" + cli_ini + " / " + cli_fin;
	}
	if(embarque!=null) {
		cad_params += embarque.equals("") ? ", Embarque: TODOS" : "Embarque:" + embarque;
	}
	
	if(causal_devolucion!=null) {
		cad_params += causal_devolucion.equals("TODOS") ? ", Causal de Devolucion: TODOS" : "Causal de Devolucion:" +  new gstcausal().getcausal(causal_devolucion).getcaudesc();
	}
	if(bodega!=null) {
		cad_params += ", bodega:'" + bodega +"'";
	}
	if(posicion!=null) {
		cad_params += " , posicion: '" + posicion +"'";
	}
	String mes = repfor.getMes();
	String ano = repfor.getAnno();
	String compania = repfor.getCompania();
	if(compania!=null) {
		maestro.entity.compania comp = gcomp.getcompania(compania);
		cad_params +="  COMPANIA:" + compania + " (" +  ( comp==null ?"NO EXISTE" : comp.getcomnombre() ) +")"; 
	}
	if(mes!=null) {
		cad_params +=", Mes:" + mes;
	}
	if(ano!=null) {
		cad_params +=" , Anno:" + ano;
	}

	String hit = repfor.getHit();
	if(hit!=null) {
		cad_params += " Causal HIT:" + hit;
	}
	String zona = repfor.getZona();
	if(zona!=null) {
		cad_params += " Zona:" + zona;
	}
	String cliente = repfor.getCliente();
	if(cliente!=null) {
		cad_params += " Cliente:" + cliente;
	}
	String referencia = repfor.getReferencia();
	if(referencia!=null) {
		producto prod = new gstproducto().getproductoByUk( compania, referencia);
		cad_params += " Referencia:" + ( prod==null ? referencia : prod.getpromodelo() + " - " + prod.getprodescripcion());
	}
	return cad_params;
}

}
