package registro.action;

import java.io.IOException;
import java.sql.SQLException;

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

import maestro.control.gstcompania;
import maestro.control.gstempleado;
import registro.control.gstregistro_almacenamiento;
import registro.entity.registro_almacenamiento;
import registro.form.registro_almacenamientoForm;

public final class registro_almacenamientoAction extends Action {

	public registro_almacenamientoAction() {
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		registro_almacenamientoForm _form = (registro_almacenamientoForm) form;
		gstregistro_almacenamiento control = new gstregistro_almacenamiento();
		gstempleado empleado = new gstempleado();
		gstcompania compania = new gstcompania();
		String opcion = request.getParameter("opcion");
		opcion = opcion == null || opcion != null && opcion.equals("") ? "crear" : opcion;
		String Compania = "";
		String destino = "";
		String mensaje = "";
		HttpSession sesion = request.getSession(true);
			
		if (opcion.equals("set")) {
			registro_almacenamiento entity = control.getregistro_almacenamiento(request.getParameter("realcodsx"));
			registro_almacenamientoForm temp = new registro_almacenamientoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			sesion.setAttribute("registro_almacenamientoForm", temp);
			String realaccion = entity.getRealaccion();
			if (realaccion.equalsIgnoreCase("INVENTARIO MANUAL")) {
				destino = "inventario";
			} else if (realaccion.equalsIgnoreCase("REUBICACION MANUAL")) {
				destino = "reubicacion";
			} else if (realaccion.equalsIgnoreCase("ALMACENAMIENTO MANUAL")) {
				destino = "descargue";
			} else if (realaccion.equalsIgnoreCase("ALMACENAMIENTO X QR")) {
				destino = "descargue_qr";
			}
			return mapping.findForward(destino);
		}
		
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("realcodsx");
			try {
				control.eliminar(codsx);
				sesion.setAttribute("registro_almacenamientoForm", null);
				mensaje = "Registro Eliminado con Exito";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Eliminar el registro: <br> " + e.getLocalizedMessage();
			}
			destino = "default";
		}
		
		if (opcion.equals("cerrar")) {
			String codsx = request.getParameter("realcodsx");
			try {
				control.cerrarregistro_almacenamiento(codsx);
				sesion.setAttribute("registro_almacenamientoForm", null);
				mensaje = "Registro cerrado con Exito";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo cerrar el registro: <br> " + e.getLocalizedMessage();
			}
			destino = "default";
		}
		
		if (opcion.equals("crear")) {
			String realaccion = request.getParameter("accion");
			String realempleado = request.getParameter("realempleado");
			String ruta_accion = request.getParameter("ruta_accion");
			try {
				int realcodsx = control.crearregistro_almacenamiento(realaccion, realempleado);
				registro_almacenamiento entity = control.getregistro_almacenamiento(realcodsx+"");
				if (entity != null) {
					registro_almacenamientoForm temp = new registro_almacenamientoForm();
					temp.setopcion("update");
					temp.llenar(entity);
					sesion.setAttribute("registro_almacenamientoForm", temp);
					mensaje = "Accion creada con exito";
					destino = ruta_accion;
				} else {
					mensaje = "Error iniciando Accion";
					destino = "default";
				}

			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "Error iniciando Accion" + e.getMessage();
				destino = "default";
			}
		}
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);
		return mapping.findForward(destino);
	}



}
