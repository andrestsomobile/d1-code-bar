package util;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;

import pedido.control.gstpedido;
import pedido.entity.pedido;

/**
 * @author   palito
 */
public class Camiones {

	/**
	 * @uml.property  name="cont_g"
	 */
	private int cont_g;

	/**
	 * @uml.property  name="cont_m"
	 */
	private int cont_m;

	/**
	 * @uml.property  name="cont_p"
	 */
	private int cont_p;
	
	/**
	 * @uml.property  name="peso"
	 */
	private BigDecimal peso;

	/**
	 * @uml.property  name="vol"
	 */
	private BigDecimal vol;

	/**
	 * @uml.property  name="mpacks"
	 */
	private BigDecimal mpacks;

	/**
	 * @uml.property  name="peso_mpack"
	 */
	private BigDecimal peso_mpack;

	/**
	 * @uml.property  name="vol_mpack"
	 */
	private BigDecimal vol_mpack;
	
	/**
	 * @uml.property  name="mpack_g"
	 */
	private BigDecimal mpack_g;

	/**
	 * @uml.property  name="mpack_m"
	 */
	private BigDecimal mpack_m;

	/**
	 * @uml.property  name="mpack_p"
	 */
	private BigDecimal mpack_p;
	
	/**
	 * @uml.property  name="tipo_modulo"
	 */
	private String tipo_modulo;
	/**
	 * @uml.property  name="modulo_peso"
	 */
	private BigDecimal modulo_peso;

	/**
	 * @uml.property  name="modulo_vol"
	 */
	private BigDecimal modulo_vol;
	/**
	 * @uml.property  name="mpack_modulo"
	 */
	private BigDecimal mpack_modulo;
	/**
	 * @uml.property  name="pedidos"
	 */
	private String[] pedidos;
	private gstpedido gped = new gstpedido();
	/**
	 * @uml.property  name="cad_pedidos"
	 */
	private String cad_pedidos = "";
	
	/**
	 * @uml.property  name="cont_g_tipo"
	 */
	private BigDecimal cont_g_tipo;

	/**
	 * @uml.property  name="cont_m_tipo"
	 */
	private BigDecimal cont_m_tipo;

	/**
	 * @uml.property  name="cont_p_tipo"
	 */
	private BigDecimal cont_p_tipo;
	/**
	 * @uml.property  name="mpack_g_tipo"
	 */
	private BigDecimal mpack_g_tipo;

	/**
	 * @uml.property  name="mpack_m_tipo"
	 */
	private BigDecimal mpack_m_tipo ;

	/**
	 * @uml.property  name="mpack_p_tipo"
	 */
	private BigDecimal mpack_p_tipo;
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Camiones cam = new Camiones();
		String[] peds = new String[] {"2","3", "4"};
		//cam.execute(peds);
		cam.peso = new BigDecimal("1695");
		cam.vol = new BigDecimal("61.5");
		cam.mpacks = new BigDecimal("79.16");
		cam.getDatos();
		cam.calculoTipoCamion();
		System.out.println("PESO TOTAL: "  + cam.getPeso());
		System.out.println("volumen TOTAL:"  + cam.getVol());
		System.out.println("total masterpack:"  + cam.getMpacks());
		System.out.println("Camiones Grandes " + cam.getCont_g());
		System.out.println("Camiones Medianos " + cam.getCont_m());
		System.out.println("Camiones pequenos " + cam.getCont_p());
		System.out.println("Peso Mpack (promedio) " + cam.getPeso_mpack());
		System.out.println("vol Mpack (promedio) " + cam.getVol_mpack());
		
		System.out.println("Cantidad de Mpack Camiones Grandes FULL: " + cam.getMpack_g());
		System.out.println("Cantidad de Mpack Camiones Saldo tipo " + cam.getTipo_modulo() + " :" + cam.getMpack_modulo());
		
		System.out.println("Camiones completos pequenos:" + cam.getCont_p_tipo() + " , mpacks: " + cam.getMpack_p_tipo());
		System.out.println("Camiones completos medianos:" + cam.getCont_m_tipo() + " , mpacks: " + cam.getMpack_m_tipo());
		System.out.println("Camiones completos grandes:" + cam.getCont_g_tipo() + " , mpacks: " + cam.getMpack_g_tipo());
	}
	
	
	public void execute(String fecha_ini, String fecha_fin, String[] pedidos) {
		this.pedidos = pedidos;
		
		peso = new BigDecimal("0");
		vol = new BigDecimal("0");
		mpacks = new BigDecimal("0");
		peso.setScale(2,BigDecimal.ROUND_DOWN);
		vol.setScale(2,BigDecimal.ROUND_DOWN);
		mpacks.setScale(2,BigDecimal.ROUND_DOWN);
		
		//si la fecha viene, saco el array de pedidos finalizados en esa fecha
		if(!fecha_ini.equals("") && !fecha_fin.equals("")) {
		Collection peds = gped.getlistapedidoFinalizado(fecha_ini + " 00:00", fecha_fin + " 23:59");
		Iterator ite = peds.iterator();
		pedidos = new String[peds.size()];
		int i=0;
			while(ite.hasNext()) {
				pedido ped = (pedido)ite.next();
				pedidos[i++] = ped.getpedcodsx();
			}
		}
		
		for(int i=0; pedidos!=null && i< pedidos.length; i++) {
			if(pedidos[i].equals("")) continue;
			pedido ped = gped.getpedido( pedidos[i]);
			if(ped==null) continue;
			
			cad_pedidos += ped.getpednumpedido() + " - ";
			
			String p =ped.getPedpesobruto();
			peso =  peso.add( new BigDecimal(p==null ? "0" : p) );
			String v =gped.getVolumenPedidoMasterPacks( pedidos[i]);
			vol = vol.add( new BigDecimal(v ==null ? "0" : v));
			String m = gped.getMasterPacksPedido( pedidos[i] );
			mpacks = mpacks.add( new BigDecimal( m==null ? "0" : m) );
		}
		//luego del resumen, ahorita si calculo:
		getDatos();
		vol = new BigDecimal ( Math.sumar( new String[]{ vol.toPlainString() , "0"}) );
		mpacks = new BigDecimal ( Math.sumar( new String[]{ mpacks.toPlainString() , "0"}) );

		calculoTipoCamion();
		
		//como el peso es en toneladas, lo divido entre mil:

	}
	
	
	private void getDatos( ) {
		
	
		//calculo de datos del mpack individual:
		if(mpacks.compareTo(BigDecimal.ZERO)==0) return;
		peso_mpack = peso.divide(mpacks , 2, BigDecimal.ROUND_DOWN);
		vol_mpack  = vol.divide(mpacks , 2, BigDecimal.ROUND_DOWN);
		
		//comienzo dividiendo ambos por el valor del maximo camion:
		 modulo_peso = new BigDecimal(peso.floatValue()%30000);
		 modulo_vol  = new BigDecimal(vol.floatValue()%65);
		
		//el resultado, para saber cuantos camiones grandes necesito inicialmente:
		BigDecimal result_peso = peso.divide( new BigDecimal("30000"), 2, BigDecimal.ROUND_DOWN);
		BigDecimal result_vol  = vol.divide( new BigDecimal("65") , 2, BigDecimal.ROUND_DOWN);
		
		//ahora miro cual de los dos es mayor, para asi pedir ese mayhor numero de camiones, puesto que
		//eso indicara que una relacion es mayor a la otra( peso mayor a volumen en camiones, o al reves)
		if(result_peso.compareTo(result_vol)>=0){ 
			//se requieren mas camiones por peso, es decir que la mcia es pesada pero pequena
			cont_g = result_peso.intValue();
			calculoPeso();
			calculoMpacksPeso();
		}else  {
			//se requieren mas camiones por volumen, es decir que la mercancia es liviana pero amplia
			cont_g = result_vol.intValue();
			calculoVolumen();
			calculoMpacksVolumen();
		}
		
	}
	
	private void calculoVolumen( ) {
		System.out.println("por volumen");
		BigDecimal modulo = modulo_vol;
		if( modulo.compareTo( new BigDecimal("40"))==1 && modulo.compareTo( new BigDecimal("65"))<=0)  {
			//el modulo >40 y modulo<=65, es uno grane
			this.cont_g++;
			tipo_modulo = "MULA";
		}else if(  modulo.compareTo( new BigDecimal("29"))==1 && modulo.compareTo( new BigDecimal("40"))<0  ) {
			//modulo >29 y <=40, es uno mediano
			this.cont_m++;
			tipo_modulo = "DOBLE TROQUE";
		}else if(  modulo.compareTo( new BigDecimal("29"))<=0 &&  modulo.compareTo(BigDecimal.ZERO) >=0) {
			//modulo <=29, es uno pequeno
			this.cont_p++;
			tipo_modulo = "SENCILLO";
		}
	}
	private void calculoMpacksVolumen (){
		//cuantos hay por grandes completos, solo cuando hay mas de un camion
		if(this.cont_g + this.cont_m + cont_m>1){
		this.mpack_g= new BigDecimal("65").divide(vol_mpack, 2, BigDecimal.ROUND_DOWN);//los saco por volumen
		}
		//ahora el del modulo:
		this.mpack_modulo = modulo_vol.divide(vol_mpack, 2, BigDecimal.ROUND_DOWN);//los saco por volumen

	}
/**
 * mira si el restante es para usar un camion pequeno, grande o mediano
 * @param modulo el modulo o saldo restante
 */
	private void calculoPeso() {
BigDecimal modulo = modulo_peso;
		if( modulo.compareTo( new BigDecimal("18000"))==1 && modulo.compareTo( new BigDecimal("30000"))<=0)  {
			//el modulo >18 y modulo<=30, es uno grane
			this.cont_g++;
			tipo_modulo = "MULA";
			
		}else if(  modulo.compareTo( new BigDecimal("8000"))==1 && modulo.compareTo( new BigDecimal("18000"))<=0  ) {
			//modulo >8 y <=18, es uno mediano
			this.cont_m++;
			tipo_modulo = "DOBLE TROQUE";
		}else if(  modulo.compareTo( new BigDecimal("8000"))<=0 &&  modulo.compareTo(BigDecimal.ZERO) >=0) {
			//modulo <=8, es uno pequeno
			this.cont_p++;
			tipo_modulo = "SENCILLO";
		}
	}
	
	/**
	 * En este punto ya tengo cuantos camiones grandes, medianos o pequenos necesito,
	 * ahora tengo que ver cuantos mpacks por cada camion.
	 *  se calculan una cantidad por 
	 */
	private void calculoMpacksPeso(){	
		//cuantos hay por grandes completos:
		mpack_g= new BigDecimal("30000").divide(peso_mpack, 2, BigDecimal.ROUND_DOWN);//los saco por volumen
		//ahora el del modulo:
		mpack_modulo= modulo_peso.divide(peso_mpack, 2, BigDecimal.ROUND_DOWN);//los saco por volumen
	}
/**
 * con este calculo, obtengo cuantos camiones grandes, pequenos o medianos:
 *
 */
	private void calculoTipoCamion() {
		BigDecimal p = peso.divide( new  BigDecimal("30000" ), 0 ,BigDecimal.ROUND_UP ); 
		BigDecimal v  =vol.divide( new  BigDecimal("65" ), 0 ,BigDecimal.ROUND_UP);
		
		if(p.compareTo(v) >=0)
			cont_g_tipo = p;	
		else cont_g_tipo =   v;
		
		p = peso.divide( new  BigDecimal("18000" ), 0 ,BigDecimal.ROUND_UP ); 
		v  =vol.divide( new  BigDecimal("40" ), 0 ,BigDecimal.ROUND_UP);

		if(p.compareTo(v) >=0)
			cont_m_tipo = p;	
		else cont_m_tipo =   v;

		p = peso.divide( new  BigDecimal("8000" ), 0 ,BigDecimal.ROUND_UP ); 
		v  =vol.divide( new  BigDecimal("29" ), 0 ,BigDecimal.ROUND_UP);

		if(p.compareTo(v) >=0)
			cont_p_tipo = p;	
		else cont_p_tipo =   v;

		calculoMasterPackTipoCamion();
	}
	
	
	private void calculoMasterPackTipoCamion() {
		BigDecimal p = peso.divide( new  BigDecimal("30000" ), 0 ,BigDecimal.ROUND_UP ); 
		BigDecimal v  =vol.divide( new  BigDecimal("65" ), 0 ,BigDecimal.ROUND_UP);
		
		if(vol_mpack==null ) return;
		if(p.compareTo(v) >0)
			mpack_g_tipo=  new BigDecimal("30000").divide(peso_mpack, 0 ,BigDecimal.ROUND_UP );	
		else mpack_g_tipo =   new BigDecimal("65").divide( vol_mpack, 0 ,BigDecimal.ROUND_UP );
		
		p = peso.divide( new  BigDecimal("18000" ), 0 ,BigDecimal.ROUND_UP ); 
		v  =vol.divide( new  BigDecimal("40" ), 0 ,BigDecimal.ROUND_UP);

		if(p.compareTo(v) >0)
			mpack_m_tipo=  new BigDecimal("18000").divide( peso_mpack, 0 ,BigDecimal.ROUND_UP );	
		else mpack_m_tipo =   new BigDecimal("40").divide( vol_mpack, 0 ,BigDecimal.ROUND_UP );

		p = peso.divide( new  BigDecimal("8000" ), 0 ,BigDecimal.ROUND_UP ); 
		v  =vol.divide( new  BigDecimal("29" ), 0 ,BigDecimal.ROUND_UP);

		if(p.compareTo(v) >0)
			mpack_p_tipo=  new BigDecimal("8000").divide( peso_mpack, 0 ,BigDecimal.ROUND_UP );
		else mpack_p_tipo =   new BigDecimal("29").divide( vol_mpack, 0 ,BigDecimal.ROUND_UP );

	}

	
	/**
	 * @return
	 * @uml.property  name="cont_g"
	 */
	public int getCont_g() {
		return cont_g;
	}
	
	/**
	 * @return
	 * @uml.property  name="cont_m"
	 */
	public int getCont_m() {
		return cont_m;
	}

	/**
	 * @return
	 * @uml.property  name="cont_p"
	 */
	public int getCont_p() {
		return cont_p;
	}

	/**
	 * @return
	 * @uml.property  name="mpacks"
	 */
	public BigDecimal getMpacks() {
		return mpacks;
	}

	/**
	 * @return
	 * @uml.property  name="peso"
	 */
	public BigDecimal getPeso() {
		return peso;
	}

	/**
	 * @return
	 * @uml.property  name="peso_mpack"
	 */
	public BigDecimal getPeso_mpack() {
		return peso_mpack;
	}

	/**
	 * @return
	 * @uml.property  name="vol"
	 */
	public BigDecimal getVol() {
		return vol;
	}

	/**
	 * @return
	 * @uml.property  name="vol_mpack"
	 */
	public BigDecimal getVol_mpack() {
		return vol_mpack;
	}

	/**
	 * @return
	 * @uml.property  name="modulo_peso"
	 */
	public BigDecimal getModulo_peso() {
		return modulo_peso;
	}

	/**
	 * @return
	 * @uml.property  name="modulo_vol"
	 */
	public BigDecimal getModulo_vol() {
		return modulo_vol;
	}

	/**
	 * @return
	 * @uml.property  name="mpack_g"
	 */
	public BigDecimal getMpack_g() {
		return mpack_g;
	}

	/**
	 * @return
	 * @uml.property  name="mpack_m"
	 */
	public BigDecimal getMpack_m() {
		return mpack_m;
	}

	/**
	 * @return
	 * @uml.property  name="mpack_p"
	 */
	public BigDecimal getMpack_p() {
		return mpack_p;
	}

	/**
	 * @return
	 * @uml.property  name="tipo_modulo"
	 */
	public String getTipo_modulo() {
		return tipo_modulo;
	}

	/**
	 * @return
	 * @uml.property  name="mpack_modulo"
	 */
	public BigDecimal getMpack_modulo() {
		return mpack_modulo;
	}


	/**
	 * @return
	 * @uml.property  name="cad_pedidos"
	 */
	public String getCad_pedidos() {
		return cad_pedidos;
	}


	/**
	 * @return
	 * @uml.property  name="cont_g_tipo"
	 */
	public BigDecimal getCont_g_tipo() {
		return cont_g_tipo;
	}


	/**
	 * @return
	 * @uml.property  name="cont_m_tipo"
	 */
	public BigDecimal getCont_m_tipo() {
		return cont_m_tipo;
	}


	/**
	 * @return
	 * @uml.property  name="cont_p_tipo"
	 */
	public BigDecimal getCont_p_tipo() {
		return cont_p_tipo;
	}


	/**
	 * @return
	 * @uml.property  name="gped"
	 */
	public gstpedido getGped() {
		return gped;
	}


	/**
	 * @return
	 * @uml.property  name="mpack_g_tipo"
	 */
	public BigDecimal getMpack_g_tipo() {
		return mpack_g_tipo;
	}


	/**
	 * @return
	 * @uml.property  name="mpack_m_tipo"
	 */
	public BigDecimal getMpack_m_tipo() {
		return mpack_m_tipo;
	}


	/**
	 * @return
	 * @uml.property  name="mpack_p_tipo"
	 */
	public BigDecimal getMpack_p_tipo() {
		return mpack_p_tipo;
	}


	/**
	 * @return
	 * @uml.property  name="pedidos"
	 */
	public String[] getPedidos() {
		return pedidos;
	}
	
	
}
