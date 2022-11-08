package registro.fotografico.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

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
import auditoria.entity.auditoriacargue;
import db.beanConnector;
import distrinal.control.gstdistnal_despacho;
import jxl.Cell;
import jxl.CellType;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import maestro.control.gstcliente;
import maestro.control.gstproducto;
import maestro.control.gstsucursal;
import maestro.control.gsttransportadora;
import maestro.entity.cliente;
import maestro.entity.producto;
import maestro.entity.sucursal;
import maestro.entity.transportadora;
import util.Fecha;

public final class SubirValorUnitarioAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String opcion = request.getParameter("opcion");
		opcion = opcion == null || (opcion != null && opcion.equals("")) ? "cargar" : opcion;
		
		String mensaje = "";
		String destino = "subir_despacho";
		gstdistnal_despacho control = new gstdistnal_despacho();
		gstauditoriacargue gaud = new gstauditoriacargue();		

		// OPCION DE delete:
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("codsx");
			try {
				auditoriacargue aud = gaud.getauditoriacargue(codsx);
				gaud.updateauditoriacargue(codsx, aud.getAccodcia(), aud.getAcactividad(), aud.getAcfechainicio(), Fecha.getFecha(), "ELIMINADO");
				control.eliminardistnal_despacho(codsx);
				mensaje = "Registro borrado con exito";
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				mensaje = "Registro no pudo ser borrado";
			}
			
			ActionMessages e = getErrors(request);
			e.add("general", new ActionMessage(mensaje, false));
			addErrors(request, e);
			return mapping.findForward(destino);
		} 		
		
		if (opcion.equals("cargar")) {
		
			String ruta_llego = request.getParameter("ruta");
			File f = new File(ruta_llego);
			HttpSession se = request.getSession(true);
			String nombrearch = f.getName();
			nombrearch = nombrearch.substring(nombrearch.lastIndexOf("\\") + 1, nombrearch.length());
			String ruta = (String) se.getAttribute("ruta_upload") + nombrearch;// ruta donde quedo subido el archivo
			System.out.println("***********************ruta_llego:" + ruta_llego);
			System.out.println("***********************ruta:" + ruta);
			
			String codcia = request.getParameter("compania");
			usuario usu = (usuario) request.getSession().getAttribute("usuario");
			Vector inc = new Vector();
			if (codcia != null && !codcia.equals("")) {
				try {
					inc = importar(ruta,codcia,usu.getusucodsx());
					if (inc != null && inc.isEmpty()) {
						mensaje = "Proceso Automatico Terminado Exitosamente";
					} else {
						mensaje = "Proceso Automatico Terminado con errores... Para detalle de inconsistencias verifique Log de Errores";
					}
				} catch (Exception e) {
					mensaje = "Error al procesar... " + e.getLocalizedMessage();
				}
			} else {
				mensaje = "Debe seleccionar una compania para poder realizar el cargue.";
			}
			ActionMessages e = getErrors(request);
			e.add("general", new ActionMessage(mensaje, false));
			addErrors(request, e);
			request.getSession().setAttribute("inconsistencias", inc);
			return mapping.findForward(destino);
		}
		
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		return mapping.findForward(destino);
		
	}

	public Vector<String> importar (String ruta_archivo, String codcia, String accodusuario) {
		Vector<String> inconsistencias = new Vector<String>();
		beanConnector db = new beanConnector();
		gstproducto gpro = new gstproducto();
		gsttransportadora gtrans = new gsttransportadora();
		gstsucursal gsuc = new gstsucursal();
		gstcliente gcli = new gstcliente();
		gstauditoriacargue gaud = new gstauditoriacargue();
		gstdistnal_despacho gdnd = new gstdistnal_despacho(db);

		String actividad = "DespachoDistrinal";
		String fechaaud = Fecha.getFecha();
		int total = 0;
		int hechas = 0;
		File archivoproceso = new File(ruta_archivo);
		try {

			int auccodsx = gaud.crearauditoriacargue(codcia, actividad, fechaaud, "Iniciando...", accodusuario, archivoproceso.getName());
		
			Workbook book = Workbook.getWorkbook(archivoproceso);
			Sheet hoja = book.getSheet(0); 
			int rows = hoja.getRows();
			int columns = hoja.getColumns();
			System.out.println(rows + " " + columns);
			total = rows-1;
			int cantidad_columnas = 2;

			for (int i = 1; i < rows; i++) { //EL ARCHIVO TIENE ENCABEZADO
				Cell[] celdas = hoja.getRow(i);
				if (celdas == null || (celdas != null && celdas.length < cantidad_columnas)) {
					inconsistencias.add("Error en la estructura del archivo, descargue el archivo modelo");
					break;
				}
                int col = 0;
                String id = celdas[col++].getContents(); 
				String valorUnitario = celdas[col++].getContents(); 

				try {
					/*producto pro = gpro.getproductoModelo(dndproducto);
					transportadora tra = null;
					if (dndtransportadora != null && !dndtransportadora.equals("")) {
						
						tra = gtrans.gettransportadora_by_ukey(dndtransportadora);
						if (tra != null) {
							dndtransportadora = tra.gettranspcodsx();
						} else {
							dndtransportadora = null;
						}
					}
					
					if (dndsucursal != null && !dndsucursal.equals("")) {
						sucursal suc = gsuc.getsuccodcursal(dndsucursal);
						if (suc != null) {
					

							if (pro != null) {  
								gdnd.creardistnal_despacho(auccodsx+"", codcia, dndpedido, dndpetra, dndfechavencimiento, suc.getsuccodsx(), dnddireccion, pro.getprocodsx(), dndcantidad, dndvalorunit, dndvalorfactunit, tra != null ? tra.gettranspcodsx():null, null, null, "0", null, null, dndfechaalistamiento, dndfechadespacho, dndfechaentrega);
								hechas++;
							} else {
								inconsistencias.add("En fila " + i + ": Material " + dndproducto + " no existe");
							}
						} else {
							inconsistencias.add("En fila " + i + ": Sucursal " + dndsucursal + " no existe");
						}
					} else {
						inconsistencias.add("En fila " + i + ": Sucursal no esta definida");
					}*/
				} catch (Exception e) {
					e.printStackTrace();
					//inconsistencias.add("En fila " + i + ": Material " + dndproducto + " se presento error " + e.getLocalizedMessage());
				}
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			inconsistencias.add("Error en archivo. " + ex.getMessage());
			hechas = 0;
		}
		/*if (hechas != 0) {
			inconsistencias.add("Importacion exitosa. Se cargaron " + hechas + " de un total de " + total + " registros.");
		} else {
			inconsistencias.add("Se presentaron errores al cargar el archivo.");
		}*/
		return inconsistencias;
	}


}