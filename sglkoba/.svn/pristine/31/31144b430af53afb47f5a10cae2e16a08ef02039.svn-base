package sap.control;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import administracion.entity.usuario;
import ingreso.control.gstfactura_trafico;
import ingreso.control.gstreferencia_trafico;
import ingreso.control.gsttrafico;
import ingreso.entity.factura_trafico;
import ingreso.entity.referencia_trafico;
import ingreso.entity.trafico;
import maestro.control.gstproducto;
import maestro.entity.producto;
import sap.control.gstsapinterface944.ResumenHolder944;
import sap.entity.interface943;
import util.Fecha;
import util.Math;

public class gstsapinterface943 {
	
	String trafcodsx = ""; //Codigo del trafico al qeu se debe cargar la informacion	
	
	public static int ERROR943NOTRAFICO  = 1;	
	public static int ERROR943NOFACURA   = 2;
	public static int ERROR943NOPRODUCTO = 3;
	
	public static int ERROR943NOCONOCIDO = 999;
	
	//Parametros para guardar
	private String rutaArchivo 		= "";
	private String contenidoArchivo = "";
	
	private HttpSession session;

	public gstsapinterface943(){
		
	}

	
	public gstsapresultadoimportacion importarInformacion(ArrayList<String[]> dataRaw) {
		
		gstsapresultadoimportacion resultado = new gstsapresultadoimportacion();
		String ordenPedido = "";
		String i943codigoArchivo = "";
		
		trafico trafico                           = null;
		factura_trafico factura                   = null;
		ArrayList<ItemReferenciaHolder> productos = new ArrayList<ItemReferenciaHolder>();
		
		gsttrafico controltrafico = new gsttrafico();
		
		// validaciones Del trafico
		if (trafcodsx.equals("") || trafcodsx == null) {
			resultado.setSuccess(false);
			resultado.setCodigoError(ERROR943NOTRAFICO);
			resultado.setMensajeError("No existe el tráfico");
			return resultado;			
		} else {
			// cargo los datos del trafico			
			trafico = controltrafico.gettrafico(trafcodsx);
			if(trafico == null){
				resultado.setSuccess(false);
				resultado.setCodigoError(ERROR943NOTRAFICO);
				resultado.setMensajeError("No existe el tráfico");
				return resultado;
			}
		}
		
		//factura
		gstfactura_trafico gstft = new gstfactura_trafico();
		factura                  = gstft.getfactura_trafico("TEMPORAL",trafcodsx);		
		if (factura == null) {
			try {
				if(gstft.crearfactura_trafico("TEMPORAL", trafcodsx)){
					factura = gstft.getfactura_trafico("TEMPORAL",trafcodsx);
					if(factura == null){
						resultado.setSuccess(false);
						resultado.setCodigoError(ERROR943NOFACURA);
						resultado.setMensajeError("No existe la factura");
						return resultado;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		
		//Productos
		gstproducto gstproducto = new gstproducto();		
		for(String[] fila : dataRaw){
			if(fila[0].equals("ST")){
				i943codigoArchivo = fila[2];
			}else if(fila[0].equals("W06")){
				ordenPedido = fila[6];
			}else if(fila[0].equals("W04")){								
				String unidadesRaw       = fila[1];
				String codigoProductoRaw = fila[5];
				String precioUnidadRaw   = fila[7];							
				producto producto        = null;							
				producto = gstproducto.getproductoByUk(trafico.gettrafcompania(),codigoProductoRaw);				
				
				if (producto == null) {
					resultado.setSuccess(false);
					resultado.setCodigoError(ERROR943NOPRODUCTO);
					resultado.setMensajeError("No existe el producto: "+codigoProductoRaw);
					return resultado;					
				}				
				
				ItemReferenciaHolder holderProducto = null;
				//busco si ya existe la referencia en la base de datos.
				for(ItemReferenciaHolder productoHolder : productos){
					if(productoHolder.referenciaProducto.equals(codigoProductoRaw)){
						holderProducto = productoHolder;
						break;
					}
				}
				
				if(holderProducto == null){
					holderProducto = new ItemReferenciaHolder();
					holderProducto.numeroUnidades 		= Integer.valueOf(unidadesRaw);
					holderProducto.precioFOB 			= precioUnidadRaw;
					holderProducto.referenciaProducto 	= codigoProductoRaw;
					holderProducto.producto 			= producto;
					productos.add(holderProducto);
				}else{
					holderProducto.numeroUnidades 		+= Integer.valueOf(unidadesRaw);
					//Solo actualizo el creado
				}												
			}
		}
		
		//Actualizo el trafico si cambia el pedido
		if(! ordenPedido.equals("")){
			trafico.setTrafpedido(ordenPedido);
			try {
				controltrafico.updatetrafico(trafico);
			} catch (SQLException e) {
				resultado.setSuccess(false);
				resultado.setCodigoError(ERROR943NOCONOCIDO);
				resultado.setMensajeError("No fué posible actualizar el trafico.");
				return resultado;
			}
		}
		
		gstreferencia_trafico controlRefrenciaTrafico = new gstreferencia_trafico();
		for(ItemReferenciaHolder productoHolder : productos){
			try {
				
				referencia_trafico referenciaTrafico= controlRefrenciaTrafico.getreferencia_traficoUqKey(
						factura.getftrafcodsx(), 
						productoHolder.producto.getprocodsx(), 
						"" );
				if(referenciaTrafico != null){
					referenciaTrafico.setreftcantidad(String.valueOf(productoHolder.numeroUnidades));
					referenciaTrafico.setreftfobunit(String.valueOf(productoHolder.precioFOB));
					referenciaTrafico.setreftfobtotal(Math.multiplicar(productoHolder.precioFOB , String.valueOf(productoHolder.numeroUnidades)));					
					controlRefrenciaTrafico.updatereferencia_trafico(referenciaTrafico);
				}else{
					/*
					if(controlRefrenciaTrafico.crearreferencia_trafico(
							factura.getftrafcodsx(),
							productoHolder.producto.getprocodsx(), 
							String.valueOf(productoHolder.numeroUnidades), 
							productoHolder.producto.getprokiloreal(),
							productoHolder.producto.getpropesobmp(), 
							String.valueOf(productoHolder.precioFOB), 							
							Math.multiplicar(productoHolder.precioFOB, String.valueOf(productoHolder.numeroUnidades)),
							productoHolder.precioFOB, 
							Math.multiplicar(productoHolder.precioFOB, String.valueOf(productoHolder.numeroUnidades)),
							Math.multiplicar(productoHolder.producto.getprokiloreal(), String.valueOf(productoHolder.numeroUnidades)),
							Math.multiplicar(productoHolder.producto.getprokilovolumen(), String.valueOf(productoHolder.numeroUnidades)),
							productoHolder.producto.getprokvmasterpack(),
							"")){
					*/
					if(controlRefrenciaTrafico.crearreferencia_trafico(
							factura.getftrafcodsx(),
							productoHolder.producto.getprocodsx(), 
							String.valueOf(productoHolder.numeroUnidades), 
							productoHolder.producto.getprokiloreal(),
							productoHolder.producto.getpropesobmp(), 
							String.valueOf(productoHolder.precioFOB), 							
							Math.multiplicar(productoHolder.precioFOB, String.valueOf(productoHolder.numeroUnidades)),
							"0", 
							"0",
							Math.multiplicar(productoHolder.producto.getprokiloreal(), String.valueOf(productoHolder.numeroUnidades)),
							Math.multiplicar(productoHolder.producto.getpropesobmp(), String.valueOf(productoHolder.numeroUnidades)),
							util.Math.dividir_bigdecimal( 
									String.valueOf(productoHolder.numeroUnidades),
									productoHolder.producto.getprounimasterpac()).toPlainString(),
							"")){
						resultado.setSuccess(false);
					}else{
						resultado.setSuccess(false);
						resultado.setCodigoError(ERROR943NOCONOCIDO);
						resultado.setMensajeError("Error desconocido");
						return resultado;
					}
				}
				
				
			} catch (NumberFormatException e) {
				resultado.setSuccess(false);
				resultado.setCodigoError(ERROR943NOCONOCIDO);
				resultado.setMensajeError("Error desconocido");
				return resultado;		
				//e.printStackTrace();
			} catch (SQLException e) {
				resultado.setSuccess(false);
				resultado.setCodigoError(ERROR943NOCONOCIDO);
				resultado.setMensajeError("Error desconocido");
				return resultado;		
				//e.printStackTrace();
			}
		}
		
		controltrafico.actualiar_CIF_referencias(trafcodsx);
		
		/*
		control.crearreferencia_trafico(
				ft.getftrafcodsx(),
				producto.getprocodsx(), 
				reftcantidad, 
				reftpesoneto,
				reftpesobruto, 
				reftfobunit, 
				reftfobtotal, 
				reftcifunit, 
				reftciftotal,
				reftpesonetototal, 
				reftpesobrutototal, 
				reftmpacks,reftserial);
				*/
		
		//Genero el archivo
		usuario usuario = (usuario) this.session.getAttribute("usuario");
		gstinterface943 controlinterface943 = new gstinterface943();		
		String i943usucodsx    = usuario.getusucodsx();
		String i943usulogin    = usuario.getusulogin();
		String i943intfecha    = Fecha.getFecha();
		String i943intfilecode = i943codigoArchivo;
		String i943intfilename = rutaArchivo;
		//String i943ordenPedido = ordenPedido;		
		String i943trafcodsx   = trafico.gettrafcodsx();
				
		try {
			controlinterface943.crearinterface943(
					i943usucodsx, 
					i943usulogin, 
					i943intfecha, 
					i943intfilecode, 
					i943intfilename, 
					i943trafcodsx,
					this.contenidoArchivo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		resultado.setSuccess(true);		
		return resultado;
	}	
	
	public ValidacionData validarData(ArrayList<String[]> dataRaw, String trafcodsx){
		ValidacionData resultado = new ValidacionData();
		
		String tipoArchivo = "";
		String intfilecode = ""; //Código del archivo, indica si ya subio un archivo con la misma información.
		ArrayList<String> referenciasProductos = new ArrayList<String>();
		gstinterface943 controlinterface943 = new gstinterface943();

		//Itero sobre la información del archio para detectar la información necesaria
		for(String[] fila : dataRaw){
		
			if(fila[0].equals("ST")){				
				tipoArchivo = fila[1];
				intfilecode = fila[2];
				
			}else if(fila[0].equals("W04")){				
				String codigoProductoRaw = fila[5];
				referenciasProductos.add(codigoProductoRaw);											
			}
		}
		//====================================================
		
		//Verificar que el tipo de archivo es e apropiado-----
		if(!tipoArchivo.equals("943")){
			resultado.isValido = false;
			resultado.mensaje = "El archivo no es de ipo 943 (Detectado "+tipoArchivo+" )";
			return resultado;
		}
		//====================================================
		
		//Verifico si ya cargué dicho archivo:
		interface943 interface943 = controlinterface943.getinterface943_by_intfilecode(intfilecode);
		if(interface943 != null){
			resultado.mensaje += " El archivo ya ha sido cargado anteriormente, si se carga de nuevo se sobreescribirá la información";
		}
		
		//====================================================
		
		//Verificar que todos los productos existan, de lo contrario retornar 
		//un listado con todos los productos que falten.
		
		gsttrafico controltrafico = new gsttrafico();
		gstproducto gstproducto   = new gstproducto();
		trafico trafico 		  = controltrafico.gettrafico(trafcodsx);
		
		if(trafico == null){
			resultado.isValido = false;
			resultado.mensaje = "El tráfico no existe.";
			return resultado;
		}
				
		String referenciasFaltantes = "";
		for(String referenciaProducto : referenciasProductos){
			producto producto = gstproducto.getproductoByUk(trafico.gettrafcompania(),referenciaProducto);
			if(producto == null){
				if(!referenciasFaltantes.equals("")){
					referenciasFaltantes += ","; 
				}
				referenciasFaltantes += referenciaProducto;
			}			
		}
		
		if(!referenciasFaltantes.equals("")){
			resultado.isValido = false;
			resultado.mensaje = "Las siguientes referencias no se encuentran creadas en el sistema: "+referenciasFaltantes;
			return resultado;
		}		
		//====================================================
		
		
		resultado.isValido = true;
		//resultado.mensaje = "";
		
		return resultado;
	}
	
	public Map procesarReferenciasPorCantidadEnviada(ArrayList<String[]> dataRaw){
		Map<String, String> hmap = new HashMap<String, String>();
		
		
		for(String[] fila : dataRaw){			
			if(fila[0].equals("W04")){				
				String codigoProductoRaw   = fila[5];
				String cantidadProductoRaw = fila[1];
				if(hmap.containsKey(codigoProductoRaw)){
					hmap.put(codigoProductoRaw, Math.sumar(cantidadProductoRaw,hmap.get(codigoProductoRaw) ));
				}else{
					hmap.put(codigoProductoRaw, cantidadProductoRaw);
					
				}														
			}
		}
		return hmap;
	}
	
	public String getTrafcodsx() {
		return trafcodsx;
	}

	public void setTrafcodsx(String trafcodsx) {
		this.trafcodsx = trafcodsx;
	}

	
	public String getRutaArchivo() {
		return rutaArchivo;
	}

	public void setRutaArchivo(String rutaArchivo) {
		this.rutaArchivo = rutaArchivo;
	}


	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}


	public String getContenidoArchivo() {
		return contenidoArchivo;
	}

	public void setContenidoArchivo(String contenidoArchivo) {
		this.contenidoArchivo = contenidoArchivo;
	}


	private class ItemReferenciaHolder{
		public int numeroUnidades; //Numero de pedido
		public String referenciaProducto; //Numero de referncia del producot
		public String precioFOB;
		public producto producto;
	}
	
	public static class ValidacionData{
		public boolean isValido = false;
		public String mensaje   = "";
	}
	
	public ResumenHolder943 getResumenArchivo(ArrayList<String[]> dataRaw){
		ResumenHolder943 resumen = new ResumenHolder943();
		for(String[] fila : dataRaw){
			if(fila[0].equals("W06")){
				resumen.poNumber = fila[6];
			}
			else if(fila[0].equals("N1")){
				if(fila[1].equals("SF")){
					resumen.shipFrom = fila[2];
					resumen.shipFromId = fila[4];
				}			
			}
			else if(fila[0].equals("W03")){
				resumen.cantidadTotalEnviada = fila[1];
			}	
		}
		return resumen;
	}
	
	public static class ResumenHolder943{
		public String poNumber;
		public String shipFrom;
		public String shipFromId;
		public String cantidadTotalEnviada;
		
	}
	
}
