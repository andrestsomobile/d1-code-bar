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
import ingreso.control.gstfactura_trafico;
import ingreso.control.gstreferencia_trafico;
import ingreso.control.gsttrafico;
import ingreso.entity.factura_trafico;
import ingreso.entity.referencia_trafico;
import ingreso.entity.trafico;
import maestro.control.gstproducto;
import util.Fecha;
import util.Math;


public class gstsapinterface944 {

	String trafcodsx 			= null;
	String identificadorArchivo = null;
	
	public gstsapinterface944(){
		
	}
	
	public ResultadoEscribirInterface generarArchivo944(String trafcodsx, String danados, String identificadorArchivoInput){		
		
		ResultadoEscribirInterface resultado       = new ResultadoEscribirInterface();		
		ArrayList<String[]> dataResultado    	   = new ArrayList<String[]>();
		gstinterface943 gstinterface943      	   = new gstinterface943();
		gstinterface944 gstinterface944      	   = new gstinterface944();
		gstfactura_trafico gfactura_trafico  	   = new gstfactura_trafico();
		gstreferencia_trafico greferencia_trafico  = new gstreferencia_trafico(); 
		maestro.control.gstproducto gprod 		   = new maestro.control.gstproducto();
		gsttrafico controltrafico                  = new gsttrafico();
		gstsap controlSap                          = new gstsap();
		
		this.trafcodsx                             = trafcodsx;
		trafico trafico 		                   = controltrafico.gettrafico(trafcodsx);
		
		
		String contenidoArchivo943 		           = gstinterface943.getContenidoArchivoByTrafcodsx(trafcodsx);
		
		Map<String, String> itemsDanados             = new HashMap<String, String>();//Listado de todas las referencias que reportaron dañados.
		Map<String, String> cantidadTotalReal        = new HashMap<String, String>();//Listado de todas las referencias en el tráfico sumando los similares.
		ArrayList<ItemProductoHolder> listaProductos = new ArrayList<ItemProductoHolder>();
		String cantidadRecibidaTotal                 = "0";	
		
		//identificadorArchivo                   = gstinterface944.getSiguiente944outputfileID();
		identificadorArchivo                     = identificadorArchivoInput;

		
		//Traer los datos de parametros
		ResourceBundle archivoPropiedades;
		archivoPropiedades = ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
	
		//String server="192.168.0.34";
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
			
		
		//Cargo todos los items que se encuetran en las facturas del tráfico		
		Collection lista = gfactura_trafico.getlistafactura_trafico( trafcodsx, null, null); 
		for(Object facturaLista : lista){
			 factura_trafico factura 		= (factura_trafico) facturaLista;
			 Collection referenciasTrafico 	= greferencia_trafico.getlistareferencia_trafico( factura.getftrafcodsx()); 
			 for(Object referenciaLista : referenciasTrafico){
				referencia_trafico referenciaTrafico = (referencia_trafico) referenciaLista;
				maestro.entity.producto producto 	 = gprod.getproducto( referenciaTrafico.getreftproducto());
				if( cantidadTotalReal.containsKey(producto.getpromodelo()) ){
					cantidadTotalReal.put(
						producto.getpromodelo(), 
						util.Math.sumar(cantidadTotalReal.get(producto.getpromodelo()), referenciaTrafico.getreftcantidad())
					);
				}else{
					cantidadTotalReal.put(
						producto.getpromodelo(), 
						referenciaTrafico.getreftcantidad()
					);
				}		
			 }
		 }
		
		String[] lineas = danados.split("\\~");
		for(String linea : lineas){
			String[] campos = linea.split("\\*");
			if(campos.length >= 2){
				String reftcodsx = campos[0];
				String refdanada = campos[1];
				if(itemsDanados.containsKey(reftcodsx)){
					itemsDanados.put(reftcodsx, util.Math.sumar(refdanada, itemsDanados.get(reftcodsx)));
				}else{
					itemsDanados.put(reftcodsx, refdanada);
				}				
			}
		}
		
		//---------------------------------------------------------------------
		
		String poNumber943  = "" ;
		String shipFromId   = "" ;
		String shipFromName = "" ; 
		
		if(contenidoArchivo943 != null){
			ArrayList<String[]> dataRaw = controlSap.parsearStringInterface(contenidoArchivo943);
			ItemProductoHolder itemProductoHolder = null;
			
			for(String[] fila : dataRaw){
//				if(fila[0].equals("ST")){
//					identificadorArchivo = fila[2];
//				}else 
				if(fila[0].equals("N1") && fila[1].equals("SF")){									
					shipFromId   = fila[4];
					shipFromName = fila[2];
				}else 
				if(fila[0].equals("W06")){
					
					poNumber943 = fila[6];
					
				}else if(fila[0].equals("W04")){
					
					itemProductoHolder = new ItemProductoHolder();
					String productServiceId = fila[5];
					String cantidadOriginal = fila[1];
					String warehouse = ""; //PENDIENTE
					//String poNumber  = "";
					itemProductoHolder.productServiceId = productServiceId;
					itemProductoHolder.warehouse        = warehouse;
					itemProductoHolder.cantidadOriginal = cantidadOriginal;
					
				}else if(fila[0].equals("N9")){
					
					if(fila[1].equals("LI")){
						itemProductoHolder.orderLineNumber = fila[2]; 
					}else if(!fila[1].equals("LI") && !fila[1].equals("ZZ") ){
						itemProductoHolder.orderType = fila[1];
						itemProductoHolder.poNumber  = fila[2];
						listaProductos.add(itemProductoHolder);
						
					}					
														
				}
			}
			
		}
		
		String[] fila ; //Contenedor de la fila
		
		//Cabecera ISA ------------------------------		
		String horaActual = util.Fecha.getHoraHHMM();
		
		fila     = new String[17];
		fila[0]  = "ISA";
		fila[1]  = "00"; //Default 00 Authoriation Information Qualifier 
		fila[2]  = "          "; // 10 campos vacios Authorization Information
		fila[3]  = "00";// Default 00 Security Information Qualifier
		fila[4]  = "          ";//Default 10 campos vacios, Security Information 
		fila[5]  = sli_qualifier; //PENDIENTE Trading Partner Qualifier?
		fila[6]  = sli_id; //PENDIENTE Trading Partner ID for Test or Production?
		fila[7]  = newell_qualifier; //Default 08 Newell Qualifier
		fila[8]  = newell_id;//Indica si es Pruebas T o desarrollo 6111972000T/6111972000
		fila[9]  = util.Fecha.getFechaYYMMDD(); //PENDIENTE Interchange Date?
		fila[10] = util.Fecha.getHoraHHMM(); //PENDIENTE Interchange Time?
		fila[11] = "U"; //Default to 'U' Interchange Control Standards ID 
		fila[12] = "00401"; //Default to '00401'
		fila[13] = interchange_control_number;//PENDIENTE Interchange Control Number?
		fila[14] = "0";//Default 0 Acknowledgement Request
		fila[15] = interface_usage_type;//Prod or Test 'P' 'T'
		fila[16] = ">"; //Default

		dataResultado.add(fila);
		//-------------------------------------------
		
		//Cabecera GS -------------------------------
		fila     = new String[9];
		fila[0]  = "GS";
		fila[1]  = "RE";//Functional Identifier Code	 	Default to "RE'?
		fila[2]  = sli_id;//PENDIENTE Application Sender's Code	Trading Partner ID for Test or Production?
		fila[3]  = newell_id;//PENDIENTE Application Receiver Code	Newell ID for Test or Production 6111972000T/6111972000?
		fila[4]  = util.Fecha.getFechaYYYYMMDD();//Date	YYYYMMDD	Ex. 20170619
		fila[5]  = horaActual;//PENDIENTE GS05	Time		EX. 07:15 pr lo general en los ejemplos viene sin :?
		fila[6]  = group_control_number;//PENDIENTE GS06	Group Control Number?
		fila[7]  = "X";//GS07	Responsible Agency Code		Default to 'X'
		fila[8]  = "004010";//Version/Release 		Default to '004010'
		dataResultado.add(fila);
		//--------------------------------------------		
				
		//Contenido ----------------------------------
		String fechaDescargue =  trafico.gettraffechadescargue()!=null? trafico.gettraffechadescargue().substring(0, trafico.gettraffechadescargue().indexOf(" ")).replaceAll("-", ""):"";
		//ST -----------------------------------------
		fila = new String[3];		
		fila[0] = "ST";
		fila[1] = "944";//Tipo de archivo
		fila[2] = identificadorArchivo; //PENDIENTE Secuencial? por ahora el mismo del 943
		dataResultado.add(fila);
		//W07 -----------------------------------------
		fila = new String[10];		
		fila[0] = "W17";
		fila[1] = "F";//514	Reporting Code	F — Full Details	F — Full Details
		//fila[2] = trafico.gettraffechadescargue();//373	Date	Expressed as CCYYMMDD	Expressed ad CCYYMMDD
		fila[2] = fechaDescargue;//373	Date	Expressed as CCYYMMDD	Expressed ad CCYYMMDD		
		fila[3] = "";//PENDIENTE 394	Warehouse Receipt Number	Identification number assigned to a receipt. Proforma or Invoice Number	null?
		fila[4] = poNumber943;//04 285	Depositor Order Number	Jarden/Sunbeam PO Number	Jarden/Sunbeam PO Number/Delivery Number
		fila[5] = "";//145	Agent Shipment ID Number	Unique Receipt Number 	null
		fila[6] = "";//176	Time Qualifier	not used	not used
		fila[7] = ""; //337	Time 	not used	not used
		fila[8] = "O6";//337	Time 	not used	not used
		fila[9] = "000000";//472	Link Sequence Number	Filler-000000	Default-'000000'
		dataResultado.add(fila);
		//N1 - SF -----------------------------------------
		fila = new String[5];		
		fila[0] = "N1";
		fila[1] = "SF"; //Ship From
		fila[2] = shipFromName; //PENDIENTE Por defecto SLI? 93	Entity Name
		fila[3] = "91"; //66	Identification ID Qualifier, Defecto 91
		fila[4] = shipFromId; //
		dataResultado.add(fila);
		//N1 - ST -----------------------------------------
		fila = new String[5];		
		fila[0] = "N1";
		fila[1] = "ST"; //Ship To
		fila[2] = sli_entity_name; //PENDIENTE - 93	Entity Name?
		fila[3] = "91"; //Defecto 91 66	Identification ID Qualifier
		fila[4] = sli_entity_id; //PENDIENTE - 67	Identification ID
		dataResultado.add(fila);
		//G62 -----------------------------------------
		fila = new String[3];		
		fila[0] = "G62";
		fila[1] = "11";//432	Date Qualifier	‘11’- Shipped on this date	‘11’- Shipped on this date
		fila[2] = util.Fecha.getFechaYYYYMMDD();//PENDIENTE 373	Date	Date — ‘CCYYMMDD’	Date — ‘CCYYMMDD’
		dataResultado.add(fila);
		//NTE (opcional) ------------------------------		
		//fila = new String[3];		
		//fila[0] = "NTE";
		//fila[1] = "";//363	Note Reference Code 
		//fila[2] = "";//352	Description
		//dataResultado.add(fila);		
		
		//Listado de productos:
		for(ItemProductoHolder productoItem : listaProductos ){
			
			//W07 -----------------------------------------
			String cantidadRecibida = cantidadTotalReal.get(productoItem.productServiceId);
			if(cantidadRecibida == null){
				cantidadRecibida = "0";
			}
			//La sumo al total.
			cantidadRecibidaTotal = util.Math.sumar(cantidadRecibidaTotal, cantidadRecibida);
			
			fila = new String[11];		
			fila[0] = "W07"; 
			fila[1] = cantidadRecibida.substring(0,cantidadRecibida.length()-3);//413	Quantity Received
			fila[2] = "EA";//355	Unit of Measurement Code	EA for Eaches	EA for Eaches
			fila[3] = "";//438	U.P.C. Case Code		not used-null
			fila[4] = "VN";//235	Product/Service ID Qualifier	‘VN’ — Vendor Product	‘VN’ — Vendor Product
			fila[5] = productoItem.productServiceId;//234	Product/Service ID	Vendor Product Code/Item Number	Vendor Product Code/Item Number
			fila[6] = "";//235	Product/Service ID Qualifier		not used-null
			fila[7] = "";//234	Product/Service ID		not used-null
			fila[8] = sli_entity_name;//PENDIENTE 451	Warehouse/Lot Number	Branch Plant/Warehouse	RANSA
			fila[9] = "";//Not Used		not used-null
			fila[10] = "0001";//235	Product/Service ID Qualifier	Warehouse Location 	Default '0001
			//fila[11] = "";//234	Product/Service ID	Container Number	not used-null			
			dataResultado.add(fila);
			
			//N09 - PO ------------------------------------
			fila = new String[4];
			fila[0] = "N09";
			fila[1] = productoItem.orderType;//de donde se saca
			fila[2] = productoItem.poNumber;//127	Reference Identification	Jarden/Sunbeam PO Number 	Jarden/Sunbeam PO Number/Delivery Number 
			fila[3] = productoItem.orderLineNumber;//369	Free-Form Description	Jarden/Sunbeam order line number 	Jarden/Sunbeam order line number
			dataResultado.add(fila);
			
			//W13 - Diferencial----------------------------
			String cantidadRegistrada = "";
			if(cantidadTotalReal.containsKey(productoItem.productServiceId)){
				cantidadRegistrada = cantidadTotalReal.get(productoItem.productServiceId); 
			}
			
			if(util.Math.comparar(productoItem.cantidadOriginal, cantidadRegistrada) != 0){
								
				String quantity  = "";
				String condition = "";
				if(util.Math.comparar(productoItem.cantidadOriginal, cantidadRegistrada) > 0){
					//Cantidad original es mayor, osea que faltan.
					condition = "02";
					quantity  = util.Math.restar_bigdecimal(productoItem.cantidadOriginal, cantidadRegistrada).toPlainString();
				}else{
					condition = "03";
					quantity  = util.Math.restar_bigdecimal(cantidadRegistrada,productoItem.cantidadOriginal).toPlainString();
				}
				
				fila = new String[6];
				fila[0] = "W13";
				fila[1] = quantity.substring(0, quantity.length() - 3);;//380	Quantity
				fila[2] = "EA";//355	Unit of Measurement Code	EA	EA
				fila[3] = condition;//412	Receiving Condition code	01' Damaged  '02'Qty Short '03' Qty Over	01' Damaged  '02'Qty Short '03' Qty Over
				fila[4] = "";//451	Warehouse Lot Number
				fila[5] = "";//PENDIENTE INSP - 05	853	Damaged Reason Code
				dataResultado.add(fila);
			}
					
			if(itemsDanados.containsKey(productoItem.productServiceId)){
				String iii = itemsDanados.get(productoItem.productServiceId);
				if(!itemsDanados.get(productoItem.productServiceId).equals("") && 
						!(util.Math.comparar("0", itemsDanados.get(productoItem.productServiceId)) >= 0)  ){
					//W13 - Dañado----------------------------
					fila = new String[6];
					fila[0] = "W13";
					fila[1] = itemsDanados.get(productoItem.productServiceId).substring(0, itemsDanados.get(productoItem.productServiceId).length() - 3);//380	Quantity
					fila[2] = "EA";//355	Unit of Measurement Code	EA	EA
					fila[3] = "01";//412	Receiving Condition code	01' Damaged  '02'Qty Short '03' Qty Over	01' Damaged  '02'Qty Short '03' Qty Over
					fila[4] = "";//451	Warehouse Lot Number
					fila[5] = "";//PENDIENTE INSP - 05	853	Damaged Reason Code
					dataResultado.add(fila);
					//---------------------------------------------				
				}
			}			
		}
		//---------------------------------------------
		
		//W14 -----------------------------------------
		fila = new String[2];
		fila[0] = "W14";
		fila[1] = cantidadRecibidaTotal;//413	Quantity Received 	Number of shipping units received	Number of shipping units received
		dataResultado.add(fila);
		//SE -----------------------------------------
		fila 	= new String[3];
		fila[0] = "SE";
		fila[1] = String.valueOf(dataResultado.size()-1);//96	Number of Included Segments
		fila[2] = identificadorArchivo;//PENDINTE 396	Control Number	ST02	ST02
		dataResultado.add(fila);
		//---------------------------------------------
		
		//Pie GS --------------------------------------
		fila     = new String[3];
		fila[0]  = "GE";
		fila[1]  = "1";//GE01	Number of Transaction Sets Included?
		fila[2]  = group_control_number;//GE02	Group Control Number?
		dataResultado.add(fila);
		//---------------------------------------------
		
		//Pie IEA -------------------------------------
		fila     = new String[3];
		fila[0]  = "IEA";//IEA01	Number of Included Functional Groups?
		fila[1]  = "1";//IEA01	Number of Transaction Sets Included?
		fila[2]  = interchange_control_number;//IEA02	Group Control Number?
		dataResultado.add(fila);
		//----------------------------------------------
		
		resultado.setDataRaw(dataResultado);
		resultado.setParseadoCorrecto(true);
		
		return resultado;
	}
	
	//Se usa el mismo identificador del 943 
	public boolean enviarArchivo944(String dataRaw, String codcompania, HttpSession session){
		
		ResourceBundle archivoPropiedades;
		archivoPropiedades = ResourceBundle.getBundle("parametrosInterfaces",Locale.getDefault());
		String extension   = archivoPropiedades.getString("ftp_edi_extension");
		
		if(trafcodsx!= null & identificadorArchivo != null){
			//String identificador = "0000000";
			String nombreArchivo = "archivo944"+identificadorArchivo+"."+extension;
			gstsapftputil ftpUtil = new gstsapftputil();
			if(ftpUtil.enviarArchivo(nombreArchivo, codcompania, dataRaw)){
				//Genero el archivo
				usuario usuario = (usuario) session.getAttribute("usuario");
				gstinterface944 controlinterface944 = new gstinterface944();		
				String i944usucodsx    = usuario.getusucodsx();
				String i944usulogin    = usuario.getusulogin();
				String i944intfecha    = Fecha.getFecha();
				String i944intfilecode = identificadorArchivo;
				String i944intfilename = nombreArchivo;
				//String i943ordenPedido = ordenPedido;		
				String i944trafcodsx   = trafcodsx;
						
				try {
					controlinterface944.crearinterface944(
							i944usucodsx, 
							i944usulogin, 
							i944intfecha, 
							i944intfilecode, 
							i944intfilename, 
							i944trafcodsx,
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
	
	public Map procesarReferenciasDanadas(ArrayList<String[]> dataRaw){
		Map<String, String> hmap = new HashMap<String, String>();
		String codigoProductoRaw = "";	
		for(String[] fila : dataRaw){
			if(fila[0].equals("W07")){
				codigoProductoRaw   = fila[5];
			}else if(fila[0].equals("W13") ){		
				if(fila[3].equals("01")){
					//String codigoProductoRaw   = fila[5];
					String cantidadProductoRaw = fila[1];
					if(hmap.containsKey(codigoProductoRaw)){
						hmap.put(codigoProductoRaw, Math.sumar(cantidadProductoRaw,hmap.get(codigoProductoRaw) ));
					}else{
						hmap.put(codigoProductoRaw, cantidadProductoRaw);						
					}
				}																		
			}
		}
		return hmap;
	}
	
	public ResumenHolder944 getResumenArchivo(ArrayList<String[]> dataRaw){
		ResumenHolder944 resumen = new ResumenHolder944();
		for(String[] fila : dataRaw){
			if(fila[0].equals("N1")){
				if(fila[1].equals("SF")){
					resumen.shipFrom = fila[2];
				}else if(fila[1].equals("ST")){
					resumen.shipTo = fila[2];
				}				
			}else if(fila[0].equals("G62") ){		
				resumen.shippedDate = fila[2];										
			}
		}
		return resumen;
	}
	
	private class ItemProductoHolder{
		public String cantidadOriginal;		
		public String productServiceId;
		public String warehouse;
		public String poNumber;
		public String orderLineNumber;
		public String orderType;
	}
	
	public static class ResumenHolder944{
		public String shipFrom;
		public String shipTo;
		public String shippedDate;
		
	}
}
