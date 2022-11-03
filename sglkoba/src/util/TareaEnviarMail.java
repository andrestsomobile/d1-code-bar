package util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.TimerTask;

public class TareaEnviarMail extends TimerTask {
	
	public TareaEnviarMail(){
	}
	
	public void run() {
		System.out.println(">>>>>>>TareaEnviarMail<<<<<<<");
		gstenviarmail gst = new gstenviarmail();
		EnviarMail enviarMail = new EnviarMail();
		Collection arreglo = gst.getlistaPendientes();
		if (arreglo != null && !arreglo.isEmpty()) {
			Iterator iterador=arreglo.iterator();
			while(iterador.hasNext()) {
				ArrayList arrOfArr=(ArrayList)iterador.next();
				Iterator iterador2=arrOfArr.iterator();
				while(iterador2.hasNext()){ 
					String codsx = (String)iterador2. next();
					String correo = (String)iterador2. next();
					String asunto = (String)iterador2. next();
					String mensaje = (String)iterador2. next();
					boolean ok = enviarMail.enviarMail(correo, asunto, mensaje);
					if (ok) {
						try {
							gst.setEnviado(codsx);
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		
	}

	
}