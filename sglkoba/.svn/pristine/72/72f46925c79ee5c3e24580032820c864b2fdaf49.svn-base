package pedido.action;

import pedido.control.gstpedido;
import maestro.control.gstsucursal;
import maestro.entity.sucursal;

public class pruebas5 {
	public static void main(String[] args )
	{
	/*
		String cadena="   ";
		boolean resp=ControlNroPedidoValidaciones(cadena);
		if(resp==false)
		{
			System.out.println("\n CADENA OPTIMA");
		}else System.out.println("\n CADENA ERRONEA");
		String pedsucursal = "01";
		  gstsucursal con_sucursal = new gstsucursal();
		  sucursal entity= con_sucursal.getsucursal(pedsucursal);
	*/
		  String pedsucursal = "01";
		  String succodigo = "0189yn";
		  String promodelo = "AP-47001";
		  gstsucursal con_sucursal = new gstsucursal();
		  gstpedido objetocontsucur = new gstpedido();
		  int a=objetocontsucur.getPedidoRefPromodelo(promodelo);
		  sucursal entity= con_sucursal.getsucursal(pedsucursal);
		  int sucursal=con_sucursal.getcountsucursal(succodigo);
		  System.out.println("\n CANTIDAD DE SUSCURSALES CON ESE CODIGO: "+succodigo+"   "+sucursal);
		  System.out.println("\n CANTIDAD DE PRODUCTOS CON ESE CODIGO:con modelo "+promodelo+" existe en la base de datos la cantidad de "+a);
		  String pedcliente = entity.getsuccodcliente(); 
		  String peddireccion = entity.getsucdireccion();  
		  String pedciudad = entity.getsucciudad();  
		  String peddepartamento = entity.getsucdepartamento();
		  String numero="10.59"; 
		  boolean resNroU=ControlEntradaNrosVlorU(numero);
		  System.out.println("\nNUMERO A VALIDAR : "+numero);
		  System.out.println("\nTRUE SIGNIFICA QUE NO SIRVE Y FALSE QUE SI ES ACEPTADO");
		 // System.out.println("\nVALOR UNITARIO ecepta los siguientes ej. 0.1 0.2 0.3 : "+res);
		  boolean resNrocant=ControlEntradaNrosCant(numero);
		 // System.out.println("\nCANTIDAD : "+res2);
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
	
	public static boolean ControlEntradaNrosVlorU(String numero)
	{
		int c=0;
		double pednum=0;
		boolean resp=true;
		try
		{
			pednum=Double.parseDouble(numero);
			//System.out.println( " \nentrada try valor de numero = "+pednum );
		}
		catch(Exception e) 
		{
			   //System.out.println( "Se ha producido un error" );
			   c++;
			   resp=true;
		}
		if(c==0)
		{
			//System.out.println( "entrada antes validador" );
			if(pednum>0)
			{
				//System.out.println( "entrada validador" );
				resp=false;
				
			}
		}
		return resp;

	}
	
	public static boolean ControlEntradaNrosCant(String numero)
	{
		int c=0;
		int pednum=0;
		boolean resp=true;
		try
		{
			pednum=Integer.parseInt(numero);
			//System.out.println( " \nentrada try valor de numero = "+pednum );
		}
		catch(Exception e) 
		{
			  // System.out.println( "Se ha producido un error" );
			   c++;
			   resp=true;
		}
		if(c==0)
		{
			//System.out.println( "entrada antes validador" );
			if(pednum>0)
			{
				//System.out.println( "entrada validador" );
				resp=false;
				
			}
		}
		return resp;
	}
	
	
	}


