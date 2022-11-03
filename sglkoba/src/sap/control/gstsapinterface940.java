package sap.control;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;

import administracion.entity.usuario;
import ingreso.control.gsttrafico;
import ingreso.entity.factura_trafico;
import maestro.control.gstciudad;
import maestro.control.gstcliente;
import maestro.control.gstproducto;
import maestro.control.gstsucursal;
import maestro.entity.ciudad;
import maestro.entity.cliente;
import maestro.entity.producto;
import maestro.entity.sucursal;
import maestro.control.gstdepartamento;
import pedido.control.gestionSaldos;
import pedido.control.gstpedido;
import pedido.control.gstreferencia_pedido;
import pedido.entity.pedido;
import pedido.entity.referencia_pedido;
import sap.control.gstsapinterface945.ResumenHolder945;
import util.Fecha;


public class gstsapinterface940 {

	
	String pedcodsx = ""; //Codigo del pedido SAP
	String pedidoSistema="";
	
	
	public static int ERROR940NOPEDIDO  = 1;	
	public static int ERROR940NOFACURA   = 2;
	public static int ERROR940NOCLIENTE = 3;
	public static int ERROR940NOCLIENTESUCURSAL = 4;
	public static int ERROR940NOPRODUCTO =5;
	public static int ERROR940NOCIUDAD =6;
	
	public static int ERROR940NOCONOCIDO = 999;
	
	//Parametros para guardar
	private String rutaArchivo 		= "";
	private String contenidoArchivo = "";
	
	private HttpSession session;
	

	public gstsapinterface940(){
		
	}

	public gstsapresultadoimportacion importarInformacion(ArrayList<String[]> dataRaw, String compania) {
		
		gstsapresultadoimportacion resultado = new gstsapresultadoimportacion();
		String ordenPedido = "";
		String clientecodsx = null;
		String fechaSistema;
		String i940codigoArchivo = "";
		
		
		pedido pedido                             = null;
		factura_trafico factura                   = null;
		ArrayList<ItemReferenciaHolder> productos = new ArrayList<ItemReferenciaHolder>();
		
		gsttrafico controltrafico 	= new gsttrafico();
		gstcliente controlcliente 	= new gstcliente();
		gstsucursal controlsucursal = new gstsucursal();
		gstciudad controlciudad     = new gstciudad();
		
		String usucodsx = "";
		String usulogin = "";
		
		if(session != null){
			usuario usuario = (usuario) this.session.getAttribute("usuario");
			usucodsx = usuario.getusucodsx();
			usulogin = usuario.getusulogin();
		}else{
			usucodsx = "-1";
			usulogin = "AUTOMÁTICO";
		}
		
		// validaciones Del pedido
		if (true) { //mientras
			// cargo los datos del encabezado
			gstpedido pedidonuevo 	= new gstpedido();
			String ordendecompra 	= null;
			cliente cliente        	= null;	
			String sucursalcodsx    = null;
			String direccion 		= "";
			String compldireccion 	= "";
			String nombreCiudad		= "";
			String codigoCiudad 	= "";
			String codDepto 		= "";
			String codZona 			= "";
			String fechaPedido 		= "";
			String fechaVenc 		= "";
			
			boolean modon1st = false;
			for(String[] fila : dataRaw){
				if(fila[0].equals("ST")){
					i940codigoArchivo = fila[2];
				}				
				if(fila[0].equals("W05")){
					ordendecompra 	= fila[2];
					pedcodsx		= fila[3];
					
				}
				if(fila[0].equals("N1")){
					if(fila[1].equals("BT")){
						
						String codigoCliente       = fila[4];
						cliente 				   = controlcliente.getcliente_by_ukeyCodigo(codigoCliente);	
							
						if (cliente == null) {
							resultado.setSuccess(false);
							resultado.setCodigoError(ERROR940NOCLIENTE);
							resultado.setMensajeError("No existe el Cliente: "+codigoCliente);
							
							String mensajeExtra = "<div style=\" width: 26em; margin: 0 auto; font-size: 1.2em;\">"+
								"	<table>"+
								"		<tr>"+
								"			<td valign=\"middle\"><img src=\"./disenno/images/iconofail.png\" style=\"margin-right: 1em;\"/></td>"+
								"			<td valign=\"middle\">"+
								"				Error: <%= mensajeError %>"+						
								"			</td>"+
								"		</tr>"+
								"	</table>"+								
								"</div>";	
							
							return resultado;					
						}
						clientecodsx 			   = cliente.getclicodsx();
					}
					
				}
				
				if(fila[0].equals("N1")){
					if(fila[1].equals("ST")){
						modon1st = true;
						String codigoSucursal      	= fila[4];
						sucursal sucursal        	= null;	
						boolean clienteSucursal;	
						sucursal 					= controlsucursal.getsuccodcursal(codigoSucursal);
						sucursalcodsx				= sucursal.getsuccodsx();
						clienteSucursal 			= controlsucursal.getclientesucursal(clientecodsx, sucursalcodsx);
						
						if (sucursal == null) {
							resultado.setSuccess(false);
							resultado.setCodigoError(ERROR940NOCLIENTE);
							resultado.setMensajeError("No existe la sucursal: "+codigoSucursal);
							
							
							String i940usucodsx    			= usucodsx;
							String i940usulogin    			= usulogin;
							String i940intfecha    			= Fecha.getFecha();
							String i940intfilecode 			= i940codigoArchivo;
							String i940intfilename 			= rutaArchivo;
							String i940ordenPedido 			= "";
							if(pedido != null){
								i940ordenPedido 			=  pedido.getpedcodsx();
							}else{
								i940ordenPedido             = "-1";
							}									
							String i940intestadoimportacion = "ERROR";
							String i940intmensajeextra      = generarMensajeExtraHtmlError(resultado.getMensajeError());
							
							crearRegistroInterface940(i940usucodsx, 
									i940usulogin, 
									i940intfecha, 
									i940intfilecode, 
									i940intfilename, 
									i940ordenPedido,
									this.contenidoArchivo,
									i940intestadoimportacion,
									i940intmensajeextra);
							
							return resultado;					
						}
						else if(sucursal != null){
							if(!clienteSucursal){
								resultado.setSuccess(false);
								resultado.setCodigoError(ERROR940NOCLIENTESUCURSAL);
								resultado.setMensajeError("La sucursal: "+codigoSucursal+" no pertenece al cliente: "+clientecodsx);
								
								String i940usucodsx    			= usucodsx;
								String i940usulogin    			= usulogin;
								String i940intfecha    			= Fecha.getFecha();
								String i940intfilecode 			= i940codigoArchivo;
								String i940intfilename 			= rutaArchivo;
								String i940ordenPedido 			= "";
								if(pedido != null){
									i940ordenPedido 			=  pedido.getpedcodsx();
								}else{
									i940ordenPedido             = "-1";
								}									
								String i940intestadoimportacion = "ERROR";
								String i940intmensajeextra      = generarMensajeExtraHtmlError(resultado.getMensajeError());
								
								crearRegistroInterface940(i940usucodsx, 
										i940usulogin, 
										i940intfecha, 
										i940intfilecode, 
										i940intfilename, 
										i940ordenPedido,
										this.contenidoArchivo,
										i940intestadoimportacion,
										i940intmensajeextra);
								
								return resultado;															
							}
						}
					}
					
				}
				if(fila[0].equals("N3") && modon1st){
					direccion      		= fila[1];
					compldireccion      	= fila[2];
					
					if(!direccion.equals(compldireccion)){
						direccion+= " "+compldireccion;
					}
				}
				if(fila[0].equals("N4") && modon1st){
					ciudad ciudad 			   = null;
					gstdepartamento gdep 	   = new gstdepartamento();
					nombreCiudad        	   = fila[1];
					codDepto      	   		   = fila[2];
					String codPostal     	   = fila[3];
					String estandarPais        = fila[4];
					ciudad 					   = controlciudad.getciudad_by_ukeyNombre(nombreCiudad);
					codigoCiudad			   = ciudad.getciucodigo();
					codDepto			       = ciudad.getciudepto();
					
					codZona			       	   = gdep.getdepartamento(codDepto).getdepzona();
					
					if (ciudad == null) {
						resultado.setSuccess(false);
						resultado.setCodigoError(ERROR940NOCIUDAD);
						resultado.setMensajeError("No existe la ciudad: "+nombreCiudad);
						
						String i940usucodsx    			= usucodsx;
						String i940usulogin    			= usulogin;
						String i940intfecha    			= Fecha.getFecha();
						String i940intfilecode 			= i940codigoArchivo;
						String i940intfilename 			= rutaArchivo;
						String i940ordenPedido 			= "";
						if(pedido != null){
							i940ordenPedido 			=  pedido.getpedcodsx();
						}else{
							i940ordenPedido             = "-1";
						}									
						String i940intestadoimportacion = "ERROR";
						String i940intmensajeextra      = generarMensajeExtraHtmlError(resultado.getMensajeError());
						
						crearRegistroInterface940(i940usucodsx, 
								i940usulogin, 
								i940intfecha, 
								i940intfilecode, 
								i940intfilename, 
								i940ordenPedido,
								this.contenidoArchivo,
								i940intestadoimportacion,
								i940intmensajeextra);
						
						
						
						return resultado;					
					}
					
					modon1st = false;
				}

				if(fila[0].equals("G62")){
					if(fila[1].equals("10")){
						fechaPedido     = fila[2];
						
					}
					else if(!fila[1].equals("10")){
						fechaVenc      = fila[2];
						
					}
				}
				
			}
			
		    fechaSistema = util.Fecha.getFecha();
		    
		  //Traer los datos de parametros
		    ResourceBundle archivoPropiedades;
	        archivoPropiedades = ResourceBundle.getBundle("parametros",Locale.getDefault());
	        String porcentajeiva = archivoPropiedades.getString("porcentaje_iva");
	        String codigocompania = compania;
	       
		    
		    //Crear el pedido
		    try{
		    	
		    //String , String , String , String , String , String , String, String , String, String , String , String , String ,
	        //String , String , String , String , String , String , String , String , String , String , String , String , String , String , String 
			pedidonuevo.crearpedido(
					codigocompania, //pedcompania
					pedcodsx, //pednumpedido
					ordendecompra,//pedordencompra
					pedcodsx, //oblig pedguia
					fechaSistema,//oblig pedfechasistema
					fechaPedido,//pedfecha
					fechaVenc,//pedfechavenc
					fechaPedido,//pedfechacita
					"00:00",//no pedhoracita 
					clientecodsx,//pedcliente
					sucursalcodsx,//pedsucursal
					direccion,//peddireccion
					codigoCiudad,//pedciudad
					codDepto,//oblig peddepartamento
					"",//no pedobservaciones
					"",//no pedfactura
					"TRAMITE",//oblig pedestado
					"0",//no pedsubtotal
					"0",//no pediva
					"0",//oblig peddescuento
					"0",//no pedtotal
					"NAC",// pedtipo
					null, //pedpicking
					util.Fecha.getHora(),//pedhora
					codZona,//pedzona
					"15",//pedcausal_hit									
					porcentajeiva,//pedporc_iva
					"50"//pedtransportadora
					);

		    }catch (SQLException e) {
					resultado.setSuccess(false);
					resultado.setCodigoError(ERROR940NOCONOCIDO);
					resultado.setMensajeError("Ya existe el pedido.");
					
					String i940usucodsx    			= usucodsx;
					String i940usulogin    			= usulogin;
					String i940intfecha    			= Fecha.getFecha();
					String i940intfilecode 			= i940codigoArchivo;
					String i940intfilename 			= rutaArchivo;
					String i940ordenPedido 			= "";
					if(pedido != null){
						i940ordenPedido 			=  pedido.getpedcodsx();
					}else{
						i940ordenPedido             = "-1";
					}									
					String i940intestadoimportacion = "ERROR";
					String i940intmensajeextra      = generarMensajeExtraHtmlError(resultado.getMensajeError());
					
					crearRegistroInterface940(i940usucodsx, 
							i940usulogin, 
							i940intfecha, 
							i940intfilecode, 
							i940intfilename, 
							i940ordenPedido,
							this.contenidoArchivo,
							i940intestadoimportacion,
							i940intmensajeextra);
					
					return resultado;
											
					//e.printStackTrace();			
			}
		}
		
		
		
		//Productos
		gstproducto gstproducto = new gstproducto();		
		for(String[] fila : dataRaw){
		
			if(fila[0].equals("W01")){								
				String cantidad       		= fila[1].trim();
				String modeloProductoRaw 	= fila[5];
				String precioProductoRaw 	= "0";
				
				if(fila.length >6){
					precioProductoRaw 	= fila[7].trim();
				}
										
				producto producto        = null;							
				producto = gstproducto.getproductoModelo(modeloProductoRaw);				
				
				if (producto == null) {
					resultado.setSuccess(false);
					resultado.setCodigoError(ERROR940NOPRODUCTO);
					resultado.setMensajeError("No existe el producto:"+modeloProductoRaw);
					
					String i940usucodsx    			= usucodsx;
					String i940usulogin    			= usulogin;
					String i940intfecha    			= Fecha.getFecha();
					String i940intfilecode 			= i940codigoArchivo;
					String i940intfilename 			= rutaArchivo;
					String i940ordenPedido 			= "";
					if(pedido != null){
						i940ordenPedido 			=  pedido.getpedcodsx();
					}else{
						i940ordenPedido             = "-1";
					}									
					String i940intestadoimportacion = "ERROR";
					String i940intmensajeextra      = generarMensajeExtraHtmlError(resultado.getMensajeError());
					
					crearRegistroInterface940(i940usucodsx, 
							i940usulogin, 
							i940intfecha, 
							i940intfilecode, 
							i940intfilename, 
							i940ordenPedido,
							this.contenidoArchivo,
							i940intestadoimportacion,
							i940intmensajeextra);
															
					return resultado;					
				}				
				
				ItemReferenciaHolder holderProducto = new ItemReferenciaHolder();
				holderProducto.numeroUnidades 		= Integer.valueOf(cantidad);
				holderProducto.referenciaProducto 	= modeloProductoRaw;
				holderProducto.precioFOB 			= precioProductoRaw;
				holderProducto.producto 			= producto;
				
				productos.add(holderProducto);
			}
		}
		
		//Actualizo el trafico si cambia el pedido
//		if(! ordenPedido.equals("")){
//			trafico.setTrafpedido(ordenPedido);
//			try {
//				controltrafico.updatetrafico(trafico);
//			} catch (SQLException e) {
//				resultado.setSuccess(false);
//				resultado.setCodigoError(ERROR943NOCONOCIDO);
//				resultado.setMensajeError("No fué posible actualizar el trafico.");
//				return resultado;
//			}
//		}
		
		gstpedido controlPedido = new gstpedido();
		pedido					= controlPedido.getpedidoByNumPedidoDate(pedcodsx, fechaSistema);
		pedidoSistema    		= pedido.getpedcodsx();
		
		
		gstreferencia_pedido controlRefrenciaPedido = new gstreferencia_pedido();
		for(ItemReferenciaHolder productoHolder : productos){
			try {
				
				String pedcodsx = pedido.getpedcodsx();
				String procodsx = productoHolder.producto.getprocodsx();
				String cantidad = String.valueOf(productoHolder.numeroUnidades);
				String valorunit = String.valueOf(productoHolder.precioFOB);
				String valorfacunit = String.valueOf(productoHolder.precioFOB);
				
				gestionSaldos gst = new gestionSaldos();

				try {
					//String mensaje = gst.respaldarProductoTotal(pedcodsx, _form.getRefpentrada(), procodsx, cantidad, valorunit, valorfacunit);
					String mensaje = gst.respaldarProductoTotal(pedcodsx, "", procodsx, cantidad, valorunit, valorfacunit);
					if(!mensaje.trim().equals("Se respaldo completamente la cantidad solicitada")){
						resultado.setMensajeErrorExtensionHtml(
								resultado.getMensajeErrorExtensionHtml() +
								"<tr>" +
								"<td>"+mensaje+"</td>"+
								"<td>"+productoHolder.producto.getpromodelo()+"</td>"+
								"<td>"+productoHolder.producto.getprodescripcion()+"</td>"+
								"<td align=\"center\">"+cantidad+"</td>"+								
								"</tr>"												
								);
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
					resultado.setSuccess(false);
					resultado.setCodigoError(ERROR940NOCONOCIDO);
					resultado.setMensajeError("Error desconocido");
					return resultado;
				}
				
				/*
				referencia_pedido referenciaPedido= controlRefrenciaPedido.getreferencia_pedidoUqKey(
						pedido.getpedcodsx(), 
						productoHolder.producto.getprocodsx());
				if(referenciaPedido != null){
					referenciaPedido.setrefpcantidad(String.valueOf(productoHolder.numeroUnidades));
					referenciaPedido.setrefpvalorunit(String.valueOf(productoHolder.precioFOB));
					referenciaPedido.setrefpvalortotal(String.valueOf(Double.valueOf(productoHolder.precioFOB)*productoHolder.numeroUnidades));					
					controlRefrenciaPedido.updatereferencia_pedido(referenciaPedido);
				}else{
					
					if(controlRefrenciaPedido.crearreferencia_pedido(
							pedido.getpedcodsx(), //refpnumpedido
							productoHolder.producto.getprocodsx(), //refpproducto
							"33",//oblig refpbodega
							"PISO",//oblig refpposicion
							String.valueOf(productoHolder.numeroUnidades), // refpcantidad
							String.valueOf(productoHolder.precioFOB), //refpvalorunit
							String.valueOf(Double.valueOf(productoHolder.precioFOB)*productoHolder.numeroUnidades), //refpvalortotal
							"165089",//oblig refpentrada
							"33638",//no refpnacdetalle
							"0",//oblig refpsaldo
							"0",//no refppesoneto
							"0",//no refppesobruto
							"0",//no refppesonetototal
							"0",//no refppesobrutototal
							"0",//no refpvalorfacunit
							"0"//no refpvalorfactotal
							)){
						resultado.setSuccess(false);
					}else{
						resultado.setSuccess(false);
						resultado.setCodigoError(ERROR940NOCONOCIDO);
						resultado.setMensajeError("Error desconocido");
						return resultado;
					}
				}
				*/
				
			} catch (NumberFormatException e) {
				resultado.setSuccess(false);
				resultado.setCodigoError(ERROR940NOCONOCIDO);
				resultado.setMensajeError("Error desconocido");
				return resultado;		
				//e.printStackTrace();
			}/* catch (SQLException e) {
				resultado.setSuccess(false);
				resultado.setCodigoError(ERROR940NOCONOCIDO);
				resultado.setMensajeError("Error desconocido");
				return resultado;		
				//e.printStackTrace();
			}*/
		}
		
		if(!resultado.getMensajeErrorExtensionHtml().equals("")){
			resultado.setMensajeErrorExtensionHtml("<table  align=\"center\" width=\"98%\" border=\"0\" cellspacing=\"0\" cellpading=\"0\" class=\"tabla_listas\"><tbody>"+
					"<tr><th>Mensaje</th>"+
					"<th>Código Producto</th>"+
					"<th>Nombre producto</th>"+
					"<th>Cantidad Solicitada</th></tr>"+
					resultado.getMensajeErrorExtensionHtml()+
					"</tbody></table>");
		}
		
		//Genero el archivo
		
		
		
		String intestadoimportacion = "";
		if(resultado.getMensajeErrorExtensionHtml().equals("")){
			intestadoimportacion = "OK";
		}else{
			intestadoimportacion = "WARNING";
		}
		
		
		
		
		
		gstinterface940 controlinterface940 = new gstinterface940();		
		
		String i940usucodsx    			= usucodsx;
		String i940usulogin    			= usulogin;
		String i940intfecha    			= Fecha.getFecha();
		String i940intfilecode 			= i940codigoArchivo;
		String i940intfilename 			= rutaArchivo;
		String i940ordenPedido 			=  pedido.getpedcodsx();		
		String i940intestadoimportacion = intestadoimportacion;
		String i940intmensajeextra      = resultado.getMensajeErrorExtensionHtml();
		
		crearRegistroInterface940(i940usucodsx, 
				i940usulogin, 
				i940intfecha, 
				i940intfilecode, 
				i940intfilename, 
				i940ordenPedido,
				this.contenidoArchivo,
				i940intestadoimportacion,
				i940intmensajeextra);
		
		/*
		try {
			controlinterface940.crearinterface940(
					i940usucodsx, 
					i940usulogin, 
					i940intfecha, 
					i940intfilecode, 
					i940intfilename, 
					i940ordenPedido,
					this.contenidoArchivo,
					i940intestadoimportacion,
					i940intmensajeextra
					);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
//		controltrafico.actualiar_CIF_referencias(pedcodsx);
//		controlRefrenciaPedido.updatereferencia_pedido(entity)

		resultado.setSuccess(true);		
		return resultado;
	}	
	
	
	private String generarMensajeExtraHtmlError(String mensajeError){
		String mensajeExtra = "<div style=\" width: 26em; margin: 0 auto; font-size: 1.2em;\">"+
				"	<table>"+
				"		<tr>"+
				"			<td valign=\"middle\"><img src=\"./disenno/images/iconofail.png\" style=\"margin-right: 1em;\"/></td>"+
				"			<td valign=\"middle\">"+
				"				Error: "+mensajeError+						
				"			</td>"+
				"		</tr>"+
				"	</table>"+								
				"</div>";
		return mensajeExtra;
	}
	
		
	
	private void crearRegistroInterface940(
			String i940usucodsx,
			String i940usulogin,
			String i940intfecha,
			String i940intfilecode,
			String i940intfilename,
			String i940ordenPedido,
			String i940contenidoArchivo,
			String i940intestadoimportacion,
			String i940intmensajeextra			
			){
		try {
			
			gstinterface940 controlinterface940 = new gstinterface940();
			controlinterface940.crearinterface940(
					i940usucodsx, 
					i940usulogin, 
					i940intfecha, 
					i940intfilecode, 
					i940intfilename, 
					i940ordenPedido,
					this.contenidoArchivo,
					i940intestadoimportacion,
					i940intmensajeextra
					);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getPedcodsx() {
		return pedidoSistema;
	}

	public void setPedcodsxx(String trafcodsx) {
		this.pedcodsx = trafcodsx;
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
	
	public ResumenHolder940 getResumenArchivo(ArrayList<String[]> dataRaw){
		ResumenHolder940 resumen = new ResumenHolder940();
		for(String[] fila : dataRaw){
			if(fila[0].equals("W05")){
				resumen.depositorOrderNumber 	= fila[2];
				resumen.poNumber 				= fila[3];
			}
			else if(fila[0].equals("N1")){
				if(fila[1].equals("BT")){
					resumen.billTo 		= fila[2];
					resumen.billToId 	= fila[4];
				}			
			}
			else if(fila[0].equals("W03")){
				resumen.cantidadTotalEnviada = fila[1];
			}	
			else if(fila[0].equals("G62")){
				if(fila[1].equals("10")){
					resumen.requestedShipDate = fila[2];
				}
			}	
		}
		return resumen;
	}

	public static class ResumenHolder940{
		public String poNumber;
		public String depositorOrderNumber;
		public String billTo;
		public String billToId;
		public String requestedShipDate;
		public String cantidadTotalEnviada;		
	}
	
}
