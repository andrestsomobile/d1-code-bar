package pedido.action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import administracion.entity.usuario;
import auditoria.control.gstauditoriacargue;
import db.GstTabla;
import db.beanConnector;
import ingreso.control.gstentrada;
import ingreso.control.gstingreso;
import ingreso.entity.entrada;
import ingreso.entity.ingreso;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import maestro.control.gstcliente;
import maestro.control.gstproducto;
import maestro.control.gstsucursal;
import maestro.control.gsttransportadora;
import maestro.entity.cliente;
import maestro.entity.producto;
import maestro.entity.sucursal;
import maestro.entity.transportadora;
import nacionalizacion.control.gstnacionalizacion_detalle;
import nacionalizacion.entity.nacionalizacion_detalle;
import parametros.control.GstParametroDestinatario;
import parametros.entity.ParametroDestinatario;
import pedido.control.gestionSaldos;
import pedido.control.gstpedido;
import pedido.control.gstreferencia_pedido;
import pedido.entity.pedido;
import pedido.entity.referencia_pedido;
import util.EnviarMail;
import util.Fecha;

public final class fileAction extends Action {
	
	String pedidoscreados = "";

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String ruta_llego = request.getParameter("ruta");
		File f = new File(ruta_llego);
		// String ruta="/home/ricardo/uploads/"+f.getName();
		// String ruta="c://TMP/"+f.getName();
		HttpSession se = request.getSession(true);
		usuario usu = (usuario) se.getAttribute("usuario");
		String nombrearch = f.getName();
		nombrearch = nombrearch.substring(nombrearch.lastIndexOf("\\") + 1, nombrearch.length());
		String ruta = (String) se.getAttribute("ruta_upload") + nombrearch;// ruta donde quedo subido el archivo
		System.out.println("***********************ruta_llego:" + ruta_llego);
		System.out.println("***********************ruta:" + ruta);
		String mensaje = "";
		String observaciones = "";
		int x = 0;
		String nombreArchivo = "SGL_DATA_ERRORES_";
		String destino = "subir";
		String fechahora = Fecha.getFecha();
		String pednosub = "<br>LISTADO DE PEDIDOS NO SUBIDOS<br>" + "\n" + "\n";
		String refnosub = "\n" + "<br>LISTADO DE REFERENCIAS <br>" + "\n";
		String pedfechasistema2 = "";
		int count = 0;
		int ped2 = 0;
		System.out.println("***********************archivo original");
		
		int auccodsx = 0;
		gstauditoriacargue gaud = new gstauditoriacargue();
		String actividad = "Cargue Pedidos";
		String fechaaud = Fecha.getFecha();
		
		String pedcompania = request.getParameter("compania");
		
		try {
			
			auccodsx = gaud.crearauditoriacargue(pedcompania, actividad, fechaaud, "Iniciando...", usu.getusucodsx(), nombrearch);

			String nomrearchivoexcel = "ConfirmacionPedido" + Fecha.getFechaSinHora() + "_" + Fecha.getHora() + ".xls";
			nomrearchivoexcel = nomrearchivoexcel.replaceAll(":", "");
			File archivoexcel = new File((String) se.getAttribute("ruta_upload") , nomrearchivoexcel);
			WritableWorkbook book = Workbook.createWorkbook(archivoexcel);
			WritableFont letra = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD);
			WritableCellFormat format = new WritableCellFormat(letra);
			NumberFormat numero = new jxl.write.NumberFormat ("#,##0");
			WritableCellFormat formatonumero = new jxl.write.WritableCellFormat (numero);  
			WritableSheet hoja = book.createSheet("RECHAZADOS", 0);
			WritableSheet hoja1 = book.createSheet("PROCESADOS", 1);
			coleccionProcesados listaprocesados = new coleccionProcesados();
			coleccionRechazados listarechazados = new coleccionRechazados();
			int col = 0;
			int renglon = 0;
			String texto = "";
			String contenedor[];
			int i, j, comas = 0, contadorComas = 0;
			FileReader fr = new FileReader(ruta);
			BufferedReader entrada = new BufferedReader(fr);
			String s;
			boolean resp = true;
			
			// beanConnector db = new beanConnector(false);
			gstauditoriacarguepedido gaucp = new gstauditoriacarguepedido();
			HashMap<String, String> listPedidos = new HashMap<String, String>();
			try {
				while ((s = entrada.readLine()) != null) {
					System.out.println("TRY WHILE =" + resp);
					if (s != "\n") {
						texto += s + "  \n";
						contenedor = s.split(";");
						if ((contenedor.length >= 1) && (contenedor.length < 8)) {
							pednosub += "<br>El pedido con datos " + contenedor[0] + " presenta inconsistencias Observaciones espacios en blanco\n";
						}
						System.out.println("LONGITUD DE CONTENEDOR antes if =" + contenedor.length);
						if (contenedor.length >= 8) {
							System.out.println("LONGITUD DE CONTENEDOR =" + contenedor.length);
							// //////validaciones...
							// //////////////////////////codigo capturar variables
							// La compañia se pide por parametro
							// String pedcompania = "1";
							
							String bbbodega = request.getParameter("bodega");

							String pednumpedido = contenedor[0];// VARIABLE 1
							String pedordencompra = contenedor[1];// VARIABLE 2
							//2015-10-27. LTA. Solicitan que en lugar de colocar PLANO en la guia se almacene el NUMPEDIDO
							//String pedguia = "PLANO";
							String pedguia = pednumpedido;
							String pedfechasistema = Fecha.getFecha();
							nombreArchivo += Fecha.getFecha();
							// System.out.println("NOMBRE DEL ARCHIVO---"+nombreArchivo);
							String pedfecha = Fecha.getFechaSinHora();
							pedfechasistema2 = Fecha.getFechaSinHora();

							// /////partir fecha
							String cad1 = "";
							String cad2 = "";
							// String cad3="";
							for (int j1 = 0; j1 < contenedor[2].length(); j1++) {
								if (j1 <= 9) {
									cad1 += contenedor[2].charAt(j1);
								}
								if (j1 > 9) {
									cad2 += contenedor[2].charAt(j1);
								}
							}
							// contenedor[2]=cad1+" "+cad2;
							contenedor[2] = cad1;
							String pedfechavenc = contenedor[2];// VARIABLE 3
							// System.out.println("SALIDA DE VARIABLE FECHA EN VIVO----------------> "+contenedor[2]);
							// /////////////////
							String pedfechacita = Fecha.getFechaSinHora();
							String pedhoracita = "00:00";
							String pedcliente = "";
							String peddireccion = "";
							String pedciudad = "";
							String peddepartamento = "";
							// String pedsucursal = contenedor[3];
							String pedsucursal = contenedor[3];// VARIABLE 4
							String pedobservaciones = "";
							String pedfactura = "1";
							String pedestado = "TRAMITE";
							String pedsubtotal = "0";
							String pediva = "0";
							String peddescuento = "0";
							String pedtotal = "0";
							String pedtipo = "NAC";
							// destino = "pedido_datos";
							String pedpicking = null;
							String pedhora = Fecha.getHora();
							// /////////////////////////////////variables de referencia
							// String pedcodsx =
							String promodelo = contenedor[5];// VARIABLE 5
							// String procodsx =contenedor[5];
							String cantidad = contenedor[6]; // VARIABLE 6
							String valorunit = contenedor[7];// VARIABLE 7
							String valorfacunit = "0";
							if (contenedor.length >= 9) {
								valorfacunit = contenedor[8];// VARIABLE 8
								if (valorfacunit != null ) {
									valorfacunit = valorfacunit.trim();
								}
								if (valorfacunit == null || (valorfacunit != null && valorfacunit.equals("")) ) valorfacunit = "0";
							}
							System.out.println("valorfacunit :" + valorfacunit + "++");
							// /////////////////////////////////
							String pedzona = "5";
							String pedcausal_hit = "1";
							String pedporc_iva = "16";
							String pedtransportadora = contenedor[9];// VARIABLE 9;
							String pedfechaalistamiento = contenedor[10];// VARIABLE 10
							String pedfechadespacho = contenedor[11];// VARIABLE 11 
							String pedfechaentrega = contenedor[12];// VARIABLE 12
							if (pedtransportadora != null && !pedtransportadora.equals("")) {
								gsttransportadora gtrans = new gsttransportadora();
								transportadora tra = gtrans.gettransportadora_by_ukey(pedtransportadora);
								if (tra != null) {
									pedtransportadora = tra.gettranspcodsx();
								} else {
									pedtransportadora = null;
								}
							}
							// gstpedido gped = new gstpedido(db);
							// gestionSaldos gsaldo = new gestionSaldos();
							// gstpicking gpick = new gstpicking(db);
							int sa = contenedor.length;
							// System.out.println("-----CANTIDAD DE ELEMENTOS DEL CONTENEDOR"+sa);

							// if((((contenedor[0]!="")&&(contenedor[1]!=""))&&((contenedor[2]!="")&&(contenedor[3]!="")))&&(((contenedor[4]!="")&&(contenedor[5]!=""))&&((contenedor[6]!="")&&(contenedor[7]!=""))))
							// {
							gestionSaldos gst = new gestionSaldos();
							// ////////////////////////////////////////NUEVO CODIGO DE VALIDACIONES DE VARIABLES DE ENTRADA
							// ////////////////************/******** *****************/////////////////////////
							// ///////////////////////////////////////////////////////////////////////////////
							gstproducto gpro = new gstproducto();
							producto pro = null; 
							pro = gpro.getproductoByUk(pedcompania, promodelo);
							
							//INICIALIZA PEDIDO SIN ERROR
							if(listPedidos.get(pednumpedido) == null || listPedidos.get(pednumpedido).equals("0")) {
								listPedidos.put(pednumpedido, "1");
							}
							
							
							boolean nroPed = ControlNroPedidoValidaciones(pednumpedido);// /var 0
							if (nroPed == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato " + pednumpedido + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato " + pednumpedido, format));
								renglon++;
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato " + pednumpedido,auccodsx);
								listPedidos.put(pednumpedido, "0");
							}
							if (pedordencompra == "") {
								pedordencompra = "Sin O.C.";// /var 1
							}
							boolean resultadofechas = Fecha.compararErroFechaVenci(pedfechavenc);// var 2
							if (resultadofechas == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato " + pedfechavenc + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato " + pedfechavenc, format));
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato " + pedfechavenc,auccodsx);
							}
							gstsucursal con_sucursal2 = new gstsucursal();// var 3
							int sucursal = con_sucursal2.getcountsucursal(pedsucursal);// var 3
							boolean succod = true;// var 3
							if (sucursal == 1) {
								succod = false;// var 3
								gstsucursal con_sucursal = new gstsucursal();
								sucursal entity = con_sucursal.getsuccodcursal(pedsucursal);
								if (entity == null) {
									pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Sucursal sin padre" + pedsucursal + "\n";
									col = 0;
									hoja.addCell(new Label(col++, renglon, pednumpedido, format));
									hoja.addCell(new Label(col++, renglon, promodelo, format));
									hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
									hoja.addCell(new Label(col++, renglon, cantidad, format));
									hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
									hoja.addCell(new Label(col++, renglon, "Sucursal sin padre" + pedsucursal, format));
									renglon++;
									listPedidos.put(pednumpedido, "0");
									rechazado _rechazado = new rechazado(pednumpedido);
									listarechazados.add(_rechazado);
									gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Sucursal sin padre" + pedsucursal,auccodsx);
								} else {
									pedcliente = entity.getsuccodcliente();
									peddireccion = entity.getsucdireccion();
									pedciudad = entity.getsucciudad();
									peddepartamento = entity.getsucdepartamento();
									pedsucursal = entity.getsuccodsx();
								}

							}
							if (succod == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato el codigo de sucursal se repite o no existe " + pedsucursal + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato el codigo de sucursal se repite o no existe " + pedsucursal, format));
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato el codigo de sucursal se repite o no existe " + pedsucursal,auccodsx);
							}
							gstpedido objetocontsucur = new gstpedido();
							// int a=objetocontsucur.getPedidoRefPromodelo(promodelo);//var 5
							// Feb 02 de 2012. Se valida el modelo para la compañia del pedido.
							
							int a = objetocontsucur.getPedidoRefPromodeloCia(pedcompania, promodelo);// var 5
							boolean modelos = true;
							if (a == 1) {
								modelos = false;			
							}
							if (modelos == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato el codigo o modelo de producto no existe " + promodelo + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato el codigo o modelo de producto no existe " + promodelo, format));								
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato el codigo o modelo de producto no existe " + promodelo,auccodsx);

							}

							boolean resNrocant = ControlEntradaNrosCant(cantidad);// var 6
							if (resNrocant == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato " + cantidad + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato " + cantidad, format));								
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato " + cantidad,auccodsx);
							}
							boolean resNroU = ControlEntradaNrosVlorU(valorunit);// var 7
							// System.out.println("\nRESPUESTA DE VALOR UNITARIO -------------------------------------> "+resNroU);
							if (resNroU == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato " + valorunit + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato " + valorunit, format));								
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato " + valorunit,auccodsx);
							}
							//boolean resValFacU = ControlEntradaNrosVlorU(valorfacunit);// var 8
							// System.out.println("\nRESPUESTA DE VALOR UNITARIO -------------------------------------> "+resNroU);
							/*if (resValFacU == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato " + valorfacunit + "\n";
							}*/
							//if ((((nroPed == false) && (resultadofechas == false)) && ((succod == false) && (modelos == false))) && ((resNrocant == false) && (resNroU == false))) {
							boolean resultadofecha_alistamiento = Fecha.compararErroFechaVenci(pedfechaalistamiento);
							if (resultadofecha_alistamiento == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato fecha alistamiento " + pedfechaalistamiento + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato fecha alistamiento " + pedfechaalistamiento, format));								
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato fecha de alistamiento " + pedfechaalistamiento,auccodsx);

							}
							boolean resultadofecha_despacho = Fecha.compararErroFechaVenci(pedfechadespacho);
							if (resultadofecha_despacho == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato fecha despacho " + pedfechadespacho + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato fecha despacho " + pedfechadespacho, format));								
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato fecha de despacho " + pedfechadespacho,auccodsx);

							}
							boolean resultadofecha_entrega = Fecha.compararErroFechaVenci(pedfechaentrega);
							if (resultadofecha_entrega == true) {
								pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta inconsistencias ; Observacion : Verifique El dato fecha entrega " + pedfechaentrega + "\n";
								col = 0;
								hoja.addCell(new Label(col++, renglon, pednumpedido, format));
								hoja.addCell(new Label(col++, renglon, promodelo, format));
								hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
								hoja.addCell(new Label(col++, renglon, cantidad, format));
								hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
								hoja.addCell(new Label(col++, renglon, "Verifique El dato fecha entrega " + pedfechaentrega, format));								
								renglon++;
								listPedidos.put(pednumpedido, "0");
								rechazado _rechazado = new rechazado(pednumpedido);
								listarechazados.add(_rechazado);
								gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Verifique El dato fecha de entrega " + pedfechaentrega,auccodsx);

							}
							if ( nroPed == false && resultadofechas == false && succod == false && modelos == false && resNrocant == false && resNroU == false
									 && resultadofecha_alistamiento == false && resultadofecha_despacho == false) {
								// System.out.println("CREADAS LA CONDICIONES PARA INGRESO AL IF");
								// ///////////////////////////////////////////////////////////////////////////
								// ////////////////**************** *****************////////////////////////
								// ///////////////////////////////////////FIN DE CODIGO DE VALIDACIONES
								try {
									gstpedido gped = new gstpedido();

									count = gped.getPedidoCount(pedcompania, pednumpedido);
									// count= parseInt("count");
									// System.out.println(" ifantes ENSAYO******************"+count);
									// if(count=="0")

									// System.out.println("*************VALOR DE LA VARIABLE----------A CUANDO EXISTE EL PEDIDIO"+a);
									if (count == 0) {
										try {

											System.out.println("PEDIDO CREADO "+pednumpedido);
											resp &= gped.crearpedido(pedcompania, pednumpedido, pedordencompra, pedguia, pedfechasistema, pedfecha, pedfechavenc, pedfechacita, pedhoracita, pedcliente, pedsucursal, peddireccion, pedciudad, peddepartamento, pedobservaciones, pedfactura, pedestado,
													pedsubtotal, pediva, peddescuento, pedtotal, pedtipo, pedpicking, pedhora, pedzona, pedcausal_hit, pedporc_iva, pedtransportadora, pedfechaalistamiento, pedfechadespacho, pedfechaentrega);
											pedidoscreados = pedidoscreados + pednumpedido + ",";
											// System.out.println("despues ENSAYO******************"+count);
										} catch (SQLException e) { 
											e.printStackTrace();
											// mensaje += "No se pudo Crear el pedido:  "+pednosub+ e.getLocalizedMessage();
											// observaciones+= "\nNo se pudo Crear el pedido:  "+pednosub;
											pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " presenta error: " + e.getLocalizedMessage() + "\n";
											col = 0;
											hoja.addCell(new Label(col++, renglon, pednumpedido, format));;
											hoja.addCell(new Label(col++, renglon, promodelo, format));
											hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
											hoja.addCell(new Label(col++, renglon, cantidad, format));
											hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
											hoja.addCell(new Label(col++, renglon, "Error: " + e.getLocalizedMessage(), format));
											renglon++;
											listPedidos.put(pednumpedido, "0");
											rechazado _rechazado = new rechazado(pednumpedido);
											listarechazados.add(_rechazado);
											gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Error: " + e.getLocalizedMessage(),auccodsx);

											 System.out.println(mensaje);
										}
									}

									pedido ped = gped.getpedido(pedcompania, pednumpedido);

									/********************** Si el pedido esta en tramite no crea la referencia ni cargo las entradas *************************************************************/
									if (ped != null && ped.getpedestado().equals("TRAMITE") && estaenlista(pednumpedido)) {
										// System.out.println("***********************************---------"+ped.getpedcodsx());
										// String procodsx=gped.getPedidoCod(promodelo);
										// Feb 02 de 2012. Se valida el modelo para la compañia del pedido.
										String procodsx = gped.getPedidoCodCia(pedcompania, promodelo);
										// ////////////////////referencia
										String pedcodsx = ped.getpedcodsx();

										if (count > 0) {
											pednosub += "<br>el pedido " + pednumpedido + " Modelo " + promodelo + " existe" + "\n";
										}
										// gst.respaldarProductoTotalFile(pedcodsx, null, procodsx, cantidad, valorunit);
										// ////////////////para duplicacion de entradas
										// gstpedido gpedestado2 = new gstpedido();
										// String pedestadofin="TRAMITE";
										// int count2;
										// count2 = gpedestado2.getPedidoCountEstado(pedcompania, pednumpedido,pedestadofin);
										// if(count2!=1)

										// ///////////////////////////////
										gstproducto gprod = new gstproducto();
										gstentrada gent = new gstentrada();
										gstreferencia_pedido grefp = new gstreferencia_pedido();
										gstnacionalizacion_detalle gnacdet = new gstnacionalizacion_detalle();
										gstingreso ging = new gstingreso();
										// resp & = this.respaldarProductoTotalFileNAC(pedcodsx, entcodsx, procodsx, cantidad, valorunit);
										// con el producto y el tipo de saldo saco la lista de entradas que tengan saldo del tipo seleccionado:
										Collection entradas = null;
										// System.out.println("---->"+cantidad);
										BigDecimal faltante = new BigDecimal(cantidad);
										// System.out.println("---->"+valorunit);
										BigDecimal valunit = new BigDecimal(valorunit);
										BigDecimal valfacunit = new BigDecimal(valorfacunit);
										// System.out.println("---->fin");
										BigDecimal total_respaldado = new BigDecimal("0");
										// System.out.println("!!!!!!!!!!!!!!!!------->pedido---"+pedcodsx);
										// pedido ped = gped.getpedido(pedcodsx);
										// System.out.println("!!!!!!!!!!!!!!!!------->cliente---"+ped.getpedcliente());
										cliente cli = new gstcliente().getcliente(ped.getpedcliente());
										/*
										 * gstcompania gcom = new gstcompania(); String cominventario = gcom.getcompania(ped.getpedcompania()).getCominventario(); System.out.println ("Manejo Inventario= "+cominventario); if (cominventario.equals("A")) {
										 */
										// ojo con esto ///entradas = gent.getlistaentrada_Bodega(procodsx, "NAC", bodega);
										entradas = gent.getlistaentradaFIFO(procodsx, "NAC");
										/*
										 * } else { entradas = gent.getlistaentradaManual(entcodsx); }
										 */
										Iterator ite = entradas.iterator();
										while (ite.hasNext() && !faltante.equals(BigDecimal.ZERO)) {
											entrada ent = (entrada) ite.next();
											// System.out.println("entrada:"+ent.getentcodsx());
											/***********************************************************************************************************************************************************************************************************************************************************************************************
											 * MODIFICACION PARA QUE SI EL CLIENTE NO RECIBE DEVOLUCIONES, Y LA ENTRADA ES DE UN INGRESO POR DEVOLUCION, LO SALTE
											 */
											ingreso ing = ging.getingreso(ent.getentcodingreso());
											if (cli.getClidevolucion().equals("N") && ing.getingtipo().equals("DEVOLUCION"))
												continue;
											// System.out.println("***********entrada uno");
											BigDecimal saldo_ent = new BigDecimal(ent.getentsaldonac());
											if (saldo_ent.compareTo(BigDecimal.ZERO) == 0)
												continue; // si el saldo es cero no hago nada
											// System.out.println("***********entrada dos");
											if (faltante.compareTo(saldo_ent) >= 0) {
												faltante = faltante.subtract(saldo_ent);
												// en el campo codproducto coloco el codsx de la tabla nacionalizaciondetalle... si es de tipo devolucion
												// o despiece esto sale null
												String nacdetalle = ent.getentcodproducto();
												BigDecimal total = saldo_ent.multiply(valunit);
												BigDecimal totalfac = saldo_ent.multiply(valfacunit);
												BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(saldo_ent);
												BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(saldo_ent);
												// System.out.println("***********entrada tres insersion");
												// resp &=grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), saldo_ent.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, saldo_ent.toPlainString(), ent.getentpesoneto(),
												// ent.getentpesobruto(), neto.toPlainString(), bruto
												// .toPlainString());

												ped2 = gped.getPedidoRef(promodelo, pedcodsx);
												// ////
												// ///metodo para verificacion si el pedido exist y esta en TRAMITE-FINALIZADO
												gstpedido gpedestado = new gstpedido();
												String pedestadofin = "TRAMITE";
												count = gpedestado.getPedidoCountEstado(pedcompania, pednumpedido, pedestadofin);
												if (count == 1) {
													try {
														Double uniEmpaque = Double.parseDouble(pro.getprouniempaque());
														Double valorUnitario = 0.0;
														Double valorDeclarado = 0.0;
														
														if(pro.getProvalorunitario() != null && !pro.getProvalorunitario().isEmpty()) {
															valorUnitario = Double.parseDouble(pro.getProvalorunitario());
															valorDeclarado = (uniEmpaque * saldo_ent.intValue()) * valorUnitario;
														}
														
														grefp.crearreferenciaPedidoValorDeclarado(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), saldo_ent.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, saldo_ent.toPlainString(), ent.getentpesoneto(), ent
																.getentpesobruto(), neto.toPlainString(), 
																bruto.toPlainString(), valorfacunit,
																totalfac.toPlainString(), valorDeclarado.toString());
														procesado _procesado = new procesado(pednumpedido, promodelo, pro.getprodescripcion(), saldo_ent.intValue());
														listaprocesados.add(_procesado);
													} catch (SQLException e) {
														e.printStackTrace();
														listPedidos.put(pednumpedido, "0");
														// mensaje += "No se pudo Crear el Referencias con Modelo:  "+refnosub+ e.getLocalizedMessage();
														// observaciones += "\nNo se pudo Crear el Referencias con Modelo:  "+refnosub;
													}
												}
												if ((ped2 > 0) && (count == 1)) {
													refnosub += "\nPedido " + pednumpedido + " Modelo Replicado en BD : " + promodelo + "<br>";
												}
												if (count == 0) {
													refnosub += "\nPedido " + pednumpedido + " Modelo : " + promodelo + " Este pedido se encuentra en estado FINALIZADO<br>";
													col = 0;
													hoja.addCell(new Label(col++, renglon, pednumpedido, format));
													hoja.addCell(new Label(col++, renglon, promodelo, format));
													hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
													hoja.addCell(new Label(col++, renglon, cantidad, format));
													hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
													hoja.addCell(new Label(col++, renglon, "Pedido se encuentra en estado FINALIZADO", format));
													renglon++;
													listPedidos.put(pednumpedido, "0");
													rechazado _rechazado = new rechazado(pednumpedido);
													listarechazados.add(_rechazado);
													gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Pedido se encuentra en estado FINALIZADO",auccodsx);

												}

												// miro si el nacdetalle es diferente de nulo para restarle el saldo:
												if (nacdetalle != null) {
													nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
													nacd.setNadsaldo("0");
													gnacdet.updatenacionalizacion_detalle(nacd);
													// System.out.println("***********entrada cuatro");
												}
												entrada entor = gent.getentrada(ent.getentcodsx());
												// System.out.println("------------------------------><<<"+entor.getentsaldonac());
												BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
												saldonacor = saldonacor.subtract(saldo_ent);
												entor.setentsaldonac(saldonacor.toPlainString());
												gent.updateentrada(entor);
												total_respaldado = total_respaldado.add(saldo_ent);

											} else {
												saldo_ent = saldo_ent.subtract(faltante);
												String nacdetalle = ent.getentcodproducto();
												BigDecimal total = faltante.multiply(valunit);
												BigDecimal totalfac = faltante.multiply(valfacunit);
												// System.out.println("***********entrada cinco");
												BigDecimal neto = new BigDecimal(ent.getentpesoneto()).multiply(faltante);
												BigDecimal bruto = new BigDecimal(ent.getentpesobruto()).multiply(faltante);
												// resp &=grefp.crearreferencia_pedido(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), faltante.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, faltante.toPlainString(), ent.getentpesoneto(),
												// ent.getentpesobruto(), neto.toPlainString(), bruto
												// .toPlainString());
												// int ped2=0;
												ped2 = gped.getPedidoRef(promodelo, pedcodsx);
												// //
												// //verificacion de estado tramite
												gstpedido gpedestado = new gstpedido();
												String pedestadofin = "TRAMITE";
												count = gpedestado.getPedidoCountEstado(pedcompania, pednumpedido, pedestadofin);

												if (count == 1) {
													try {
														Double uniEmpaque = Double.parseDouble(pro.getprouniempaque());
														Double valorUnitario = 0.0;
														Double valorDeclarado = 0.0;
														
														if(pro.getProvalorunitario() != null && !pro.getProvalorunitario().isEmpty()) {
															valorUnitario = Double.parseDouble(pro.getProvalorunitario());
															valorDeclarado = (uniEmpaque * faltante.intValue()) * valorUnitario;
														}
														
														grefp.crearreferenciaPedidoValorDeclarado(pedcodsx, procodsx, ent.getEntbodega(), ent.getentposicion(), faltante.toPlainString(), valorunit, total.toPlainString(), ent.getentcodsx(), nacdetalle, faltante.toPlainString(), ent.getentpesoneto(), ent
																.getentpesobruto(), neto.toPlainString(), bruto.toPlainString(), valorfacunit, totalfac.toPlainString(), valorDeclarado.toString());
														procesado _procesado = new procesado(pednumpedido, promodelo, pro.getprodescripcion(), faltante.intValue());
														listaprocesados.add(_procesado);
													} catch (SQLException e) {
														e.printStackTrace();
														listPedidos.put(pednumpedido, "0");
														// mensaje = "No se pudo Crear Referencias con Modelo: <br> "+refnosub+ e.getLocalizedMessage();
														// mensaje += "No se pudo Crear Referencias con Modelo:  "+ e.getLocalizedMessage();

													}
												}
												if ((ped2 > 0) && (count == 1)) {
													refnosub += "\nPedido " + pednumpedido + " Modelo Replicado en BD : " + promodelo + "\n<br>";
												}
												if (count == 0) {
													refnosub += "\nPedido " + pednumpedido + " Modelo : " + promodelo + " Este pedido se encuentra en estado FINALIZADO<br>";
													col = 0;
													hoja.addCell(new Label(col++, renglon, pednumpedido, format));
													hoja.addCell(new Label(col++, renglon, promodelo, format));
													hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
													hoja.addCell(new Label(col++, renglon, cantidad, format));
													hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
													hoja.addCell(new Label(col++, renglon, "Pedido se encuentra en estado FINALIZADO", format));
													renglon++;
													listPedidos.put(pednumpedido, "0");
													rechazado _rechazado = new rechazado(pednumpedido);
													listarechazados.add(_rechazado);
													gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad+"", "RECHAZADO","Pedido se encuentra en estado FINALIZADO",auccodsx);

												}
												// System.out.println("nacdetalle"+nacdetalle);
												if (nacdetalle != null) {
													nacionalizacion_detalle nacd = gnacdet.getnacionalizacion_detalle(nacdetalle);
													nacd.setNadsaldo(saldo_ent.toPlainString());
													gnacdet.updatenacionalizacion_detalle(nacd);
													// System.out.println("***********entrada seix");
												}
												// System.out.println("solicito:"+ent.getentcodsx());
												entrada entor = gent.getentrada(ent.getentcodsx());
												// System.out.println("trajo:"+entor.getentcodsx());
												// System.out.println("entor "+entor.getentsaldonac());
												BigDecimal saldonacor = new BigDecimal(entor.getentsaldonac());
												// System.out.println("saldonacor "+saldonacor);
												saldonacor = saldonacor.subtract(faltante);
												// System.out.println("saldonacor2 "+saldonacor);
												entor.setentsaldonac(saldonacor.toPlainString());

												gent.updateentrada(entor);

												faltante = BigDecimal.ZERO;
												// System.out.println("***********entrada siete");
												total_respaldado = total_respaldado.add(faltante);
											}

											// ahora, voy a la entrada original y le resto la cantidad que esta saliendo

											if (faltante.compareTo(BigDecimal.ZERO) == 0)
												break;
										}// fin while

										if (faltante.compareTo(BigDecimal.ZERO) > 0) {
											// mensaje += "<br>Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo nacionalizado no fue suficiente<br>";
											observaciones += "<br>\nPedido " + pednumpedido + " Modelo " + promodelo + " Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo nacionalizado no fue suficiente";
											col = 0;
											hoja.addCell(new Label(col++, renglon, pednumpedido, format));
											hoja.addCell(new Label(col++, renglon, promodelo, format));
											hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
											hoja.addCell(new Label(col++, renglon, cantidad, format));
											hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
											hoja.addCell(new Label(col++, renglon, "Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo nacionalizado no fue suficiente", format));
											renglon++;
											listPedidos.put(pednumpedido, "0");
											rechazado _rechazado = new rechazado(pednumpedido);
											listarechazados.add(_rechazado);
											gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Se respaldo un Total de " + total_respaldado.toPlainString() + ", El saldo nacionalizado no fue suficiente",auccodsx);

											// "Pedido "+pednumpedido++promodelo+"\n<br>";
										}
										/******** Fin pedido tramite **************************************************/
									} else if (ped != null && ped.getpedestado().equals("TRAMITE") && !estaenlista(pednumpedido)) {
										pednosub += "<br>\n El Pedido " + pednumpedido + " Modelo : " + promodelo + " ya existe<br>";
									} else if (ped != null && ped.getpedestado().equals("FINALIZADO")) {
										pednosub += "<br>\n El Pedido " + pednumpedido + " Modelo : " + promodelo + " se encuentra en estado FINALIZADO<br>";
										col = 0;
										hoja.addCell(new Label(col++, renglon, pednumpedido, format));
										hoja.addCell(new Label(col++, renglon, promodelo, format));
										hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
										hoja.addCell(new Label(col++, renglon, cantidad, format));
										hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
										hoja.addCell(new Label(col++, renglon, "Pedido se encuentra en estado FINALIZADO", format));
										renglon++;
										listPedidos.put(pednumpedido, "0");
										rechazado _rechazado = new rechazado(pednumpedido);
										listarechazados.add(_rechazado);
										gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "Pedido se encuentra en estado FINALIZADO",auccodsx);

									}
								} catch (SQLException e) {
									e.printStackTrace();
									// mensaje += "No se pudo Crear el pedido:  " + e.getLocalizedMessage();
									observaciones += "<br>\nPedido " + pednumpedido + " Modelo " + promodelo + " No se pudo Crear el pedido:  ";
									col = 0;
									hoja.addCell(new Label(col++, renglon, pednumpedido, format));
									hoja.addCell(new Label(col++, renglon, promodelo, format));
									hoja.addCell(new Label(col++, renglon, pro != null ? pro.getprodescripcion():"", format));
									hoja.addCell(new Label(col++, renglon, cantidad, format));
									hoja.addCell(new Label(col++, renglon, "RECHAZADO", format));
									hoja.addCell(new Label(col++, renglon, "No se pudo Crear el pedido", format));
									renglon++;
									listPedidos.put(pednumpedido, "0");
									rechazado _rechazado = new rechazado(pednumpedido);
									listarechazados.add(_rechazado);
									gaucp.crear(usu.getusucodsx(), nombrearch, pednumpedido, promodelo,pro != null ? pro.getprodescripcion():"", cantidad, "RECHAZADO", "No se pudo Crear el pedido",auccodsx);

								}
								// }
								// else
								// mensaje = "No se pudo Crear el pedido falta de datos: <br> "+pednosub;

								// System.out.println("\t"+contenedor[0]);
								comas++;
							}
							// ///////aqui cierran las validaciones
						}

					}// //aqui termina el if de salto de linea
				}

				// if(resp)db.commit();
				// else db.rollback();
				System.out.println("CANTIDAD FILAS FIN :"+listPedidos.size() + " " + listaprocesados.size());
				// se borran los pedidos rechazados que se alcazaron a crear;
				 beanConnector db = new beanConnector(false);
				 gstpedido gped = new gstpedido(db);
				 boolean resp_borre = true;

				 gstreferencia_pedido grefp = new gstreferencia_pedido(db);
				 gstproducto gstProducto = new gstproducto(db);
				 
				try {
					GstParametroDestinatario paramDestinatario = new GstParametroDestinatario();
					ParametroDestinatario param = paramDestinatario.getParametroDestinatario("valor_declarado");
					String cuerpo = param.getCuerpo();
					
					for (Map.Entry<String, String> entry : listPedidos.entrySet()) {
						if(entry.getValue().equals("1")) {
							String cuerpoPedido = cuerpo;
							String pedido = entry.getKey();
							String asunto = param.getAsunto().replace("$pedido", pedido);
							pedido ped = gped.getpedido(pedcompania, pedido);
							Collection refPedidos = grefp.getlistareferencia_pedido(ped.getpedcodsx());
							
							for(Object ref: refPedidos) {
								referencia_pedido rp = (referencia_pedido) ref;
								producto p = gstProducto.getproducto(rp.getrefpproducto());
								cuerpoPedido = cuerpoPedido.replace("$pedido", "<b>Pedido:</b> "+pedido+"<br>");
								cuerpoPedido = cuerpoPedido.replace("$productos", "<b>Productos:</b>" + p.getpromodelo() +"<br>");
								cuerpoPedido = cuerpoPedido.replace("$valorDeclarado", "<b>Valor Declarado:</b>" + rp.getRefpvalordeclarado()+"<br>");
							}
							
							
							System.out.println("enviar pedido " + pedido);
							EnviarMail mail = new EnviarMail();
							System.out.println("getCorreos " + param.getCorreos());
							System.out.println("getAsunto " + param.getAsunto());
							System.out.println("cuerpoPedido " + cuerpoPedido);
							mail.enviarMailValor(param.getCorreos(), param.getAsunto(), cuerpoPedido);
						}
					    System.out.println("clave=" + entry.getKey() + ", valor=" + entry.getValue());
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Error al enviar correo" + e.getMessage());
				}
				
				
				renglon = 0;
				 for (int y = 0; y < listaprocesados.size(); y++) {
					if (!listarechazados.contains(new rechazado(listaprocesados.get(y).getPedido()))) { 
						col = 0;			
						System.out.println("pedidos procesados: " +  listaprocesados.get(y).getPedido());
						hoja1.addCell(new Label(col++, renglon, listaprocesados.get(y).getPedido(), format));
						hoja1.addCell(new Label(col++, renglon, listaprocesados.get(y).getPromodelo(), format));
						hoja1.addCell(new Label(col++, renglon, listaprocesados.get(y).getDescripcion(), format));
						hoja1.addCell(new Label(col++, renglon, listaprocesados.get(y).getCantidad()+"", formatonumero));
						hoja1.addCell(new Label(col++, renglon, "OK", format));
						renglon++;
						gaucp.crear(usu.getusucodsx(), nombrearch, listaprocesados.get(y).getPedido(), listaprocesados.get(y).getPromodelo(), listaprocesados.get(y).getDescripcion(), listaprocesados.get(y).getCantidad()+"", "OK", "",auccodsx);
					}
				 }
				 
				 for (int y = 0; y < listarechazados.size(); y++) {					 
					 pedido miped = gped.getpedido(pedcompania, listarechazados.get(y).getPedido());
					 if (miped != null && miped.getpedestado().equalsIgnoreCase("TRAMITE")) {
						 System.out.println("Borrando pedido: " +  listarechazados.get(y).getPedido());
						 resp_borre &= grefp.eliminarReferenciasPedido(miped.getpedcodsx());
						 resp_borre &= gped.eliminar(miped.getpedcodsx());
						 if (resp_borre) {
							 
						 }
				 	 }
				 }
				 db.commit();
				 
				 
				book.write();
				book.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// System.out.println("cantidad de caracteres: "+comas);
		} catch (java.io.FileNotFoundException fnfex) {
			fnfex.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		// ////////////////////////////////////////////////fin datos plano
		// }
		// mensaje = "Archivo plano de pedidos creado con Exito";
		// System.out.println("errores pedido*********"+pednosub);
		// System.out.println("errores referencia*********"+refnosub);
		// ///////////////////////////////////////////////////errores
		try {
			// java.io.File dir = new File("c:/Test");
			// Si el directorio TMP existe, la siguente instruccion crea el directorio C:\TMP\Test
			// dir.mkdir();
			// FileWriter fw = new FileWriter("c://TMP/error.txt");
			// FileWriter fw = new FileWriter("c://TMP/"+Fecha.getFechaSinHora()+Fecha.getHora()+".txt");
			String nfw = "erroresJDE" + Fecha.getFechaSinHora() + "_" + Fecha.getHora() + ".txt";
			nfw = nfw.replaceAll(":", "");
			FileWriter fw = new FileWriter((String) se.getAttribute("ruta_upload") + nfw);

			BufferedWriter bw = new BufferedWriter(fw);
			PrintWriter salida = new PrintWriter(bw);
			String a = "error 1 : aja" + "\n" + "error 2 : aja" + "\n" + "error 3 : aja" + "\n" + "error 4 : aja" + "\n" + "error 5 : aja" + "\n" + "error 6 : aja" + "\n" + "error 7 : aja" + "\n";
			salida.println("BLOC DE ERRORES JDE-SGL " + "FECHA : " + fechahora + "\n<br>" + "<br>OBSERVACIONES :<br>" + "\n" + observaciones + "\n<br>" + "\n<br>" + pednosub + "\n<br>" + refnosub);
			salida.close();
			mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones Verifique Bloc de Errores";
			// System.out.println("codogo donde  se vrea el bloc de errores");
		} catch (java.io.IOException ioex) {
			System.out.println("se presento el error: " + ioex.toString());
		}
		// ////////////////////////////////////////////////////////////
		mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones Verifique Bloc de Errores";
		System.out.println(mensaje);
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		System.out.println(destino);
		return mapping.findForward(destino);
	}

	private int parseInt(String count) {
		// TODO Auto-generated method stub
		if (count != "1") {
			// System.out.println("-----------------****************entro al if parseint");
			return 0;
		} else
			return 1;

	}

	// //////////////////////////////////////
	// //////////NUEVOS METODOS/////////////
	// //****** */////////
	public static boolean ControlNroPedidoValidaciones(String pednumpedido) {
		// String pednumpedido="1amy";
		int count = 0;
		int count2 = 0;
		boolean numped = false;
		byte arregloByte[] = new byte[pednumpedido.length()];
		for (int i = 0; i < pednumpedido.length(); i++) {
			arregloByte[i] = (byte) pednumpedido.charAt(i);
			// System.out.println("\n caracter "+arregloByte[i]);
			if (((arregloByte[i] > 47) && (arregloByte[i] < 58) || ((arregloByte[i] > 64) && (arregloByte[i] < 91))) || ((arregloByte[i] > 96) && (arregloByte[i] < 123))) {
				count2++;
			} else {
				count++;
			}
		}
		if (count == 0) {
			// System.out.println("\n CADENA OPTIMA el valor del contador de caracteres validos dio "+count2+" el contador de caracteres invalidos dio "+count);

		} else {
			// System.out.println("\n EN LA CADENA EXISTEN CARACTERES ESPECIALES NO SIRVE : el valor del contador de caracteres validos dio "+count2+" el contador de caracteres invalidos dio "+count);
			numped = true;
		}
		return numped;
	}

	public static boolean ControlEntradaNrosVlorU(String numero) {
		int c = 0;
		double pednum = 0;
		boolean resp = true;
		if (numero != "") {
			try {
				pednum = Double.parseDouble(numero);
				// System.out.println( " \nentrada try valor de numero = "+pednum );
			} catch (Exception e) {
				// System.out.println( "Se ha producido un error" );
				c++;
				resp = true;
			}
			if (c == 0) {
				// System.out.println( "entrada antes validador" );
				if (pednum > 0) {
					// System.out.println( "entrada validador" );
					resp = false;

				}
			}
		}
		return resp;

	}

	public static boolean ControlEntradaNrosCant(String numero) {
		int c = 0;
		int pednum = 0;
		boolean resp = true;
		if (numero != "") {
			try {
				pednum = Integer.parseInt(numero);
				// System.out.println( " \nentrada try valor de numero = "+pednum );
			} catch (Exception e) {
				// System.out.println( "Se ha producido un error" );
				c++;
				resp = true;
			}
			if (c == 0) {
				// System.out.println( "entrada antes validador" );
				if (pednum > 0) {
					// System.out.println( "entrada validador" );
					resp = false;

				}
			}
		}
		return resp;
	}
	// ********* ******///
	// /////////////////////////////////////

	public boolean estaenlista(String pedido) {
		boolean respuesta = false;
		if ( pedidoscreados != null ) {
			StringTokenizer stk = new StringTokenizer(pedidoscreados, ",");
			while (stk.hasMoreElements()) {
				if (stk.nextToken().trim().equals(pedido)) {
					return true;
				}
			}
			return respuesta;
		} else {
			return respuesta;
		}
	}
	
	public class procesado {
		String pedido;
		String promodelo;
		String descripcion;
		int cantidad;
		
		public procesado(String pedido, String promodelo, String descripcion, int cantidad) {
			super();
			this.pedido = pedido;
			this.promodelo = promodelo;
			this.descripcion = descripcion;
			this.cantidad = cantidad;
		}


		public procesado() {
		}
			
		public String getPedido() {
			return pedido;
		}

		public void setPedido(String pedido) {
			this.pedido = pedido;
		}

		public int getCantidad() {
			return cantidad;
		}

		public void setCantidad(int cantidad) {
			this.cantidad = cantidad;
		}

		public String getPromodelo() {
			return promodelo;
		}


		public void setPromodelo(String promodelo) {
			this.promodelo = promodelo;
		}


		public String getDescripcion() {
			return descripcion;
		}


		public void setDescripcion(String descripcion) {
			this.descripcion = descripcion;
		}


		@Override
		public boolean equals(Object that){
		  if(this == that) return true;//if both of them points the same address in memory

		  if(!(that instanceof procesado)) return false; // if "that" is not a matriz class

		  procesado thatprocesado = (procesado)that; // than we can cast it to People safely

		  return this.pedido.equals(thatprocesado.pedido);// if they have the same name and same age, then the 2 objects are equal unless they're pointing to different memory adresses
		}
		
	}
	
	public class coleccionProcesados extends ArrayList<procesado> {
		
		public coleccionProcesados() {
			super();
		}
/* -- No se consolidan los procesados
		@Override
		public boolean add(procesado o) {
			int idx = this.indexOf(o);
			if (idx == -1) {
				return super.add(o);
			} else {
				procesado mod = this.get(idx);
				mod.setCantidad(mod.getCantidad()+o.getCantidad());
				return true;
			}		
		}
*/
	}
	
	public class rechazado {
		String pedido;
		
		
		public rechazado(String pedido) {
			super();
			this.pedido = pedido;
		}

		public rechazado() {
		}
			
		public String getPedido() {
			return pedido;
		}

		public void setPedido(String pedido) {
			this.pedido = pedido;
		}

		@Override
		public boolean equals(Object that){
		  if(this == that) return true;//if both of them points the same address in memory

		  if(!(that instanceof rechazado)) return false; // if "that" is not a matriz class

		  rechazado thatrechazado = (rechazado)that; // than we can cast it to People safely

		  return this.pedido.equals(thatrechazado.pedido);// if they have the same name and same age, then the 2 objects are equal unless they're pointing to different memory adresses
		}
		
	}
	
	public class coleccionRechazados extends ArrayList<rechazado> {
		
		public coleccionRechazados() {
			super();
		}
		
		@Override
		public boolean add(rechazado o) {
			int idx = this.indexOf(o);
			if (idx == -1) {
				return super.add(o);
			} else {
				return true;
			}		
		}

	}
	
	public class gstauditoriacarguepedido extends GstTabla {
			
			public gstauditoriacarguepedido() {
				db = new beanConnector();
			}
	
			public boolean crear (String aucpusuario, String aucparchivo, String aucpnumpedido, 
					String aucppromodelo, String aucpdescripcion, String aucpcantidad, 
					String aucpestado, String aucpcomentario, int aucpcodigo)  throws SQLException {
				String insert = "INSERT INTO movimiento.auditoriacarguepedido("
	            + "aucpfecha, aucpusuario, aucparchivo, aucpnumpedido, "
	            + "aucppromodelo, aucpdescripcion, aucpcantidad, "
	            + "aucpestado, aucpcomentario,aucpcodigo)"
	            + " VALUES (now() "
	            + ", " + aucpusuario 
	            + ", '" + aucparchivo + "'"
	            + ", '" + aucpnumpedido + "'"	           
	            + ", '" + aucppromodelo + "'"
	            + ", '" + aucpdescripcion + "'"
	            + ", " + aucpcantidad 
	            + ", '" + aucpestado + "'"
	            + ", '" + aucpcomentario + "'"
	             + ", " + aucpcodigo 
	            + ")";
				int resp = db.executeUpdate(insert);
				return resp ==0 ? false : true;
			}	
	}
}
