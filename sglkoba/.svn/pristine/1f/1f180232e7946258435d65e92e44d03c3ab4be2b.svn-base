package ingreso.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.CellType;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import maestro.control.gstbodega;
import maestro.control.gstconfig_bodega;
import maestro.control.gstproducto;
import maestro.entity.bodega;
import maestro.entity.producto;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import db.beanConnector;
import ingreso.control.gstentrada;
import ingreso.control.gstingreso;
import ingreso.entity.entrada;
import ingreso.entity.ingreso;

public final class subirPosicionesAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String ruta_llego = request.getParameter("ruta");
		File f = new File(ruta_llego);
		HttpSession se = request.getSession(true);
		String nombrearch = f.getName();
		nombrearch = nombrearch.substring(nombrearch.lastIndexOf("\\") + 1, nombrearch.length());
		String ruta = (String) se.getAttribute("ruta_upload") + nombrearch;// ruta donde quedo subido el archivo
		System.out.println("***********************ruta_llego:" + ruta_llego);
		System.out.println("***********************ruta:" + ruta);
		String mensaje = "";
		String destino = "subirPosiciones";
		String ingcodsx = request.getParameter("ingcodsx");
		Vector inc = new Vector();
		if (ingcodsx != null && !ingcodsx.equals("")) {
			try {
				inc = importar(ruta,ingcodsx);
				mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones verifique Log de Errores";
			} catch (Exception e) {
				mensaje = "Error al procesar... " + e.getLocalizedMessage();
			}
		} else {
			mensaje = "Debe seleccionar un ingreso para poder realizar el cargue.";
		}
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		request.getSession().setAttribute("inconsistencias", inc);
		return mapping.findForward(destino);
	}

	public Vector importar (String ruta_archivo, String ingcodsx) {
		Vector inconsistencias = new Vector();
		beanConnector db = new beanConnector();
		gstproducto gpro = new gstproducto();
		gstingreso ging = new gstingreso();
		gstentrada gent = new gstentrada();
		gstconfig_bodega gcbod = new gstconfig_bodega();
		gstbodega gbod = new gstbodega();
		ingreso ing = ging.getingreso(ingcodsx);
		int total = 0;
		int hechas = 0;
		try {
			Workbook book = Workbook.getWorkbook(new File(ruta_archivo));
			Sheet hoja = book.getSheet(0); 
			int rows = hoja.getRows();
			int columns = hoja.getColumns();
			System.out.println(rows + " " + columns);
			total = rows-1;

			for (int i = 1; i < rows; i++) { //EL ARCHIVO TIENE ENCABEZADO
				Cell[] celdas = hoja.getRow(i);
				if (celdas == null || (celdas != null && celdas.length < 9)) {
					inconsistencias.add("Error en la estructura. Son 9 celdas. " +
					"Los encabezados de las columnas son: MATERIAL/DESCRIPCIÓN/UMP/NUMERO DE IMP/CANTIDAD/BODEGA ACTUAL/POSICION ACTUAL/BODEGA NUEVA/POSICION NUEVA");
					break;
				}
                int col = 0;

				String	material = celdas[col++].getContents();
				String	descripcion	= celdas[col++].getContents();
				String	ump= celdas[col++].getContents();
				String	importacion	= celdas[col++].getContents();
				String	cantidad = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	bodegaactual = celdas[col++].getContents(); 
				String	posicionactual = celdas[col++].getContents(); 
				String	bodeganueva = celdas[col++].getContents(); 
				String	posicionnueva = celdas[col++].getContents(); 
				

				try {
					producto pro = gpro.getproductoByUk(ing.getingcodcia(), material);
					bodega bod_actual = gbod.getbodega_by_ukey(bodegaactual);
					bodega bod_nueva = gbod.getbodega_by_ukey(bodeganueva);
					if (bod_actual != null) {
						entrada ent = gent.getentrada(ingcodsx, pro.getprocodsx(), bod_actual.getbodcodsx(), posicionactual);/// OJO se esta validando siempre con la bodega 1
						if (ent != null) { 
							if (bod_nueva != null) {
								if (gcbod.es_posicion_valida(bod_nueva.getbodcodsx(), posicionnueva)) {  /// OJO se esta validando siempre con la bodega 1
									gent.updatePosicion(ent.getentcodsx(), posicionnueva,bod_nueva.getbodcodsx());
									hechas++;
								} else {
									inconsistencias.add("En fila " + rows + ": Material " + material + " la posicion "+ posicionnueva +" no es valida, esta ocupada o es un tunel");
								}
							} else {
								inconsistencias.add("En fila " + rows + ": Bodega Nueva " + bodeganueva + " no existe");
							}
						} else {
							inconsistencias.add("En fila " + rows + ": Material " + material + " no se encontro en la posicion "+ posicionactual);
						}
					} else {
						inconsistencias.add("En fila " + rows + ": Bodega Actual " + bodegaactual + " no existe");
					}
				} catch (SQLException e) {
					e.printStackTrace();
					inconsistencias.add("En fila " + rows + ": Material " + material + " en la posicion "+ posicionactual + " se presento error " + e.getLocalizedMessage());

				}
				
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			inconsistencias.add("Error en archivo. " + ex.getMessage());
			hechas = 0;
		}
		if (hechas != 0) {
			inconsistencias.add("Importacion exitosa. Se cargaron " + hechas + " de un total de " + total + " registros.");
		} else {
			inconsistencias.add("Se presentaron errores al cargar el archivo.");
		}
		return inconsistencias;
	}



}
