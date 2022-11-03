package util;



import java.util.Vector;

import javax.mail.*;
import javax.mail.internet.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class sendmail {

	/**
	 * 
	 * @param destino
	 * @param origen
	 * @param subject
	 * @param contenido
	 * @return true o false
	 * @throws NamingException
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public static boolean enviar(Vector destinos, String origen,String subject,  
			String contenido)   {
		boolean resp = true;

	 
	        // Acquire our JavaMail session object
          Context initCtx;
		try {
			initCtx = new InitialContext();

		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		Object ob = envCtx.lookup("mail/Session");
		System.out.println(ob);
		System.out.println(ob.getClass());
          Session session =(Session) ob ;

          

            /*  Properties p = new Properties();
              p.put("mail.host", "127.0.0.1");
              p.put("mail.user", "pablito");

              session = Session.getDefaultInstance(p, null);
 */
System.out.println("**************SESION MAIL:***********: " + session);
          // Prepare our mail message
          Message message = new MimeMessage(session);
          message.setFrom(new InternetAddress(origen));
          InternetAddress dests[] = new InternetAddress[destinos.size()];
          for(int i=0; i < destinos.size(); i++){
          	System.out.println((String)destinos.elementAt(i));
          dests[i] =  new InternetAddress((String)destinos.elementAt(i)); 
          }
          message.setRecipients(Message.RecipientType.TO, dests);
          message.setSubject(subject);
          message.setContent(contenido, "text/plain");

          // Send our mail message
          Transport.send(message);
          resp = true;
          
		} catch (Exception e) {
			e.printStackTrace();
			resp = false;
		}
		return resp;
	}
	
	
	public static void main(String args[]) {
		Vector x = new Vector();
		x.add("pablito816@gmail.com");
		
		sendmail.enviar( x, "pablito816@gmail.com", "adlgo" , "conte");
				
	}
}