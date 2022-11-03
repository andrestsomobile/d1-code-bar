package util;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import administracion.control.*;
import administracion.entity.*;
import auditoria.control.gstauditoria_conexiones;

import org.apache.struts.action.*;
 
 public final class validacionAction_20071020  extends Action{
			
 public ActionForward execute(ActionMapping mapping,	ActionForm form, 
			HttpServletRequest request,	HttpServletResponse response)
			throws IOException {
	 
		String login = request.getParameter("login");
		String clave = request.getParameter("clave");
		gstusuario gusu = new gstusuario();
		usuario usu = gusu.validar(login, clave);
		String destino  ="";
		if(usu==null) 
			destino = "index";
		else  {
			
			HttpSession sesion = request.getSession(true);
			gstgrupo ggrupo = new gstgrupo();
			grupo gru = ggrupo.getgrupo(usu.getusugrupo());
			gstempresa gemp = new gstempresa();
			empresa emp = gemp.getempresa("1");
			sesion.setAttribute("usuario", usu);
			sesion.setAttribute("grupo", gru);
			sesion.setAttribute("empresa", emp);
			destino = "main";
			
			
			//registro en la auditoria que se logeo:
			gstauditoria_conexiones gaudi = new gstauditoria_conexiones();
			try {
				gaudi.crearauditoria_conexiones(login, usu.getusunombre() , util.Fecha.getFecha(), "Ingreso", "");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}


	 return mapping.findForward(destino);
	 
 }

 
 }