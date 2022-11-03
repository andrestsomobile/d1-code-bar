 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import=" administracion.control.*,   averias.control.*,averias.entity.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
 maestro.control.gstcompania gcomp = new maestro.control.gstcompania();
 maestro.control.gstbodega gbod = new maestro.control.gstbodega();
 maestro.control.gstproducto gprod = new maestro.control.gstproducto();
 ingreso.control.gstentrada gent = new ingreso.control.gstentrada();
 
 gstaveria gaveria = new gstaveria(); 
 gaveria.setMaxfilas(10);  

 String param = request.getParameter("param"); 
 String pag = request.getParameter("pag");   

 Collection lista = gaveria.getlistaaveria(pag, param); 
 request.setAttribute("lista", lista); 
  %> 
 <div class="titulo"> Gestion de Detalle de Averias </div> 
 <br> 
 <table width='100%' align='center' border='0'> 
 	<Tr> 
 	<td align='left'>   
 <%if(gstpermiso.getEscritura(session, "averias", "averia.jsp") ){ %> 
 <a href='main.jsp?app=averias&modulo=averia_datos'> Nuevo Detalle Averia </a> 
 <% } %> 
 	<td align='right'> 	<form method='post' action='main.jsp?app=averias&modulo=averia'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='100%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 	<tr>  
 	
 <th> Codigo (*)
 <th> Compania (*)
 <th> Fecha (*)
 <th> Ingreso
 <th> Cant Pleg Nac
 <th> Cant Pleg NNac
 <th> Cant Prod Nac
 <th> Cant Prod NNac
 <th> Saldo Pleg Nac
 <th> Saldo Pleg NNac
 <th> Saldo Prod Nac
 <th> Saldo Prod NNac

 <th> Opcion	<logic:iterate id="temp" name="lista" type="averias.entity.averia"  >
 <tr align='center'>  
 <td>  <%= temp.getavecodsx() %>
 <td>  <%= gcomp.getcompania( temp.getavecompania()).getcomnombre() %>
 <td>  <%= temp.getavefecha() %>
 <td>  
 <%
 ingreso.entity.entrada ent = gent.getentrada( temp.getaveentrada());
 maestro.entity.bodega bod = gbod.getbodega(ent.getEntbodega());
 maestro.entity.producto prod = gprod.getproducto( ent.getentcodproducto());
 %>
 Consec: <%= temp.getaveingreso() %>.Bodega: <%= bod.getbodnombre() %>. Posicion: <%= ent.getentposicion() %>.
 <br> Producto <%=  prod.getpromodelo() + " " + prod.getprodescripcion() %>
 <td>  <%= temp.getavecant_pleg_nac() %>
 <td>  <%= temp.getavecant_pleg_nnac() %>
 <td>  <%= temp.getavecant_prod_nac() %>
 <td>  <%= temp.getavecant_prod_nnac() %>
 <td>  <%= temp.getavesaldo_pleg_nac() %>
 <td>  <%= temp.getavesaldo_pleg_nnac() %>
 <td>  <%= temp.getavesaldo_prod_nac() %>
 <td>  <%= temp.getavesaldo_prod_nnac() %>

 <td> <a href='averiaAction.do?opcion=set&codsx=<%= temp.getavecodsx()%>'> <img src="./disenno/images/update.gif" border="0" > </a> 			&nbsp;| &nbsp; 
 <%if(gstpermiso.getEscritura(session, "averias", "averia.jsp") && temp.getaveestado().equals("TRAMITE")){ %> 
		<a href="javascript:validarDelete('averiaAction.do?opcion=delete&codsx=<%= temp.getavecodsx()  %>')"> <img src="./disenno/images/substract.gif" border="0" > </a>   
 <% } %> 
 </logic:iterate>
  </table> 
	 <% String url = "main.jsp?app=averias&modulo=averia&param=" + (param==null?"":param); 
 int paginas = gaveria.getTotalPaginaslistaaveria(param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <BR>Los Parametros con (*) son de busqueda.
 <br>Tambien puede buscar por el codigo de la referencia y/o descripcion de la misma