package pedido.action;
import ingreso.control.gstentrada;
import ingreso.control.gstingreso;
import ingreso.entity.entrada;
import ingreso.entity.ingreso;
import java.io.*;
import java.awt.*;
import pedido.control.gestionSaldos;
import pedido.control.gstpedido;
import pedido.control.gstreferencia_pedido;
import pedido.entity.*;
import pedido.form.*;
import util.Fecha;
import util.Math;
import maestro.control.gstcliente;
import maestro.control.gstproducto;
import maestro.control.gstsucursal;
import maestro.entity.cliente;
import maestro.entity.sucursal;
import nacionalizacion.control.gstnacionalizacion_detalle;
import nacionalizacion.entity.nacionalizacion_detalle;
import org.apache.struts.action.*;
import db.beanConnector;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import db.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Iterator;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Fecha; 

public class pruebas2 {
	public static void main(String[] args )
	{
		boolean resultado;
		int i=0;
		String pedfechasistema = Fecha.getFechaSinHora();
		System.out.println("\nFECHA DEL SISTEMA SIN FORMATO :"+pedfechasistema);
		String pedfechavenc = "200*-09-25";
		System.out.println("\nFECHA DE VENCIMIENTO          :"+pedfechavenc);
		String[] pedFechaPartesVenc=pedfechavenc.split("-");
		String[] pedFechaPartesSist=pedfechasistema.split("-");
		System.out.println("\nLONGITUD FECHA DEL SISTEMA :"+pedFechaPartesVenc.length);
		System.out.println("\nLONGITUD FECHA DE PEDIDO   :"+pedFechaPartesSist.length);
		if((pedFechaPartesVenc.length)>=3)
		{
			String ano=pedFechaPartesSist[0];
			String mes=pedFechaPartesSist[1];
			String dia=pedFechaPartesSist[2];
			String anoVenc=pedFechaPartesVenc[0];
			String mesVenc=pedFechaPartesVenc[1];
			String diaVenc=pedFechaPartesVenc[2];
			
			if(mes.length()==1)
			{
				mes="0"+pedFechaPartesSist[1];
			}
			if(dia.length()==1)
			{
				dia="0"+pedFechaPartesSist[2];
			}
			try {
			int anoVencparse=Integer.parseInt(pedFechaPartesVenc[0]);
			int mesVencparse=Integer.parseInt(pedFechaPartesVenc[1]);
			int diaVencparse=Integer.parseInt(pedFechaPartesVenc[2]);
			}catch (Exception e) 
			  {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				System.out.println("\nFECHA DE VENCIMIENTO ERRONEA");
				resultado=true;
				i=1;
			  } 
			pedfechavenc=pedFechaPartesVenc[0]+"-"+pedFechaPartesVenc[1]+"-"+pedFechaPartesVenc[2];
			pedfechasistema=ano+"-"+mes+"-"+dia;
			System.out.println("\nFECHA DEL SISTEMA CON FORMATO :"+pedfechasistema);
			if(i==0)
			{
			resultado=Fecha.compararfechasFormato(pedfechasistema,pedfechavenc);
			System.out.println("\nLONGITUD FECHA DE PEDIDO   :"+resultado);
			}
		}else resultado=true; System.out.println("\nFECHA DE VENCIMIENTO ERRONEA");
	}
}