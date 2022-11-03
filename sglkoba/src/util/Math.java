package util;

import java.math.BigDecimal;

public class Math {

	public static String sumar(String ...numeros) {
		BigDecimal resp = new BigDecimal("0");
		 for(int i=0; i < numeros.length; i++) {
			 System.out.println(numeros[i]);
			 BigDecimal num = new BigDecimal(numeros[i]==null ||  (numeros[i]!=null && numeros[i].equals("") ) ? "0" : numeros[i]);
			 num.setScale(2, BigDecimal.ROUND_DOWN);
			 resp = resp.add( num);
		 }
		return resp.setScale(2, BigDecimal.ROUND_DOWN).toPlainString();
	}
	
	
	public static String multiplicar(String ...numeros) {
		BigDecimal resp = new BigDecimal("1");
		 for(int i=0; i < numeros.length; i++) {
			 BigDecimal num = new BigDecimal(numeros[i]==null?"0": numeros[i]);
			 resp = resp.multiply(num);
		 }
		 
		return resp.setScale(2, BigDecimal.ROUND_UP).toPlainString();
	}

	
	public static String dividir(String ...numeros) {
		BigDecimal resp = new BigDecimal(numeros[0]);
		System.out.println(numeros[0]);
		 for(int i=1; i < numeros.length; i++) {
			 BigDecimal num = new BigDecimal(numeros[i]);
			 
			 try {
			 resp = resp.divide(num, 2, BigDecimal.ROUND_UP );
			 System.out.println(num + " ? ????");
			 }catch(Exception ex) { ex.printStackTrace(); }
		 }
		 
		return resp.toPlainString();
	}

	public static String restar(String ...numeros) {
		BigDecimal resp = new BigDecimal("0");
		 for(int i=0; i < numeros.length; i++) {
			 BigDecimal num = new BigDecimal(numeros[i]);
			 resp = resp.subtract(num);
		 }
		 
		return resp.setScale(2).toPlainString();
	}


	
	public static BigDecimal sumar_bigdecimal(String ...numeros) {
		BigDecimal resp = new BigDecimal("0");
		 for(int i=0; i < numeros.length; i++) {
			 BigDecimal num = new BigDecimal(numeros[i]);
			 num.setScale(2, BigDecimal.ROUND_DOWN);
			 resp = resp.add( num);
		 }
		return resp.setScale(2, BigDecimal.ROUND_DOWN);
	}
	
	
	public static BigDecimal multiplicar_bigdecimnal(String ...numeros) {
		BigDecimal resp = new BigDecimal("1");
		 for(int i=0; i < numeros.length; i++) {
			 BigDecimal num = new BigDecimal(numeros[i]);
			 resp = resp.multiply(num);
		 }
		 
		return resp.setScale(2, BigDecimal.ROUND_CEILING);
	}

	
	public static BigDecimal dividir_bigdecimal(String ...numeros) {
		BigDecimal resp = new BigDecimal(numeros[0]);
		System.out.println(numeros[0]);
		 for(int i=1; i < numeros.length; i++) {
			 BigDecimal num = new BigDecimal(numeros[i]);
			 
			 try {
			 resp = resp.divide(num, 2, BigDecimal.ROUND_UP );
			 System.out.println(num + " ? ????");
			 }catch(Exception ex) { ex.printStackTrace(); }
		 }
		 
		return resp;
	}

	public static BigDecimal restar_bigdecimal(String minuendo, String substraendo) {
		BigDecimal resp = new BigDecimal(minuendo);
		resp = resp.subtract( new BigDecimal(substraendo));  
		return resp.setScale(2);
	}

	public static BigDecimal dividir_bigdecimal(String minuendo, String substraendo) {
		if(substraendo==null || substraendo!=null && substraendo.equals("0") ) return BigDecimal.ZERO;
		if(minuendo==null || minuendo!=null && minuendo.equals("") ) return BigDecimal.ZERO;
		BigDecimal resp = new BigDecimal(minuendo);
		resp = resp.divide( new BigDecimal(substraendo), 2, BigDecimal.ROUND_UP);  
		return resp.setScale(2);
	}
	
	public static BigDecimal dividir_bigdecimal(String minuendo, String substraendo, int escala) {
		if(substraendo==null || substraendo!=null && substraendo.equals("0") ) return BigDecimal.ZERO;
		if(minuendo==null || minuendo!=null && minuendo.equals("") ) return BigDecimal.ZERO;
		BigDecimal resp = new BigDecimal(minuendo);
		resp = resp.divide( new BigDecimal(substraendo), escala, BigDecimal.ROUND_DOWN);  
		return resp.setScale(escala);
	}

	public static String redondear(String num) {
		BigDecimal a = new BigDecimal(num==null ?"0" : num);
		BigDecimal b = a.setScale(0, BigDecimal.ROUND_UP);
		return b.toPlainString();
	}
	
	public static String getNumeroFormateado(String num) {

		Format_Num  Num = new Format_Num( num==null || (num != null && num.equals("")) ? "0" : num,".",",",",");
		return Num.F_N();
	}
	
	
	public static String getNumeroFormateadoRedondeado(String num) {
		num = redondear(num);
		Format_Num  Num = new Format_Num( num==null ||  (num!=null && num.equals("") )?"0": num,",",",",".");
  		
		return Num.F_N();
	}

	public static int comparar(String a, String b) {
		if(a==null || b==null || (a!=null && a.equals("")) || (b!=null && b.equals(""))) return 0;
		BigDecimal aa = new BigDecimal(a);
		BigDecimal bb = new BigDecimal(b);
		return aa.compareTo(bb);
	}

	public static BigDecimal sumar_bigdecimal(BigDecimal ...numeros) {
		BigDecimal resp = new BigDecimal("0");
		 for(int i=0; i < numeros.length; i++) {
			 BigDecimal num = numeros[i];
			 num.setScale(2, BigDecimal.ROUND_DOWN);
			 resp = resp.add( num);
		 }
		return resp.setScale(2, BigDecimal.ROUND_DOWN);
	}

}
