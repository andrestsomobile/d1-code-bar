 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   ayuda.control.*,ayuda.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   

 gstfaq gfaq = new gstfaq(); 
  gfaq.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   

 Collection lista = gfaq.getlistafaq(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de faqs </div> 
 <br> 
 <table width='80%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "ayuda", "faq.jsp") ){ %> 
 <a href='main.jsp?app=ayuda&modulo=faq_datos'> Nuevo faq </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=ayuda&modulo=faq'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
 <table align='center'  width='100%' border='0' class='tabla_listas' cellspacing='0' cellpading='0'> 
 	<tr>  
 <th> Pregunta
 <th> Respuesta Corta
 <th> Respuesta LArga
 <th> Opcion	<logic:iterate id="temp" name="lista" type="ayuda.entity.faq"  >
 <tr align='center'>  
 <td>  <%= temp.getfaqpregunta() %>
 <td>  <%= temp.getfaqrespcorta() %>
 <td>  <%= temp.getfaqresplarga() %>

 <td> <a href='faqAction.do?opcion=set&codsx=<%= temp.getfaqcodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "ayuda", "faq.jsp") ){ %> 
		<a href="javascript:validarDelete('faqAction.do?opcion=delete&codsx=<%= temp.getfaqcodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% 	 String url = "main.jsp?app=ayuda&modulo=faq&param=" + (param==null?"":param); 
 int paginas = gfaq.getTotalPaginaslistafaq(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 