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

public class pruebas3 {
	public static void main(String[] args )
	{
		String fechaVencimiento="2009-02-25";
		boolean resultadofechas=Fecha.compararErroFechaVenci(fechaVencimiento);
		if(resultadofechas==true)
		{
		System.out.println("EXITE INCONSISTENCIAS EN LA FECHA DE VENCIMIENTO : "+resultadofechas);
	
		}else System.out.println("LA FECHA DE VENCIMIENTO ES OPTIMA : "+resultadofechas);
}
}