// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 07/07/2011 11:29:41 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   registro_pedidoForm.java

package registro.form;

import org.apache.struts.action.ActionForm;
import registro.entity.registro_pedido;

public class registro_pedidoForm extends ActionForm
{

    public registro_pedidoForm()
    {
    }

    public void setopcion(String newopcion)
    {
        opcion = newopcion;
    }

    public String getopcion()
    {
        return opcion;
    }

    public String getrepecodsx()
    {
        return repecodsx;
    }

    public String getrepefecha()
    {
        return repefecha;
    }

    public String getrepeempleado()
    {
        return repeempleado;
    }

    public String getrepehoin()
    {
        return repehoin;
    }

    public String getrepehofi()
    {
        return repehofi;
    }

    public String getrepecanped()
    {
        return repecanped;
    }

    public String getrepeesta()
    {
        return repeesta;
    }

    public void setrepecodsx(String new_repecodsx)
    {
        repecodsx = new_repecodsx;
    }

    public void setrepefecha(String new_repefecha)
    {
        repefecha = new_repefecha;
    }

    public void setrepeempleado(String new_repeempleado)
    {
        repeempleado = new_repeempleado;
    }

    public void setrepehoin(String new_repehoin)
    {
        repehoin = new_repehoin;
    }

    public void setrepehofi(String new_repehofi)
    {
        repehofi = new_repehofi;
    }

    public void setrepecanped(String new_repecanped)
    {
        repecanped = new_repecanped;
    }

    public void setrepeesta(String new_repeesta)
    {
        repeesta = new_repeesta;
    }

    public void llenar(registro_pedido entity)
    {
        repecodsx = entity.getrepecodsx();
        repefecha = entity.getrepefecha();
        repeempleado = entity.getrepeempleado();
        repehoin = entity.getrepehoin();
        repehofi = entity.getrepehofi();
        repecanped = entity.getrepecanped();
        repeesta = entity.getrepeesta();
    }

    private String repecodsx;
    private String repefecha;
    private String repeempleado;
    private String repehoin;
    private String repehofi;
    private String repecanped;
    private String repeesta;
    private String opcion;
}
