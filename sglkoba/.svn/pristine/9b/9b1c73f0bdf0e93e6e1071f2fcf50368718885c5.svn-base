package reportes.util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import pedido.control.gstpedido;
import pedido.entity.pedido;

import reportes.form.reportesForm;
import util.Fecha;

public class consolidado_descargas extends Command {

	 public void execute( String  ruta, HttpServletRequest request,  reportesForm repfor) { 
			
			String cad_params = getCadParams(repfor);	
			HashMap parametros = new HashMap();
			
			System.out.println("LLEGO AL JAVA");
			String[] pednumpedido = request.getParameterValues("pednumpedido");
			
			System.out.println("--" + pednumpedido );
			cad_params= "Fecha consulta:" + Fecha.getFecha() +".  PEDIDOS CONSULTADOS: ";
			String peds = "";
			int i=0;
			int hay =0;
			gstpedido gped = new gstpedido();
			while(pednumpedido!=null && i <pednumpedido.length ) {
				String p = pednumpedido[i]; 
				if(p !=null && !p.equals("")) { 	
					
					pedido pedi = gped.getpedido( repfor.getCompania(), p);
					if(pedi!=null) {
					hay++;
					cad_params += p +", ";
					peds  +=    (i==0 ?"": " or ") +  " pednumpedido =  '" +p +"'" ;
					}
					
				}		
				i++;
			}
			
			parametros.put("cad_params", cad_params);
			
			//ahora saco el reporte:
			
			File reporte = new File(  ruta + "reporte_consolidado_descargas.jasper");
			
			String sql = "select bodnombre, promodelo, prodescripcion, entposicion, sum(refpcantidad) , sum(refpcantidad) / prounimasterpac " +
				" from bodega, producto, entrada, referencia_pedido, pedido  where pedcompania =" + repfor.getCompania() + 
				" and	bodcodsx = entbodega and procodsx = entcodproducto and entcodsx = refpentrada and refpnumpedido = pedcodsx " +
				 ( hay!=0 ?  " and ( " + 
				peds +
				") " : " and pednumpedido=''" )+ 
				" group by bodnombre, promodelo, prodescripcion, entposicion, prounimasterpac "+
				" order by bodnombre, promodelo, entposicion";
			
			System.out.println(sql);
			parametros.put("sql", sql);
			
			request.setAttribute("parametros", parametros);
			request.setAttribute("reporte", reporte);
		}
}
