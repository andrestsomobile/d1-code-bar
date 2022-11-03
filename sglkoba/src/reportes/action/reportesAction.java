package reportes.action;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import reportes.form.reportesForm;

public class reportesAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		reportesForm repfor = (reportesForm) form;

		Class mi_clase = null;
		try {
			mi_clase = Class.forName("reportes.util." + repfor.getReporte());
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		Class[] argumentos = { String.class, HttpServletRequest.class, reportesForm.class };
		java.lang.reflect.Method metodo = null;
		try {
			metodo = mi_clase.getMethod("execute", argumentos);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}

		try {
			Class[] args_const = new Class[] {};
			Constructor el_constructor = null;
			try {
				el_constructor = mi_clase.getConstructor(args_const);
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Object objeto = null;
			try {
				objeto = el_constructor.newInstance(new Object[] {});
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			metodo.invoke(objeto, new Object[] { getServlet().getServletContext().getRealPath(File.separator + File.separator) + File.separator + "files" + File.separator + "reportes" + File.separator + "jasper" + File.separator, request, repfor });

		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

		String destino = "viewer";

		return mapping.findForward(destino);

	}

}
