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

public class pruebas {
	public static void main(String[] args )
	{
		String pedfechasistema = Fecha.getFechaSinHora();
		//String pedfechasistema = "200";
		String pedfechavenc = "2008-09-22";
		String[] pedFechaPartesVenc=pedfechavenc.split("-");
		if(pedFechaPartesVenc.length>=3)
		{	
			System.out.println("\nFECHA vencimiento "+pedfechavenc);
			System.out.println("FECHA SIN FORMATO "+pedfechasistema);
			String[] pedFechaPartes=pedfechasistema.split("-");
			/////fecha de sistema
			String ano=pedFechaPartes[0];
			String mes=pedFechaPartes[1];
			String dia=pedFechaPartes[2];
			if(mes.length()==1)
			{
				mes="0"+pedFechaPartes[1];
			}
			if(dia.length()==1)
			{
				dia="0"+pedFechaPartes[2];
			}
			pedfechasistema=ano+"-"+mes+"-"+dia;
			///////fecha de vencimiento
			String anoVenc=pedFechaPartesVenc[0];
			String mesVenc=pedFechaPartesVenc[1];
			String diaVenc=pedFechaPartesVenc[2];
			if(mesVenc.length()==1)
			{
				mesVenc="0"+pedFechaPartesVenc[1];
			}
			if(diaVenc.length()==1)
			{
				diaVenc="0"+pedFechaPartesVenc[2];
			}
			//////////////////
			try {
			int a=Integer.parseInt(diaVenc);
			}catch (Exception e) 
			  {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				//System.out.println("la fecha de vencimiento es erronea");
				
			  }
			pedfechavenc=anoVenc+"-"+mesVenc+"-"+diaVenc;
			System.out.println("\nFECHA NUEVA "+pedfechasistema);
			System.out.println("\nFECHA NUEVA vencimiento "+pedfechavenc);
			if (pedfechasistema.compareTo(pedfechavenc) >= 0)
			{
				System.out.println("la fecha de vencimiento erronea");
			}
			else
			{
				System.out.println(" la fecha de vencimiento es optima");
			}
			
		}else
		{
			System.out.println(" la fecha de vencimiento es erronea");
		}
	}
}	
	