// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 07/07/2011 11:29:11 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   registro_pedido_detalle.java

package registro.entity;

import java.io.Serializable;

public class registro_pedido_detalle
    implements Serializable
{

    public registro_pedido_detalle(String rpdecodsx, String rpderegped, String rpdenumpedido, String rpdetire, String rpdeterminado)
    {
        this.rpdecodsx = rpdecodsx;
        this.rpderegped = rpderegped;
        this.rpdenumpedido = rpdenumpedido;
        this.rpdetire = rpdetire;
        this.rpdeterminado = rpdeterminado;
    }

    public String getrpdecodsx()
    {
        return rpdecodsx;
    }

    public String getrpderegped()
    {
        return rpderegped;
    }

    public String getrpdenumpedido()
    {
        return rpdenumpedido;
    }

    public String getrpdetire()
    {
        return rpdetire;
    }

    public String getrpdeterminado()
    {
        return rpdeterminado;
    }

    public void setentcodsx(String new_rpdecodsx)
    {
        rpdecodsx = new_rpdecodsx;
    }

    public void setrpderegped(String new_rpderegped)
    {
        rpderegped = new_rpderegped;
    }

    public void setrpdenumpedido(String new_rpdenumpedido)
    {
        rpdenumpedido = new_rpdenumpedido;
    }

    public void setrpdetire(String new_rpdetire)
    {
        rpdetire = new_rpdetire;
    }

    public void setrpdeterminado(String new_rpdeterminado)
    {
        rpdeterminado = new_rpdeterminado;
    }

    private String rpdecodsx;
    private String rpderegped;
    private String rpdenumpedido;
    private String rpdetire;
    private String rpdeterminado;
}
