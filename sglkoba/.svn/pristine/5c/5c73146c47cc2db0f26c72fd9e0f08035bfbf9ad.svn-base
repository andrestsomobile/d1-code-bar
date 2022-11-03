package patios.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import patios.control.gstnacionalizacionvehiculo;
import patios.entity.nacionalizacionvehiculo;
import patios.form.nacionalizacionvehiculoForm;

public final class nacionalizacionvehiculoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		nacionalizacionvehiculoForm _form = (nacionalizacionvehiculoForm) form;
		gstnacionalizacionvehiculo control = new gstnacionalizacionvehiculo();
		String opcion = request.getParameter("opcion");
		opcion = opcion == null || (opcion != null && opcion.equals("")) ? "crear" : opcion;

		String destino = "";
		String mensaje = "";

		// OPCION DE set:
		if (opcion.equals("set")) {
			nacionalizacionvehiculo entity = control.getnacionalizacionvehiculo(request.getParameter("nvcodsx"));
			nacionalizacionvehiculoForm temp = new nacionalizacionvehiculoForm();
			temp.setopcion("update");
			temp.llenar(entity);
			request.setAttribute("nacionalizacionvehiculoForm", temp);
			destino = "nacionalizacionvehiculo_datos";
		}

		// opcion de CREAR
		if (opcion.equals("crear")) {
			String nvfecha = _form.getNvfecha();
			String nvfmm = _form.getNvfmm();
			String nvcodvin = _form.getNvcodvin();
			
			try {
				destino = "nacionalizacionvehiculo_datos";
				int nuevocodsx = control.crearnacionalizacionvehiculo(nvfmm, nvfecha, nvcodvin);
				mensaje = "Se Creo con Exito";
				nacionalizacionvehiculo temp = control.getnacionalizacionvehiculo(nuevocodsx+"");
				nacionalizacionvehiculoForm entityform  = new nacionalizacionvehiculoForm();
				entityform.llenar(temp);
				entityform.setopcion("update");
				request.setAttribute("nacionalizacionvehiculoForm", entityform);

			} catch (SQLException e) {
				e.printStackTrace();
				destino = "nacionalizacionvehiculo_datos";
				mensaje = "No se pudo Crear el registro: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de update
		if (opcion.equals("update")) {
			destino = "nacionalizacionvehiculo_datos";
			try {
				nacionalizacionvehiculo entityform = control.getnacionalizacionvehiculo(_form.getNvcodsx());
				control.updatenacionalizacionvehiculo(_form);
				mensaje = "Actualizado con Exito";
			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Actualizar: <br> " + e.getLocalizedMessage();
			}
		}
		// Opcion de eliminar
		if (opcion.equals("delete")) {
			String codsx = request.getParameter("nvcodsx");
			destino = "nacionalizacionvehiculo";
			try {
				control.eliminar(codsx);
				mensaje = "Se Elimino con Exito";

			} catch (SQLException e) {
				e.printStackTrace();
				mensaje = "No se pudo Eliminar: <br> " + e.getLocalizedMessage();
			}
		}
		ActionMessages e = getErrors(request);
		e.add("general", new ActionMessage(mensaje, false));
		addErrors(request, e);

		return mapping.findForward(destino);

	}
}
