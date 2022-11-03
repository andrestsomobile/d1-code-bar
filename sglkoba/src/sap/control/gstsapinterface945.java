package sap.control;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import administracion.entity.usuario;
import maestro.control.gstproducto;
import maestro.entity.producto;
import pedido.control.gstreferencia_pedido;
import pedido.entity.referencia_pedido;
import util.Fecha;


public class gstsapinterface945 {


	String pedcodsx = ""; //Codigo del pedido SAP
	String identificadorArchivo = null;


	public static int ERROR945CANTIDADPORDEBAJO = 1;
	public static int ERROR945CANTIDADPORENCIMA = 2;	
	public static int ERROR945NOCONOCIDO 		= 999;
	
	//Parametros para guardar
	//private String rutaArchivo 		= "";
	private String contenidoArchivo = "";
	
	
	

	public gstsapinterface945(){
		
	}

	public ResultadoEscribirInterface armarArchivo945(String pedcodsx, String identificadorArchivoInput) {
		
		ResultadoEscribirInterface resultado = new ResultadoEscribirInterface();
		gstinterface940 gstinterface940      = new gstinterface940();		
		//ArrayList<String[]> dataRaw 		 = new ArrayList<String[]>();
		ArrayList<String[]> lineas 			 = new ArrayList<String[]>();
		String[] columnas 				     = new String[17];
		gstsap controlSap                    = new gstsap();
		String datosArchivo940 		         = gstinterface940.getContenidoArchivoByPedcodsx(pedcodsx);
		
		ArrayList<ItemReferenciaHolder> productos = new ArrayList<ItemReferenciaHolder>();
		
		Map<String, ItemReferenciaInventarioHolder> productosPedido = new HashMap<String, ItemReferenciaInventarioHolder>();
		
		gstreferencia_pedido greferencia_pedido = new gstreferencia_pedido();
		greferencia_pedido.setMaxfilas(100000);
		
		this.pedcodsx                        = pedcodsx;
		identificadorArchivo                 = identificadorArchivoInput;
				
		gstproducto gstproducto 			= new gstproducto();		
		
		
		//Cargar archivos del pedido registrado en el sistema
		Collection<referencia_pedido> listaReferenciasPedido = greferencia_pedido.getlistareferencia_pedido(pedcodsx, null, null);
		for(referencia_pedido itemReferenciaPedido : listaReferenciasPedido ){
						
			String procodsx   = itemReferenciaPedido.getrefpproducto();
			producto producto = gstproducto.getproducto(procodsx);
			
			if(productosPedido.containsKey(producto.getpromodelo()) ){
				ItemReferenciaInventarioHolder itemReferenciaInventarioHolder = productosPedido.get(producto.getpromodelo());
				itemReferenciaInventarioHolder.cantidadRegistrada = util.Math.sumar(
							itemReferenciaInventarioHolder.cantidadRegistrada,
							itemReferenciaPedido.getrefpcantidad()
						);
				itemReferenciaInventarioHolder.cantidadRegistradaAcumulada    = itemReferenciaInventarioHolder.cantidadRegistrada;
			}else{
				ItemReferenciaInventarioHolder itemReferenciaInventarioHolder = new ItemReferenciaInventarioHolder();
				itemReferenciaInventarioHolder.cantidadRegistrada             = itemReferenciaPedido.getrefpcantidad();
				itemReferenciaInventarioHolder.cantidadRegistradaAcumulada    = itemReferenciaInventarioHolder.cantidadRegistrada;
				itemReferenciaInventarioHolder.cantidadSolicitada 			  = "0";
				itemReferenciaInventarioHolder.referenciaProducto 			  = producto.getpromodelo();
				itemReferenciaInventarioHolder.nombreProducto 	  			  = producto.getprodescripcion();
				productosPedido.put(producto.getpromodelo(), itemReferenciaInventarioHolder);				
			}			
		}		 		 
		//===========================================================		
		
		
		//Traer datos del archivo 940 de la base de datos -------------------------------
		String numeroPO940 		= "" ;
		String codigoCliente 	= "" ;
		String nombreCliente 	= "" ;
		String fechaPedido 		= "" ;
		String numeroPlanta 	= "" ;
		
		if(datosArchivo940 != null){
			ArrayList<String[]> dataRaw = controlSap.parsearStringInterface(datosArchivo940);
			ItemReferenciaHolder ItemReferenciaHolder =  new ItemReferenciaHolder();
			
			for(String[] fila : dataRaw){
				
				if(fila[0].equals("W05")){
					numeroPO940 = fila[2];
					
				}
				if(fila[0].equals("N1")){
					if(fila[1].equals("BT")){
						nombreCliente		= fila[2];
						codigoCliente       = fila[4];
//						cliente 			= controlcliente.getcliente_by_ukeyCodigo(codigoCliente);			
//						nombreCliente		= cliente.getclinombre();
					}
					
				}
				if(fila[0].equals("N1")){
					if(fila[1].equals("SF")){
						numeroPlanta       = fila[4];
					}
					
				}
				if(fila[0].equals("G62")){
					if(fila[1].equals("10")){
						fechaPedido     = fila[2];
					}
				}
				if(fila[0].equals("LX")){
					ItemReferenciaHolder 			= new ItemReferenciaHolder();
					ItemReferenciaHolder.numeroLX 	= fila[1];
				}
				
				if(fila[0].equals("W01")){
					
					String cantidad       		= fila[1];
					String modeloProductoRaw 	= fila[5];
					String precioProductoRaw 	= "0";
										
					if(fila.length >6){
						precioProductoRaw 	= fila[7];
					}
					
					producto producto        = null;							
					producto 				 = gstproducto.getproductoModelo(modeloProductoRaw);
					
					ItemReferenciaHolder.numeroUnidades 		= Integer.valueOf(cantidad);
					ItemReferenciaHolder.referenciaProducto     = modeloProductoRaw;
					ItemReferenciaHolder.precioFOB 				= precioProductoRaw;
					ItemReferenciaHolder.producto 				= producto;
				}
				
				else if(fila[0].equals("N9")){
					if(fila[1].equals("LI")){
						ItemReferenciaHolder.numeroLI = fila[2]; 
					}else if(fila[1].equals("SO")){
						ItemReferenciaHolder.numeroPO = fila[2];
						productos.add(ItemReferenciaHolder);
						
						if(productosPedido.containsKey(ItemReferenciaHolder.referenciaProducto)){
							ItemReferenciaInventarioHolder itemReferenciaInventarioHolder = productosPedido.get(ItemReferenciaHolder.referenciaProducto);
							itemReferenciaInventarioHolder.cantidadSolicitada = util.Math.sumar(
										itemReferenciaInventarioHolder.cantidadSolicitada,
										String.valueOf(ItemReferenciaHolder.numeroUnidades)
									);
						}else{
							ItemReferenciaInventarioHolder itemReferenciaInventarioHolder = new ItemReferenciaInventarioHolder();
							itemReferenciaInventarioHolder.cantidadRegistrada          	  = "0";
							itemReferenciaInventarioHolder.cantidadRegistradaAcumulada    = itemReferenciaInventarioHolder.cantidadRegistrada;
							itemReferenciaInventarioHolder.cantidadSolicitada = String.valueOf(ItemReferenciaHolder.numeroUnidades);
							itemReferenciaInventarioHolder.referenciaProducto = ItemReferenciaHolder.producto.getpromodelo();
							itemReferenciaInventarioHolder.nombreProducto 	  = ItemReferenciaHolder.producto.getprodescripcion();
							productosPedido.put(ItemReferenciaHolder.referenciaProducto, itemReferenciaInventarioHolder);				
						}
						
					}													
				}
			}
		}
		
		
			
		// cargo los datos del encabezado
		ResourceBundle archivoPropiedades;
		archivoPropiedades = ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
		String sli_entity_name	 = archivoPropiedades.getString("sli_entity_name");
		String sli_entity_id	 = archivoPropiedades.getString("sli_entity_id");
		
		String newell_qualifier  = archivoPropiedades.getString("newell_qualifier");
		String newell_id         = archivoPropiedades.getString("newell_id");
		String sli_qualifier     = archivoPropiedades.getString("sli_qualifier");
		String sli_id            = archivoPropiedades.getString("sli_id");
		String interface_usage_type = archivoPropiedades.getString("interface_usage_type");
		String identificadorArchivoBase   = identificadorArchivo.replaceFirst("^0+(?!$)", "");
		String group_control_number       = identificadorArchivoBase;
		String interchange_control_number = StringUtils.leftPad(identificadorArchivoBase, 9, "0");
					
		//Encabezado ISA
		columnas[0] = "ISA";
		columnas[1] = "00";
		columnas[2] = "          ";
		columnas[3] = "00";
		columnas[4] = "          ";
		columnas[5]  = sli_qualifier; //PENDIENTE Trading Partner Qualifier?
		columnas[6]  = sli_id; //PENDIENTE Trading Partner ID for Test or Production?
		columnas[7]  = newell_qualifier; //Default 08 Newell Qualifier
		columnas[8]  = newell_id;//Indica si es Pruebas T o desarrollo 6111972000T/6111972000
		columnas[9]  = util.Fecha.getFechaYYMMDD(); //PENDIENTE Interchange Date?
		columnas[10] = util.Fecha.getHoraHHMM(); //PENDIENTE Interchange Time?
		columnas[11] = "U"; //Default to 'U' Interchange Control Standards ID 
		columnas[12] = "00401"; //Default to '00401'
		columnas[13] = interchange_control_number;//PENDIENTE Interchange Control Number?
		columnas[14] = "0";//Default 0 Acknowledgement Request
		columnas[15] = interface_usage_type;//Prod or Test 'P' 'T'
		columnas[16] = ">"; //Default
			
		lineas.add(columnas);
			
		//Encabezado GS
		String horaActual 	= util.Fecha.getHoraHHMM();
		String fechaActual 	= util.Fecha.getFechaYYYYMMDD();
		columnas = new String[9];
			
		columnas[0]  = "GS";
		columnas[1]  = "SW";//Functional Identifier Code	 	Default to "RE'?
		columnas[2]  = sli_id;//PENDIENTE Application Sender's Code	Trading Partner ID for Test or Production?
		columnas[3]  = newell_id;//PENDIENTE Application Receiver Code	Newell ID for Test or Production 6111972000T/6111972000?
		columnas[4]  = util.Fecha.getFechaYYYYMMDD();//Date	YYYYMMDD	Ex. 20170619
		columnas[5]  = horaActual;//PENDIENTE GS05	Time		EX. 07:15 pr lo general en los ejemplos viene sin :?
		columnas[6]  = group_control_number;//PENDIENTE GS06	Group Control Number?
		columnas[7]  = "X";//GS07	Responsible Agency Code		Default to 'X'
		columnas[8]  = "004010";//Version/Release 		Default to '004010'
			
		lineas.add(columnas);
		//Cuerpo del formato
		//ST
		columnas = new String[3];
		columnas[0]  = "ST";
		columnas[1]  = "945";
		columnas[2]  = identificadorArchivo; 

			
		lineas.add(columnas);
			
		//W06
		columnas = new String[4];
		columnas[0]  = "W06";
		columnas[1]  = "F";
		columnas[2]  = numeroPO940; 
		columnas[3]  = fechaActual; // Fecha Embarque -> Se esta tomando la fecha cuando se envia el archivo por que no se tiene 
		lineas.add(columnas);
			
		//N1
		columnas = new String[5];
		columnas[0]  = "N1";
		columnas[1]  = "ST";
		columnas[2]  = nombreCliente; //Secuencial Control number PENDIENTE DE DONDE SALE ESTE NUMERO
		columnas[3]  = "91";
		columnas[4]  = codigoCliente;
		lineas.add(columnas);
			
		//G62
		columnas = new String[3];
		columnas[0]  = "G62";
		columnas[1]  = "11";
		columnas[2]  = fechaActual; //Fecha Embarque -> Se esta tomando la fecha cuando se envia el archivo por que no se tiene 
		lineas.add(columnas);
			
				
		//NTE NO SE ENVIA
		//W27 NO DICE SI SE ENVIA EL ESPACIO MANDATORIO ESTA VACIO PERO ESPECIFICA DATOS PARA ENVIAR
			
		 //Traer los datos de parametros
		  
	    archivoPropiedades 				= ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
	    String identificadorSLI 		= archivoPropiedades.getString("sli_entity_id");
	        			
		String cantidadRecibidaTotal 	= "";
		int contadorProductos			= 0;
			
		//Recorrer el array de productos
		for(ItemReferenciaHolder producto: productos){
				
			producto objetoProducto     		= producto.producto;							
			String cantidadUnidadesMasterpack	= objetoProducto.getprounimasterpac();
			
			ItemReferenciaInventarioHolder itemReferenciaInventarioHolder = productosPedido.get(producto.referenciaProducto);
			if(itemReferenciaInventarioHolder == null){
				itemReferenciaInventarioHolder = new ItemReferenciaInventarioHolder();
			}
			
			//Fabio Cambiar 			
			//String cantidad 					= String.valueOf(producto.numeroUnidades);
			//String unidadesPorPaqueteProducto	= String.valueOf(producto.numeroUnidades);
			
			String cantidad 					= "0";
			String unidadesPorPaqueteProducto	= "0";
			
			if(util.Math.comparar(
					String.valueOf(producto.numeroUnidades), 
					itemReferenciaInventarioHolder.cantidadRegistradaAcumulada) >= 0){
				
				cantidad 					= itemReferenciaInventarioHolder.cantidadRegistradaAcumulada;
				unidadesPorPaqueteProducto	= cantidad;
				itemReferenciaInventarioHolder.cantidadRegistradaAcumulada = util.Math.restar_bigdecimal(
						itemReferenciaInventarioHolder.cantidadRegistradaAcumulada, 
						cantidad).toPlainString();				 
			}else{
				cantidad                    = String.valueOf(producto.numeroUnidades);
				unidadesPorPaqueteProducto	= cantidad;
				itemReferenciaInventarioHolder.cantidadRegistradaAcumulada = util.Math.restar_bigdecimal(
						itemReferenciaInventarioHolder.cantidadRegistradaAcumulada, 
						cantidad).toPlainString();
			}
			
				
			//double numeroPaquetesProductos		= (producto.numeroUnidades)/ Integer.parseInt(cantidadUnidadesMasterpack);
			String numeroPaquetesProductos		= util.Math.redondear(util.Math.dividir(cantidad,cantidadUnidadesMasterpack));
			
			int    totalPaquetesProductos		= Integer.valueOf(numeroPaquetesProductos);
			
			//Se va acumulando el total de unidades recibidas.
			cantidadRecibidaTotal 				= util.Math.sumar(cantidadRecibidaTotal, cantidad);
			
			for (int i=0; i<totalPaquetesProductos;i++){
				String LPN 					= "";
				contadorProductos 			+= 1;
				String sContadorProductos 	= StringUtils.leftPad(String.valueOf(contadorProductos),4, "0"); //
				LPN 						= numeroPlanta+producto.numeroPO+sContadorProductos;
				String unidadesProducto		= "";
					
					
					
				if(util.Math.comparar(unidadesPorPaqueteProducto, cantidadUnidadesMasterpack)>=0){
					unidadesProducto = cantidadUnidadesMasterpack;
				}
				else if(util.Math.comparar(unidadesPorPaqueteProducto, cantidadUnidadesMasterpack)<0){
					unidadesProducto = String.valueOf(unidadesPorPaqueteProducto);
				}
					
				unidadesPorPaqueteProducto  = util.Math.restar_bigdecimal(unidadesPorPaqueteProducto, cantidadUnidadesMasterpack).toPlainString();				
					
				//LX
				columnas = new String[2];
				columnas[0]  = "LX";
				columnas[1]  = producto.numeroLX;
				lineas.add(columnas);
					
				//W12
				columnas = new String[23];		
				columnas[0] = "W12"; 
				columnas[1] = "";
				columnas[2] = "";
				//columnas[3] = String.valueOf(producto.numeroUnidades);
				columnas[3] = util.Math.redondear(unidadesProducto);
				columnas[4] = "";
				columnas[5] = "EA";//
				columnas[6] = "";
				columnas[7] = "VN";//
				columnas[8] = producto.referenciaProducto;
				columnas[9] = "0001";//
				columnas[10] = "";
				columnas[11] = "";
				columnas[12] = "";
				columnas[13] = "";
				columnas[14] = "";
				columnas[15] = "";
				columnas[16] = "";
				columnas[17] = "BL"; //
				columnas[18] = LPN; //lp number
				columnas[19] = "";
				columnas[20] = "";
				columnas[21] = "ZZ";
				columnas[22] = "CT"; // "PL" "PUEDEN SER LOS DOS";				
				
				lineas.add(columnas);
			
				//N09 - SO ------------------------------------
				columnas = new String[4];
				columnas[0] = "N9";
				columnas[1] = "SO";
				columnas[2] = producto.numeroPO;
				columnas[3] = "SO";//PENDIENTE
				lineas.add(columnas);
				
				//N09 - LI ------------------------------------
				columnas = new String[4];
				columnas[0] = "N9";
				columnas[1] = "LI";
				columnas[2] = StringUtils.leftPad(producto.numeroLI,6, "0"); //;
				columnas[3] = "000";//PENDIENTE
				lineas.add(columnas);
					
				//N09 - ZZ ------------------------------------
				columnas = new String[4];
				columnas[0] = "N9";
				columnas[1] = "ZZ";
				columnas[2] = identificadorSLI;
				columnas[3] = "";//PENDIENTE
				lineas.add(columnas);
			}
		}
			
		//W03 	
		columnas = new String[2];
		columnas[0] = "W03";
		columnas[1] = util.Math.redondear(cantidadRecibidaTotal);
		lineas.add(columnas);
		    
		//SE
		columnas = new String[3];
		columnas[0] = "SE";
		columnas[1] = String.valueOf(lineas.size()-1);//PENDIENTE
		columnas[2] = util.Math.redondear(cantidadRecibidaTotal);
		lineas.add(columnas);
		
		
		//Footer(PIE)
		//GE 
		columnas     = new String[3];
		columnas[0]  = "GE";
		columnas[1]  = "1";//PENDIENTE?
		columnas[2]  = 	group_control_number;//PENDIENTE SAME GS06
		lineas.add(columnas);
				
		//IEA 
		columnas     = new String[3];
		columnas[0]  = "IEA";//IEA01	Number of Included Functional Groups?
		columnas[1]  = "1";//IEA01	Number of Transaction Sets Included?
		columnas[2]  = interchange_control_number;//SAME ISA12?
		lineas.add(columnas);
		
		//FINALIZA SEGMENTOS
		
		resultado.setDataRaw(lineas);
		resultado.setParseadoCorrecto(true);
		
		//Validación con número de enviados, se valida que la cantidad enviada no sea mayor a la cantidad recibida.
								
		for (Map.Entry<String, ItemReferenciaInventarioHolder> entry : productosPedido.entrySet()){
			
			String referenciaProducto                                     = entry.getKey();
			ItemReferenciaInventarioHolder itemReferenciaInventarioHolder = entry.getValue();
			
			if(util.Math.comparar(
					itemReferenciaInventarioHolder.cantidadSolicitada,
					itemReferenciaInventarioHolder.cantidadRegistrada ) > 0){
				if(resultado.getCodigoError() != ERROR945CANTIDADPORENCIMA){ //No sobreescribir el error 
					resultado.setCodigoError(ERROR945CANTIDADPORDEBAJO);
				}//Voy aqui		
				resultado.setMensajeErrorExtensionHtml(
						resultado.getMensajeErrorExtensionHtml() +
						"<tr>" +
						"<td>"+itemReferenciaInventarioHolder.referenciaProducto+"</td>"+
						"<td>"+itemReferenciaInventarioHolder.nombreProducto+"</td>"+
						"<td>"+itemReferenciaInventarioHolder.cantidadSolicitada+"</td>"+
						"<td>"+itemReferenciaInventarioHolder.cantidadRegistrada+"</td>"+
						"<td>CANTIDAD MENOR</td>"+
						"</tr>"												
						);
			}if(util.Math.comparar(
					itemReferenciaInventarioHolder.cantidadSolicitada,
					itemReferenciaInventarioHolder.cantidadRegistrada ) < 0){
				resultado.setCodigoError(ERROR945CANTIDADPORENCIMA);
				resultado.setMensajeErrorExtensionHtml(
						resultado.getMensajeErrorExtensionHtml() +
						"<tr>" +
						"<td>"+itemReferenciaInventarioHolder.referenciaProducto+"</td>"+
						"<td>"+itemReferenciaInventarioHolder.nombreProducto+"</td>"+
						"<td>"+itemReferenciaInventarioHolder.cantidadSolicitada+"</td>"+
						"<td>"+itemReferenciaInventarioHolder.cantidadRegistrada+"</td>"+
						"<td>CANTIDAD MAYOR</td>"+
						"</tr>"												
						);
			}else{
				//Nada
			}
			
		}
		resultado.setMensajeErrorExtensionHtml("<table  align=\"center\" width=\"98%\" border=\"0\" cellspacing=\"0\" cellpading=\"0\" class=\"tabla_listas\"><tbody>"+
				"<th>Referencia</th>"+
				"<th>Producto</th>"+
				"<th>Cantidad Solicitada</th>"+
				"<th>Cantidad Registrada</th>"+
				"<th>Nota</th>"+
				resultado.getMensajeErrorExtensionHtml()+
				"</tbody></table>");
		//=============================================================
		
		
			
		return resultado;
	}
	
	
	public boolean enviarArchivo945(String dataRaw, String codcompania, HttpSession session){
		
		ResourceBundle archivoPropiedades;
		archivoPropiedades = ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
		String extension   = archivoPropiedades.getString("ftp_edi_extension");
		
		if(pedcodsx!= null & identificadorArchivo != null){
			//String identificador = "0000000";
			String nombreArchivo = "archivo945"+identificadorArchivo+"."+extension;
			gstsapftputil ftpUtil = new gstsapftputil();
			if(ftpUtil.enviarArchivo(nombreArchivo, codcompania, dataRaw)){
				//Genero el archivo
				usuario usuario = (usuario) session.getAttribute("usuario");
				gstinterface945 controlinterface945 = new gstinterface945();		
				String i945usucodsx    = usuario.getusucodsx();
				String i945usulogin    = usuario.getusulogin();
				String i945intfecha    = Fecha.getFecha();
				String i945intfilecode = identificadorArchivo;
				String i945intfilename = nombreArchivo;
				//String i943ordenPedido = ordenPedido;		
				String i945pedcodsx   = pedcodsx;
						
				try {
					controlinterface945.crearinterface945(
							i945usucodsx, 
							i945usulogin, 
							i945intfecha, 
							i945intfilecode, 
							i945intfilename, 
							i945pedcodsx,
							dataRaw);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}else{
			return false;
		}		
		return true;
	}


	public ResumenHolder945 getResumenArchivo(ArrayList<String[]> dataRaw){
		ResumenHolder945 resumen = new ResumenHolder945();
		for(String[] fila : dataRaw){
			if(fila[0].equals("W06")){
				resumen.delivery = fila[2];										
			}else if(fila[0].equals("N1")){
				if(fila[1].equals("ST")){
					resumen.shipTo = fila[2];
				}				
			}else if(fila[0].equals("G62") ){		
				resumen.shippedDate = fila[2];										
			}
		}
		return resumen;
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
		public String numeroPO;
		public String numeroLX;
		public String numeroLI;
	}
	
	//Datos de los item enviados realmente y las diferencias en cuantra lo solicitado.
	private class ItemReferenciaInventarioHolder{
		public String nombreProducto               = "";
		public String referenciaProducto           = ""; 				
		public String cantidadRegistrada           = "0"; //Lo que aparece registrado en SLI
		public String cantidadRegistradaAcumulada  = "0";
		public String cantidadSolicitada           = "0"; //Lo que solicitó OSTER.
		
				
	}

	
	public static class ResumenHolder945{
		public String delivery;
		public String shipTo;
		public String shippedDate;
		
	}

	
}
