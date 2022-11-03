<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.util.*" %>
    
<%@ taglib uri="/WEB-INF/popup.tld"    prefix="popup"%> 


<%  
String clase = request.getParameter("clase");	//clase gst, va con el paquete y todo: maestro.control.gstxxx	
String entidad = request.getParameter("entidad"); //entidad a obtener lista, va con el paquete: maestro.entity.gstxxx
String metodo = request.getParameter("metodo"); //metodo de la clase a invocat
String reload= request.getParameter("reload"); //url a recargar (puede ser nulo)
String formulario= request.getParameter("formulario"); //formulario
String metodo_total = request.getParameter("metodo_total"); //metodo de la clase a invocat

String[] parametros = request.getParameterValues("parametros"); //parametros de consulta
String[] parametros_total = request.getParameterValues("parametros_total"); //parametros de consulta del total

String[] campos_form= request.getParameterValues("campos_form");	   //campos en el window.opener para hacer pick
String[] campos_pick = request.getParameterValues("campos_pick");	   //campos en el window.opener para hacer pick
String[] campos_entity =request.getParameterValues("campos_entity");//campos de la entidad a mostrar
String[] nombres_campos_entity =request.getParameterValues("nombres_campos_entity");//campos de la entidad a mostra

String[] campos_foranea = request.getParameterValues("campos_foranea");
String[] tablas_foranea = request.getParameterValues("tablas_foranea");
String[] primarias_foranea= request.getParameterValues("primarias_foranea");
String[] desc_foranea= request.getParameterValues("desc_foranea");




//para pagiacion
String pag = request.getParameter("pag");
System.out.println("pag:"+ pag);
//parametro de busqueda
String param= request.getParameter("param");
	param = param==null ?"" : param;
 	parametros[parametros.length -1]= param;
 	parametros[parametros.length -2]= (pag==null ||  (pag!=null && pag.equals("0") )?"0":pag);
 	parametros_total[parametros_total.length -1 ]= param;
 	
 	 
 	Collection lista = util.helperPopup.getLista(  clase, metodo, parametros ); 
%>
						<popup:lista lista="<%= lista %>"  clase="<%=clase %>" 
						entidad="<%=entidad %>" metodo_total="<%= metodo_total %>"
						parametros_total="<%= parametros_total %>"
						formulario="<%=formulario %>" metodo="<%=metodo %>"
						parametros="<%= parametros %>" campos_form="<%= campos_form %>"
						campos_pick="<%= campos_pick%>"
						campos_entity="<%= campos_entity %>" 
						nombres_campos_entity="<%= nombres_campos_entity %>"
						campos_foranea="<%= campos_foranea %>"
						tablas_foranea="<%= tablas_foranea %>"
						primarias_foranea="<%= primarias_foranea %>"
						desc_foranea="<%= desc_foranea %>"
						 />


<%

String url = "popup.jsp?clase="+ clase +"&formulario="+formulario+"&metodo="+ metodo + "&entidad="+ entidad + "&reload="+ reload +
			"&metodo_total="+ metodo_total +"&param="+ param;
				//ciclo con los parametros
				for(int i=0;  parametros!=null &&  i<parametros.length;i++) 
						url +="&parametros="+ parametros[i] ;
				for(int i=0;  parametros_total!=null &&  i<parametros_total.length;i++) 
					url +="&parametros_total="+ parametros_total[i] ;
				//ciclo con los campos
				for(int i=0; campos_form!=null && i< campos_form.length;i++) 
						url +="&campos_form="+ campos_form[i] ;
				
				for(int i=0; campos_pick!=null && i< campos_pick.length;i++) 
					url +="&campos_pick="+ campos_pick[i] ;
				//ciclo con los campos_entity
				for(int i=0; campos_entity!=null &&i<campos_entity.length;i++) 
						url +="&campos_entity="+ campos_entity[i] ;
				//ciclo con los nombres_campos_entity
				for(int i=0;nombres_campos_entity!=null && i <nombres_campos_entity.length;i++) 
						url +="&nombres_campos_entity="+ nombres_campos_entity[i] ;
				
				//ciclo con las foraneas:
				for(int i=0;campos_foranea!=null && i <campos_foranea.length;i++)
					url +="&campos_foranea="+ campos_foranea[i] ;
				//tablas foraneas
				for(int i=0;tablas_foranea!=null && i <tablas_foranea.length;i++)
					url +="&tablas_foranea="+ tablas_foranea[i] ;
				//primarias_foranea
				for(int i=0;primarias_foranea!=null && i <primarias_foranea.length;i++)
					url +="&primarias_foranea="+ primarias_foranea[i] ;
				//desc_foranea
				for(int i=0;desc_foranea!=null && i <desc_foranea.length;i++)
					url +="&desc_foranea="+ desc_foranea[i] ;

				
			int paginas = util.helperPopup.getTotal(clase, metodo_total, entidad, parametros_total);
		
%>
<%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p"%>
<p:paginar actual='<%= pag==null ?"0":pag %>' total="<%= (paginas) %>" url="<%= url %>" />

