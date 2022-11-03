// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 07/07/2011 11:28:46 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   gstregistro_pedido_detalle.java

package registro.control;

import db.GstTabla;
import db.beanConnector;
import java.io.PrintStream;
import java.sql.SQLException;
import java.util.Collection;
import registro.entity.registro_pedido_detalle;
import registro.form.registro_pedido_detalleForm;

public class gstregistro_pedido_detalle extends GstTabla
{

    public gstregistro_pedido_detalle()
    {
        db = new beanConnector();
        classEntidad = registro_pedido_detalle.class;
    }

    public gstregistro_pedido_detalle(beanConnector db)
    {
        this.db = db;
        classEntidad = registro_pedido_detalle.class;
    }

    public Collection getlistaregistro_pedido_detalle()
    {
        String consulta = " SELECT * FROM registro_pedido_detalle WHERE rpdecodsx!=0 order by rpdecodsx desc ";
        return getLista(consulta);
    }

    public Collection getlistaregistro_pedido_detalle(String start, String param)
    {
        start = start == null ? "0" : start;
        param = param == null ? "" : param;
        String consulta = (new StringBuilder()).append(" SELECT * FROM registro_pedido_detalle where rpderegped = '").append(param).append("' ").append(" order by rpdecodsx asc ").append("  limit ").append(maxfilas).append(" offset  ").append(Integer.parseInt(start) * maxfilas).toString();
        return getLista(consulta);
    }

    public int getTotalPaginaslistaregistro_pedido_detalle(String param)
    {
        param = param == null ? "" : param;
        String consulta = " SELECT count(1) FROM registro_pedido_detalle   ";
        return getPaginas(consulta);
    }

    public boolean crearregistro_pedido_detalle(String rpdecodsx, String rpderegped, String rpdenumpedido, String rpdetire, String rpdeterminado)
        throws SQLException
    {
        String insert = (new StringBuilder()).append("INSERT INTO registro_pedido_detalle (rpdecodsx, rpderegped, rpdenumpedido, rpdetire, rpdeterminado) VALUES (").append(rpdecodsx == null ? "NULL" : (new StringBuilder()).append("'").append(rpdecodsx).append("'").toString()).append(",").append(rpderegped == null ? "NULL" : (new StringBuilder()).append("'").append(rpderegped).append("'").toString()).append(",").append(rpdenumpedido == null ? "NULL" : (new StringBuilder()).append("'").append(rpdenumpedido).append("'").toString()).append(",").append(rpdetire == null ? "NULL" : (new StringBuilder()).append("'").append(rpdetire).append("'").toString()).append(",").append(rpdeterminado == null ? "NULL" : (new StringBuilder()).append("'").append(rpdeterminado).append("'").toString()).append(")").toString();
        int resp = db.executeUpdate(insert);
        return resp != 0;
    }

    public registro_pedido_detalle getregistro_pedido_detalle(String rpdecodsx)
    {
        String cad = (new StringBuilder()).append("SELECT * FROM registro_pedido_detalle WHERE rpdecodsx ='").append(rpdecodsx).append("'").toString();
        return (registro_pedido_detalle)getEntidad(cad);
    }

    public registro_pedido_detalle getregistro_pedido_detalle_ultimo(String rpderegped)
    {
        String cad = (new StringBuilder()).append("SELECT * FROM registro_pedido_detalle WHERE rpderegped ='").append(rpderegped).append("'").toString();
        return (registro_pedido_detalle)getEntidad(cad);
    }

    public boolean updateregistro_pedido_detalle(registro_pedido_detalle entity)
        throws SQLException
    {
        String cad = (new StringBuilder()).append("update registro_pedido_detalle set  rpdecodsx = ").append(entity.getrpdecodsx() != null ? (new StringBuilder()).append("'").append(entity.getrpdecodsx()).append("'").toString() : "NULL").append(",").append(" rpderegped= ").append(entity.getrpderegped() != null ? (new StringBuilder()).append("'").append(entity.getrpderegped()).append("'").toString() : "NULL").append(",").append(" rpdenumpedido = ").append(entity.getrpdenumpedido() != null ? (new StringBuilder()).append("'").append(entity.getrpdenumpedido()).append("'").toString() : "NULL").append(",").append(" rpdetire = ").append(entity.getrpdetire() != null ? (new StringBuilder()).append("'").append(entity.getrpdetire()).append("'").toString() : "NULL").append(" where repecodsx = ").append(entity.getrpdecodsx()).toString();
        int resp = db.executeUpdate(cad);
        return resp != 0;
    }

    public boolean updateregistro_pedido_detalle(registro_pedido_detalleForm entity)
        throws SQLException
    {
        String cad = (new StringBuilder()).append("update registro_pedido_detalle set  rpdecodsx = ").append(entity.getrpdecodsx() != null ? (new StringBuilder()).append("'").append(entity.getrpdecodsx()).append("'").toString() : "NULL").append(",").append(" rpderegped= ").append(entity.getrpderegped() != null ? (new StringBuilder()).append("'").append(entity.getrpderegped()).append("'").toString() : "NULL").append(",").append(" rpdenumpedido = ").append(entity.getrpdenumpedido() != null ? (new StringBuilder()).append("'").append(entity.getrpdenumpedido()).append("'").toString() : "NULL").append(",").append(" rpdetire = ").append(entity.getrpdetire() != null ? (new StringBuilder()).append("'").append(entity.getrpdetire()).append("'").toString() : "NULL").append(" where rpdecodsx = ").append(entity.getrpdecodsx()).toString();
        int resp = db.executeUpdate(cad);
        return resp != 0;
    }

    public boolean eliminar(String rpdecodsx)
        throws SQLException
    {
        String elim = (new StringBuilder()).append(" delete from registro_pedido_detalle where rpdecodsx = '").append(rpdecodsx).append("'").toString();
        int r = db.executeUpdate(elim);
        return r != 0;
    }

    public String DifHora(String Salida, String Ingreso)
    {
        String cad = "";
        cad = (new StringBuilder()).append("SELECT '").append(Salida).append("' - '").append(Ingreso).append("' FROM registro_pedido_detalle").toString();
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp == null ? "0" : resp;
    }

    public String getpedcodsx(String pednumpedido)
    {
        String cad = "";
        cad = (new StringBuilder()).append("SELECT pedcodsx FROM pedido where pednumpedido = '").append(pednumpedido).append("'").toString();
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp == null ? "0" : resp;
    }

    public String getpedguias(String pedcodsx)
    {
        String cad = "";
        cad = (new StringBuilder()).append("SELECT pedguia FROM pedido where pedcodsx = '").append(pedcodsx).append("'").toString();
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp == null ? "0" : resp;
    }

    public String Getrpdecodsx()
    {
        String cad = "";
        cad = "SELECT max(rpdecodsx) FROM registro_pedido_detalle";
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp == null ? "0" : resp;
    }

    public String Getrpdecodsx(String Ident)
    {
        String cad = "";
        cad = (new StringBuilder()).append("SELECT max(rpdecodsx) FROM registro_pedido_detalle WHERE rpderegped = (SELECT repecodsx FROM registro_pedido WHERE repeempleado = '").append(Ident).append("' AND repeesta='TRAMITE') AND rpdeterminado!='S'").toString();
        System.out.print(cad);
        String resp = getCampo(cad);
        return resp == null ? "0" : resp;
    }

    public boolean SetBD()
        throws SQLException
    {
        String cad = "SET lc_time='spanish'";
        int resp = db.executeUpdate(cad);
        return resp != 0;
    }
}
