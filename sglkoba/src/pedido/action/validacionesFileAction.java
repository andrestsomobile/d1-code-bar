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
import java.util.Calendar;
import java.util.Collection;
import java.util.Iterator;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Fecha; 

public class validacionesFileAction {
	public static String ControlValidaciones(String fechaVencimiento)
	{
		
		//String fechaVencimiento="2009-02-25";
		//boolean resultadofechas=ControlFechaValidaciones(fechaVencimiento);
		
		return fechaVencimiento;
	}
	public static boolean ControlFechaValidaciones(String fechaVencimiento)
	{
		boolean resultadofechas=true;
		resultadofechas=Fecha.compararErroFechaVenci(fechaVencimiento);
		if(resultadofechas==true)
		{
		System.out.println("EXITE INCONSISTENCIAS EN LA FECHA DE VENCIMIENTO : "+resultadofechas);
	
		}else System.out.println("LA FECHA DE VENCIMIENTO ES OPTIMA : "+resultadofechas);
		return resultadofechas;
	}
	public static boolean ControlNroPedidoValidaciones(String pednumpedido)
	{
		//String pednumpedido="1amy";
		int count=0;
		int count2=0;
		boolean numped=false;
		byte arregloByte[] = new byte[pednumpedido.length()]; 
		for(int i=0;i<pednumpedido.length();i++)
		{
	    	arregloByte[i]=(byte) pednumpedido.charAt(i);
	    	//System.out.println("\n caracter "+arregloByte[i]);
	    	if(((arregloByte[i] > 47) && (arregloByte[i] < 58)||((arregloByte[i] > 64) && (arregloByte[i] < 91)))||((arregloByte[i] > 96) && (arregloByte[i] < 123)))
	    	{
	    		count2++;
	    	}else 
	    	{
	    		count++;
	    	}
		}
		if(count==0)
		{
			//System.out.println("\n CADENA OPTIMA el valor del contador de caracteres validos dio "+count2+" el contador de caracteres invalidos dio "+count);
			
		}else 
			{
			//System.out.println("\n EN LA CADENA EXISTEN CARACTERES ESPECIALES NO SIRVE : el valor del contador de caracteres validos dio "+count2+" el contador de caracteres invalidos dio "+count);
			numped=true;
			}
		return numped;
	}
	public static boolean ControlEntradaNros(String numero)
	{
		//String pednumpedido="1amy";
		int count=0;
		int count2=0;
		boolean numped=false;
		byte arregloByte[] = new byte[numero.length()]; 
		for(int i=0;i<numero.length();i++)
		{
	    	arregloByte[i]=(byte) numero.charAt(i);
	    	//System.out.println("\n caracter "+arregloByte[i]);
	    	if(((arregloByte[i] > 47)&&(arregloByte[i] < 58))||((arregloByte[i] > 45)&&(arregloByte[i] < 47)))
	    	{
	    		count2++;
	    	}else 
	    	{
	    		count++;
	    	}
		}
		if(count==0)
		{
			System.out.println("\n CADENA OPTIMA el valor del contador de caracteres validos dio "+count2+" el contador de caracteres invalidos dio "+count);
			
		}else 
			{
			System.out.println("\n EN LA CADENA EXISTEN CARACTERES ESPECIALES NO SIRVE : el valor del contador de caracteres validos dio "+count2+" el contador de caracteres invalidos dio "+count);
			numped=true;
			}
		return numped;
	}
}