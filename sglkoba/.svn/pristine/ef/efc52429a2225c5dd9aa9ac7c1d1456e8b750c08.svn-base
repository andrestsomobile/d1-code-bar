package maestro.action;

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
import maestro.control.gstproducto;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import db.beanConnector;

public final class subirProductosAction extends Action {

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
		String destino = "subirProductos";
		String	procodigocia = request.getParameter("compania");
		Vector inc = new Vector();
		if (procodigocia != null && !procodigocia.equals("")) {
			try {
				inc = importar(ruta,procodigocia);
				mensaje = "Proceso Automatico Terminado... Para detalle sobre Observaciones verifique Log de Errores";
			} catch (Exception e) {
				mensaje = "Error al procesar... " + e.getLocalizedMessage();
			}
		} else {
			mensaje = "Debe seleccionar una compañia para poder realizar el cargue.";
		}
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		request.getSession().setAttribute("inconsistencias", inc);
		return mapping.findForward(destino);
	}

	public Vector importar (String ruta_archivo, String procodigocia) {
		Vector inconsistencias = new Vector();
		beanConnector db = new beanConnector();
		gstproducto gpro = new gstproducto();
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
				if (celdas == null || (celdas != null && celdas.length < 26)) {
					inconsistencias.add("Error en la estructura. Son 26 celdas, estas son: " +
					"prodescripcion	procategoria	promodelo	prosubpartida	proean	procodbarra	progarantia	prokiloreal	provolumen	prokilovolumen	prouniempaque	prokvuniempaque	provoluniempaque	prounimasterpac	prokvmasterpack	propesobmp	resumen	provolmasterpac	procodigobarra	proestado	proobservacion	protipoproducto	prolargo	proalto	proancho	procatoster");
					break;
				}
				//Campos del Archivo
				//prodescripcion	procategoria	promodelo	prosubpartida	proean	procodbarra	progarantia	prokiloreal	provolumen	prokilovolumen	prouniempaque
				//prokvuniempaque	provoluniempaque	prounimasterpac	prokvmasterpack	propesobmp	resumen	provolmasterpac	procodigobarra	proestado	proobservacion	protipoproducto	prolargo	proalto	proancho	procatoster
                int col = 0;

				String	prodescripcion	 = celdas[col++].getContents();
				String	procategoria	 = celdas[col++].getContents();
				String	promodelo		 = celdas[col++].getContents();
				String	prosubpartida	 = celdas[col++].getContents();
				String	proean	 		 = celdas[col++].getContents();
				String	procodbarra	 	 = celdas[col++].getContents();
				String	progarantia	 	 = celdas[col++].getContents();
				String	prokiloreal	 	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	provolumen	 	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	prokilovolumen	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	prouniempaque	 = celdas[col++].getContents(); 
				String	prokvuniempaque	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	provoluniempaque = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	prounimasterpac	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	prokvmasterpack	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	propesobmp	 	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	resumentext	 	 = celdas[col++].getContents(); 
				String	provolmasterpac	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	procodigobarra	 = celdas[col++].getContents(); 
				String	proestado	 	 = celdas[col++].getContents(); 
				String	proobservacion	 = celdas[col++].getContents(); 
				String	protipoproducto	 = celdas[col++].getContents(); 
				String	prolargo	 	 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	proalto		     = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	proancho		 = ( (celdas[col].getType() == CellType.NUMBER)?((NumberCell) celdas[col]).getValue():0 ) + "";col++;
				String	procatoster	 	 = celdas[col++].getContents(); 
				String  proump = "";

				try {
					gpro.crearproducto(procodigocia, prodescripcion, procategoria, promodelo, prosubpartida, proean, procodbarra, progarantia, prokiloreal, provolumen, prokilovolumen, prouniempaque, prokvuniempaque, provoluniempaque, prounimasterpac, prokvmasterpack, propesobmp, provolmasterpac, procodigobarra, proestado, proobservacion, protipoproducto, prolargo, proalto, proancho, procatoster, proump);
					hechas++;
					inconsistencias.add("Producto Creado con Exito: " + promodelo);
				} catch (SQLException e) {
					String desc_error = e.getLocalizedMessage().contains("uq_producto")?"Codigo ya existe":e.getLocalizedMessage();
					inconsistencias.add("No se pudo Crear el producto: " + promodelo + " - " + desc_error);
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
