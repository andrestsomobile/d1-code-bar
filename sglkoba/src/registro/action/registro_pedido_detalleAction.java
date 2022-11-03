// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 07/07/2011 11:27:13 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   registro_pedido_detalleAction.java

package registro.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import registro.control.gstregistro_pedido;
import registro.control.gstregistro_pedido_detalle;
import registro.form.registro_pedidoForm;
import registro.form.registro_pedido_detalleForm;

public final class registro_pedido_detalleAction extends Action
{

    public registro_pedido_detalleAction()
    {
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
    {
        registro_pedido_detalleForm _form = (registro_pedido_detalleForm)form;
        gstregistro_pedido_detalle control = new gstregistro_pedido_detalle();
        String opcion = request.getParameter("opcion");
        opcion = opcion == null || opcion != null && opcion.equals("") ? "crear" : opcion;
        Vector pedi = new Vector();
        String mensaje = "";
        pedi.add(request.getParameter("ped1"));
        pedi.add(request.getParameter("ped2"));
        pedi.add(request.getParameter("ped3"));
        pedi.add(request.getParameter("ped4"));
        pedi.add(request.getParameter("ped5"));
        pedi.add(request.getParameter("ped6"));
        pedi.add(request.getParameter("ped7"));
        pedi.add(request.getParameter("ped8"));
        pedi.add(request.getParameter("ped9"));
        pedi.add(request.getParameter("ped10"));
        pedi.add(request.getParameter("ped11"));
        pedi.add(request.getParameter("ped12"));
        pedi.add(request.getParameter("ped13"));
        pedi.add(request.getParameter("ped14"));
        pedi.add(request.getParameter("ped15"));
        pedi.add(request.getParameter("ped16"));
        pedi.add(request.getParameter("ped17"));
        pedi.add(request.getParameter("ped18"));
        pedi.add(request.getParameter("ped19"));
        pedi.add(request.getParameter("ped20"));
        pedi.add(mensaje);
        String Destino = "";
        if(opcion.equals("crear"))
        {
            String Numerador = "";
            String regped = request.getParameter("codsx");
            try
            {
                Numerador = control.Getrpdecodsx();
                if(Numerador.equals(null))
                    Numerador = "0";
                int NewNumerador = Integer.parseInt(Numerador) + 1;
                Numerador = String.valueOf(NewNumerador);
                int i = Integer.valueOf(0);
                int cont = Integer.valueOf(0);
                String pedcodsx = "";
                Vector Pedi = new Vector();
                Vector Guia = new Vector();
                if(!pedi.get(i).toString().equals(""))
                {
                    while(!pedi.get(i).toString().equals("")) 
                    {
                        pedcodsx = control.getpedcodsx(pedi.get(i).toString());
                        if(pedcodsx.equals("") || pedcodsx.equals("0"))
                            i = i + 1;
                       else
                        {
                            Pedi.add(pedcodsx);
                            Guia.add(control.getpedguias(pedcodsx));
                            i = i + 1;                            
                        }
                    }
                    Pedi.add("");
                    Guia.add("");
                    int k = 0;
                    String guia = Guia.get(k).toString();
                    while(!Pedi.get(k).toString().equals("")) {
                        //if(guia.equals(Guia.get(k).toString()))
                        //{
                            control.crearregistro_pedido_detalle(Numerador, regped, Pedi.get(k).toString(), "00:00:00", "N");
                            NewNumerador = Integer.parseInt(Numerador) + 1;
                            Numerador = String.valueOf(NewNumerador);
                            guia = Guia.get(k).toString();
                            k++;
                        //} else
                        //{
                        //    k++;
                        //    cont = cont + 1;                            
                        //}
                    }
                    NewNumerador = Integer.parseInt(Numerador) - 1;
                    Numerador = String.valueOf(NewNumerador);
                    registro.entity.registro_pedido_detalle entity = control.getregistro_pedido_detalle_ultimo(regped);
                    registro_pedido_detalleForm temp = new registro_pedido_detalleForm();
                    temp.setopcion("update");
                    temp.llenar(entity);
                    //int t = k - cont;
                    request.setAttribute("registro_pedido_detalleForm", temp);
                    mensaje = (new StringBuilder()).append("Pedidos registrados con Exito:").append(k).append(" de ").append(i).append("").toString();
                    Destino = "registro_pedidos_1";
                } else
                {
                    gstregistro_pedido control1 = new gstregistro_pedido();
                    registro.entity.registro_pedido entity = control1.getregistro_pedido_ultimo(regped);
                    registro_pedidoForm temp = new registro_pedidoForm();
                    temp.setopcion("update");
                    temp.llenar(entity);
                    request.setAttribute("registro_pedidoForm", temp);
                    mensaje = "Pedidos sin registrar, por favor revise!!!";
                    Destino = "registro_pedidos_detalle";
                }
            }
            catch(SQLException e)
            {
                e.printStackTrace();
                mensaje = (new StringBuilder()).append("Empleado no existe . . . <br> ").append(e.getLocalizedMessage()).toString();
            }
        }
        ActionMessages e = getErrors(request);
        e.add("general", new ActionMessage(mensaje, false));
        addErrors(request, e);
        return mapping.findForward(Destino);
    }
}
