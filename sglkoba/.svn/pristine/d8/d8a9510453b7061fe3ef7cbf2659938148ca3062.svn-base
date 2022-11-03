package util;

public class validador {

	 public static boolean validarNumero(String num){
		 //System.out.println("EL NUMERO EN EL VALIDADOR ES: " + num);
		 num = num ==null ? "" : num;
		 boolean resp = false;
		 try 
		 	{
			float f = Float.parseFloat(num);
			if(f>=	0)
			 resp = true;
			else resp = false;
		 	}catch(NumberFormatException e) {   }
		 return resp;
	 }
	 
	 public static boolean isNumeric(String cadena){
			try {
				Integer.parseInt(cadena);
				return true;
			} catch (NumberFormatException nfe){
				return false;
			}
		}
	 
	 public static boolean esMayorEnteros(String mayorEntero, String menorEntero){
		 try {
			 int mayor = Integer.parseInt(mayorEntero);
			 int menor = Integer.parseInt(menorEntero);
			 if(mayor - menor > 0)
				 return true;
			 else
				 return false;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return false;
			
			// TODO: handle exception
		}
		 
	 }

	 
//	 public static boolean validarFecha(String fecha) {}
}
