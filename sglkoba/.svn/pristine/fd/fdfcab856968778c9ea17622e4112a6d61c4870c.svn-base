// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 07/07/2011 11:28:34 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   gstregistro_pedido.java

package registro.control;

import db.GstTabla;
import db.beanConnector;
import java.io.PrintStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Vector;
import registro.entity.registro_pedido;

public class gstregistro_pedido extends GstTabla
{

    public gstregistro_pedido()
    {
        db = new beanConnector();
        classEntidad = registro_pedido.class;
    }

    public gstregistro_pedido(beanConnector db)
    {
        this.db = db;
        classEntidad = registro_pedido.class;
    }

    public Collection getlistaregistro_pedido()
    {
        String consulta = " SELECT * FROM registro_pedido WHERE repecodsx!=0 order by repecodsx desc ";
        return getLista(consulta);
    }

    public Collection getlistaregistro_pedido(String start, String param)
    {
        start = start == null ? "0" : start;
        param = param == null ? "" : param;
        String consulta = (new StringBuilder()).append(" SELECT * FROM registro_pedido where resumen like '%%").append(param).append("%%' ").append(" order by repecodsx desc ").append("  limit ").append(maxfilas).append(" offset  ").append(Integer.parseInt(start) * maxfilas).toString();
        return getLista(consulta);
    }

    public int getTotalPaginaslistaregistro_pedido(String param)
    {
        param = param == null ? "" : param;
        String consulta = " SELECT count(1) FROM registro_pedido   ";
        return getPaginas(consulta);
    }

    public Vector getEstadoregistro_pedido(String Empleado)
    {
        Vector Estado = new Vector();
        String nada = "";
        try
        {
            String Cadena = (new StringBuilder()).append("SELECT repecodsx, repeesta FROM registro_pedido WHERE repeempleado ='").append(Empleado).append("' order by repecodsx asc").toString();
            rs = db.executeQuery(Cadena);
            System.out.print(Cadena);
            for(; rs.next(); Estado.add(rs.getString("repecodsx")))
                Estado.add(rs.getString("repeesta"));

        }
        catch(Exception ex)
        {
            Estado.add("0");
            Estado.add("0");
            System.out.println(ex.toString());
            return Estado;
        }
        return Estado;
    }

    public boolean crearregistro_pedido(String repecodsx, String repefecha, String repeempleado, String repehoin, String repehofi, String repecanped, String repeesta)
        throws SQLException
    {
        String insert = (new StringBuilder()).append("INSERT INTO registro_pedido (repecodsx, repefecha, repeempleado, repehoin, repehofi, repecanped, repeesta) VALUES (").append(repecodsx == null ? "NULL" : (new StringBuilder()).append("'").append(repecodsx).append("'").toString()).append(",").append(repefecha == null ? "NULL" : (new StringBuilder()).append("'").append(repefecha).append("'").toString()).append(",").append(repeempleado == null ? "NULL" : (new StringBuilder()).append("'").append(repeempleado).append("'").toString()).append(",").append(repehoin == null ? "NULL" : (new StringBuilder()).append("'").append(repehoin).append("'").toString()).append(",").append(repehofi == null ? "NULL" : (new StringBuilder()).append("'").append(repehofi).append("'").toString()).append(",").append(repecanped == null ? "NULL" : (new StringBuilder()).append("'").append(repecanped).append("'").toString()).append(",").append(repeesta == null ? "NULL" : (new StringBuilder()).append("'").append(repeesta).append("'").toString()).append(")").toString();
        int resp = db.executeUpdate(insert);
        return resp != 0;
    }

    public registro_pedido getregistro_pedido(String repecodsx)
    {
        String cad = "SELECT * FROM registro_pedido WHERE repecodsx ='"+repecodsx+"'";
        return (registro_pedido)getEntidad(cad);
    }

    public registro_pedido getregistro_pedido_ultimo(String repecodsx)
    {
        String cad = "SELECT * FROM registro_pedido WHERE repecodsx ='"+repecodsx+"'";
        return (registro_pedido)getEntidad(cad);
    }

    public boolean updateregistro_pedido(registro_pedido entity)
        throws SQLException
    {
        String cad = (new StringBuilder()).append("update registro_pedido set  repecodsx = ").append(entity.getrepecodsx() != null ? (new StringBuilder()).append("'").append(entity.getrepecodsx()).append("'").toString() : "NULL").append(",").append(" repefecha= ").append(entity.getrepefecha() != null ? (new StringBuilder()).append("'").append(entity.getrepefecha()).append("'").toString() : "NULL").append(",").append(" repeempleado = ").append(entity.getrepeempleado() != null ? (new StringBuilder()).append("'").append(entity.getrepeempleado()).append("'").toString() : "NULL").append(",").append(" repehoin = ").append(entity.getrepehoin() != null ? (new StringBuilder()).append("'").append(entity.getrepehoin()).append("'").toString() : "NULL").append(",").append(" repehofi = ").append(entity.getrepehofi() != null ? (new StringBuilder()).append("'").append(entity.getrepehofi()).append("'").toString() : "NULL").append(",").append(" repecanped = ").append(entity.getrepecanped() != null ? (new StringBuilder()).append("'").append(entity.getrepecanped()).append("'").toString() : "NULL").append(",").append(" repeesta = ").append(entity.getrepeesta() != null ? (new StringBuilder()).append("'").append(entity.getrepeesta()).append("'").toString() : "NULL").append(" where repecodsx = ").append(entity.getrepecodsx()).toString();
        int resp = db.executeUpdate(cad);
        return resp != 0;
    }

    public String ValidarEmpleado(String entcodsx)
        throws SQLException
    {
        String cadena = (new StringBuilder()).append("SELECT * FROM empleado WHERE empcedula='").append(entcodsx).append("'").toString();
        String resp = getCampo(cadena);
        return resp == null || resp != null && resp.equals("") ? "FALLO" : resp;
    }

    public String Empleado_by_cedula(String Cedula)
    {
        String cad = "";
        cad = (new StringBuilder()).append("SELECT empcodsx FROM empleado WHERE empcedula ='").append(Cedula).append("'").toString();
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp != null ? resp : "0";
    }
    
    public String getHoraInicio(String Codsx)
    {
        String cad = "";
        cad = "SELECT repehoin FROM registro_pedido WHERE repecodsx ='"+ Codsx + "'";
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp != null ? resp : "0";
    }

    public boolean setEstadoRegistroPedido(String repecodsx, String HoraFin, String Flag)
        throws SQLException
    {
        String cad = "";
        
        if (Flag.equals("0"))
            cad = "UPDATE registro_pedido SET repeesta = 'FINALIZADO', repehofi = '"+ HoraFin + "' WHERE repecodsx = '" + repecodsx + "'";
        else
            cad = "UPDATE registro_pedido SET repeesta = 'FINALIZADO', repehoin = '"+ HoraFin + "' WHERE repecodsx = '" + repecodsx + "'";
        
        int resp = db.executeUpdate(cad);
        return resp != 0;
    }

    public boolean setTiempoTotal(String Codsx)
        throws SQLException
    {
        String cad = (new StringBuilder()).append(" UPDATE registro_pedido_detalle SET rpdeterminado='S', rpdetire = (select repehofi-repehoin from registro_pedido where repecodsx='").append(Codsx).append("') where rpderegped='").append(Codsx).append("'").toString();
        int resp = db.executeUpdate(cad);
        return resp != 0;
    }

    public boolean updateactivar(registro_pedido entity)
        throws SQLException
    {
        String cad = (new StringBuilder()).append(" UPDATE registro_pedido SET entestado = 'PENDIENTE' WHERE entcodsx = ").append(entity.getrepecodsx()).toString();
        int resp = db.executeUpdate(cad);
        return resp != 0;
    }

    public boolean eliminar(String repecodsx)
        throws SQLException
    {
        String elim = (new StringBuilder()).append("DELETE FROM registro_pedido WHERE repecodsx = '").append(repecodsx).append("' AND repeesta='TRAMITE'").toString();
        int r = db.executeUpdate(elim);
        return r != 0;
    }

    public String Getrepecodsx()
    {
        String cad = "";
        cad = "SELECT max(repecodsx) FROM registro_pedido";
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp == null ? "0" : resp;
    }

    public Collection getregistro_pedidos(String fechain, String fechafin)
    {
        String cad = (new StringBuilder()).append("select pedfechasistema, pednumpedido, pedguia, pedfactura, promodelo, refpcantidad, refpvalortotal, pedsubtotal, clinombre, empnombre, repefecha, repehoin, repehofi, rpdetire   from pedido, cliente, referencia_pedido, producto, registro_pedido, registro_pedido_detalle, empleado   where pedcompania='1' and refpnumpedido=pedcodsx and refpproducto=procodsx and         pedcliente=clicodsx and repefecha between '").append(fechain).append("' and '").append(fechafin).append("' and pedcodsx=rpdenumpedido and repecodsx=rpderegped ").append("        and repeempleado=empcodsx ").append("group by pedfechasistema, pednumpedido, pedguia, pedfactura, promodelo, refpcantidad, refpvalortotal , pedsubtotal , clinombre, repefecha,repehoin, repehofi, rpdetire,empnombre ").append("order by repefecha,empnombre,repehoin").toString();
        return getListaDeListas(cad);
    }

    ResultSet rs;
}
