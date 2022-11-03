// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 07/07/2011 11:28:14 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   registro_pedidoAction.java

package registro.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import maestro.control.gstcompania;
import maestro.control.gstempleado;
import org.apache.struts.action.*;
import registro.control.gstregistro_pedido;
import registro.control.gstregistro_pedido_detalle;
import registro.entity.registro_pedido;
import registro.form.registro_pedidoForm;
import registro.form.registro_pedido_detalleForm;

public final class registro_pedidoAction extends Action
{
    Date  Fecha = new Date();
        
    Date f1 = null;
    Date f2 = null;

    public registro_pedidoAction()
    {
        i = new Vector();
        Estado = "";
        UltCodsx = "";
        
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
    {
        registro_pedidoForm _form = (registro_pedidoForm)form;
        gstregistro_pedido control = new gstregistro_pedido();
        gstempleado empleado = new gstempleado();
        gstcompania compania = new gstcompania();
        String opcion = request.getParameter("opcion");
        opcion = opcion == null || opcion != null && opcion.equals("") ? "crear" : opcion;
        String Compania = "";
        String Destino = "";
        String mensaje = "";
        if(opcion.equals("activar"))
        {
            registro_pedido entity = control.getregistro_pedido(request.getParameter("repecodsx"));
            entity.setrepeesta("PENDIENTE");
            try
            {
                control.updateregistro_pedido(entity);
                registro_pedidoForm temp = new registro_pedidoForm();
                temp.setopcion("update");
                temp.llenar(entity);
                request.setAttribute("registroForm", temp);
                Destino = "registro_pedidos_datos";
                mensaje = "registro Activada con exito";
            }
            catch(SQLException e1)
            {
                mensaje = (new StringBuilder()).append("No se pudo Activar la registro <br>").append(e1.getMessage()).toString();
                e1.printStackTrace();
                Destino = "registro_datos";
            }
        }
        if(opcion.equals("set"))
        {
            registro_pedido entity = control.getregistro_pedido(request.getParameter("codsx"));
            registro_pedidoForm temp = new registro_pedidoForm();
            temp.setopcion("update");
            temp.llenar(entity);
            request.setAttribute("registroForm", temp);
            return mapping.findForward("registro_pedidos_datos");
        }
        if(opcion.equals("delete"))
        {
            String codsx = request.getParameter("codsx");
            try
            {
                control.eliminar(codsx);
                mensaje = "Registro Eliminado con Exito";
            }
            catch(SQLException e)
            {
                e.printStackTrace();
                mensaje = (new StringBuilder()).append("No se pudo Eliminar el registro: <br> ").append(e.getLocalizedMessage()).toString();
            }
            Destino = "registro";
        }
        if(opcion.equals("crear"))
        {
            String Ident = "";
            String FechaActual = "";
            String Numerador = "";
            String HoraActual = "";
            String entempleado = request.getParameter("cedula");
            try
            {
                if(!control.ValidarEmpleado(entempleado).equals("FALLO"))
                {
                    Ident = control.Empleado_by_cedula(entempleado);
                    Numerador = control.Getrepecodsx();
                    if(Numerador.equals(null))
                        Numerador = "0";
                    
                    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
                    String cadenaFecha = formatoFecha.format(Fecha);
                    FechaActual = cadenaFecha;
                    
                    SimpleDateFormat formatohora = new SimpleDateFormat("HH:mm");
                    String cadenaHora = formatohora.format(Fecha);
                    HoraActual = cadenaHora;
                    
                    i = control.getEstadoregistro_pedido(Ident);
                    
                    if(!i.isEmpty())
                    {
                        Estado = TipoRegistro(i);
                        UltCodsx = UltimoRegistro(i);
                    } else
                    {
                        Estado = "0";
                    }
                    if(!Estado.equals("0"))
                    {
                        if(Estado.equals("FINALIZADO"))
                        {
                            int NewNumerador = Integer.parseInt(Numerador) + 1;
                            Numerador = String.valueOf(NewNumerador);
                            control.crearregistro_pedido(Numerador, FechaActual, Ident, HoraActual, "00:00:00", "0", "TRAMITE");
                            registro_pedido entity = control.getregistro_pedido_ultimo(Numerador);
                            registro_pedidoForm temp = new registro_pedidoForm();
                            temp.setopcion("update");
                            temp.llenar(entity);
                            request.setAttribute("registro_pedidoForm", temp);
                            Destino = "registro_pedidos_detalle";
                        } else
                        {
                            String rpderegped = "", HoraIni = "";
                            
                            gstregistro_pedido_detalle control2 = new gstregistro_pedido_detalle();
                            rpderegped = control2.Getrpdecodsx(Ident);
                            registro.entity.registro_pedido_detalle entity2 = null;
                            if(!rpderegped.equals("0"))
                            {
                                entity2 = control2.getregistro_pedido_detalle_ultimo(UltCodsx);
                                registro_pedido_detalleForm temp = new registro_pedido_detalleForm();
                                temp.setopcion("update");
                                temp.llenar(entity2);
                                request.setAttribute("registro_pedido_detalleForm", temp);
                                
                                HoraIni = control.getHoraInicio(UltCodsx);
                                
                                try {
                                    f1 = formatohora.parse(HoraIni);
                                    f2 = formatohora.parse(HoraActual);
                                    
                                    if (f1.compareTo(f2) < 0)
                                        control.setEstadoRegistroPedido(UltCodsx, HoraActual, "0");
                                    
                                    if(f1.compareTo(f2) > 0)
                                        control.setEstadoRegistroPedido(UltCodsx, "07:30", "1");
                                } catch(Exception parseException) { parseException.printStackTrace(); }
                               
                                control.setTiempoTotal(UltCodsx);
                                mensaje = "Registro FINALIZADO con exito!!";
                                Destino = "registro_pedidos_detalle_datos";
                            }
                            if(rpderegped.equals("0"))
                            {
                                try
                                {
                                    control.eliminar(UltCodsx);
                                }
                                catch(SQLException e)
                                {
                                    e.printStackTrace();
                                }
                                mensaje = "Ingrese nuevamente su numero de cedula!! ";
                                Destino = "registro_pedidos_detalle_datos";
                            }
                        }
                    } else
                    {
                        int NewNumerador = Integer.parseInt(Numerador) + 1;
                        Numerador = String.valueOf(NewNumerador);
                        control.crearregistro_pedido(Numerador, FechaActual, Ident, HoraActual, "00:00:00", "0", "TRAMITE");
                        registro_pedido entity = control.getregistro_pedido_ultimo(Numerador);
                        registro_pedidoForm temp = new registro_pedidoForm();
                        temp.setopcion("update");
                        temp.llenar(entity);
                        request.setAttribute("registro_pedidoForm", temp);
                        Destino = "registro_pedidos_detalle";
                    }
                } else
                {
                    mensaje = "Empleado no existe . . .!!";
                    Destino = "registro_pedidos_1";
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

    public String TipoRegistro(Vector Cont)
        throws SQLException
    {
        Integer j = Integer.valueOf(0);
        String Estado = "";
        do
        {
            if(j.intValue() >= Cont.size())
                break;
            if(Cont.get(j.intValue()).toString().equals("TRAMITE"))
            {
                Estado = "TRAMITE";
                break;
            }
            j = Integer.valueOf(j.intValue() + 2);
            Estado = "FINALIZADO";
        } while(true);
        return Estado;
    }

    public String UltimoRegistro(Vector Cont)
        throws SQLException
    {
        Integer j = Integer.valueOf(0);
        do
        {
            if(Cont.get(j.intValue()).toString().equals("TRAMITE"))
            {
                j = Integer.valueOf(j.intValue() + 1);
                UltCodsx = Cont.get(j.intValue()).toString();
                return UltCodsx;
            }
            j = Integer.valueOf(j.intValue() + 1);
            if(j.intValue() < Cont.size())
                UltCodsx = Cont.get(j.intValue()).toString();
            else
                return UltCodsx;
        } while(true);
    }

    Vector i;
    String Estado;
    String UltCodsx;
}
