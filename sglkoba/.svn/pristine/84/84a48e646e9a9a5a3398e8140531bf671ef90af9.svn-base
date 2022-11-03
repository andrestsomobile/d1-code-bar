
package pedido.control;

import java.io.*;
import java.awt.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import pedido.entity.*;
import util.Math;
import db.*;
import java.util.Collection;
import java.math.BigDecimal;
import java.sql.SQLException;

import db.GstTabla;



public class gstFile extends GstTabla
{
	
	public static void main(String[] args)
	{
		
		try {
			  String texto="";
			  String contenedor[];
			  int i,j,comas=0,contadorComas=0;
			
			  FileReader fr = new FileReader("c:/PED0010508_(2).txt");
			  BufferedReader entrada = new BufferedReader(fr);
			  String s;
			  try 
			  {
				  //int s1 = Integer.parseInt(entrada.readLine());
				 // System.out.println("NRO COMA :"+s1);
				  while((s = entrada.readLine()) != null)
				  	{
					  //String[] contenedor=new 
					  texto += s + "  \n";
					  contenedor=s.split(",");
					  System.out.println("\t"+contenedor[0]);
					  comas++;
					  
				  	 }
				  
				  System.out.println("CANTIDAD FILAS :"+contadorComas);
			  } 
			  catch (IOException e) 
			  {
				// TODO Auto-generated catch block
				e.printStackTrace();
			  }
			  System.out.println("cantidad de caracteres: "+comas);
			}
		
			catch(java.io.FileNotFoundException fnfex) 
			{
			  System.out.println("se presento el error: "+fnfex.toString());
			}
			
	}
}
