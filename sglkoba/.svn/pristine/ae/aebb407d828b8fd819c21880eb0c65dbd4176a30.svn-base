 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso, ingreso.control.*,java.util.*"%> 
 <html> 

 <%@ taglib uri="/WEB-INF/struts-logic.tld"  prefix="logic"%> 

 <%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>

 <%   
  
 gstingreso gingreso = new gstingreso(); 
  gingreso.setMaxfilas(10);  

 String param = request.getParameter("param"); 
  String pag = request.getParameter("pag");   
String tipo = request.getParameter("tipo");   
 Collection lista = gingreso.getlistaingreso(tipo, pag, param);  
 request.setAttribute("lista", lista); 
  %> 
  
  <script type="text/javascript">
  function autoriza() 
  {
  var mensaje;
  var opcion = prompt("Introduzca su Clave:", "******");
   
  if (opcion == null || opcion == "") {
          mensaje = "Has cancelado o no has digitado la clave";
          } else {
             // mensaje = "Hola " + opcion;
              }
              document.getElementById("id1").innerHTML = mensaje;
  }
  
  </script>
 <div class="titulo">Despachos a Regionales </div> 
 <br> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' > 
 	<Tr> 
 	<td align='left'>

 	<td align='right'> 	<form method='post' action='main.jsp?app=ingreso&modulo=ingreso'> 
 <input type='text' name='param' value='<%=param==null ? "" : param %>'> 
 <%if(tipo!=null){ %> 
 <input type='hidden' name='tipo' value='<%=tipo%>'> 
 <%} %>
 <input type='submit' name='buscar' value='Buscar'> 
 </form> 
 </table> 
<table align='center'  width='90%' border='0' cellspacing='0' cellpading='0' class="tabla_listas"> 
 <tr>  
 	<th> Consecutivo (*)
 	<th> Empresa (*)
	<th> Fecha (*)
	<th> Destino    
	<th> Materiales
	<th> Transportadora
	<th> Vehiculo
	<th> Costo Flete 
	<th> Opcion	
</tr> 
 
 
<!--  <tr><td>1</td><td>BODEGA IMPORTADOS</td><td>2020-08-11</td> -->
<!--  <td>6A02 - REGIONAL EJE CAFETERO</td> -->
<!--  <td><table> -->
<!--   <tr><th>Material  -->
<!--  <th> Descripción  -->
<!--  <th> Cantidad -->
<!--  <tr> -->
<!--  <td>12000382</td><td>TOALLA DESINFECTANTE BRILLA KING 50 UND</td><td>240</td> -->
<!--  </table> -->
<!--  <td><select id="desptipoveh" > -->
<!--         <option value="COLTANQUES">COLTANQUES</option> -->
<!--         <option value="DITRANSA">DITRANSA</option>  -->
<!--         <option value="KOBA">KOBA</option> -->
<!--         <option value="AJUSTE SALIDAS">AJUSTE SALIDAS</option>  -->
<!--         <option value="BOTERO SOTO">BOTERO SOTO</option>  -->
<!--         <option value="Union Andina de Transportes S.A">Union Andina de Transportes S.A</option>  -->
<!--        </select> </td> -->
<!--  <td><select id="" > -->
<!--         <option value="TURBO">TURBO</option> -->
<!--         <option value="SENCILLO">SENCILLO</option>  -->
<!--         <option value="MINIMULA">MINIMULA</option> -->
<!--         <option value="MULA">MULA</option>  -->
<!--         <option value="CONTENEDOR">CONTENEDOR</option>  -->
<!--         <option value="VEHICULO PROPIO">VEHICULO PROPIO</option>  -->
<!--        </select> </td>        -->
<!--  <td><input type='text'><a href='#'  onclick='autoriza()' >Cambio Flete</a></td> -->
<!--  <td><input type='button' value='FINALIZAR' /></td> -->
<!--  </tr>	 -->
 
<!--   <tr><td>2</td><td>BODEGA IMPORTADOS</td><td>2020-08-11</td><td>6A03-1 - REGIONAL ANTIOQUIA NORTE URABA</td> -->
<!--   <td><table> -->
<!--   <tr><th>Material  -->
<!--  <th> Descripción  -->
<!--  <th> Cantidad -->
<!--  <tr> -->
<!--   <td>12000285</td><td>CREMA AVELLANAS CON CACAO NUZART 350 GRS</td><td>150</td> -->
<!--    </table> -->
<!--   <td><select id="desptipoveh" > -->
<!--         <option value="COLTANQUES">COLTANQUES</option> -->
<!--         <option value="DITRANSA">DITRANSA</option>  -->
<!--         <option value="KOBA">KOBA</option> -->
<!--         <option value="AJUSTE SALIDAS">AJUSTE SALIDAS</option>  -->
<!--         <option value="BOTERO SOTO">BOTERO SOTO</option>  -->
<!--         <option value="Union Andina de Transportes S.A">Union Andina de Transportes S.A</option>  -->
<!--        </select> </td> -->
<!--        <td><select id="desptipoveh" > -->
<!--         <option value="TURBO">TURBO</option> -->
<!--         <option value="SENCILLO">SENCILLO</option>  -->
<!--         <option value="MINIMULA">MINIMULA</option> -->
<!--         <option value="MULA">MULA</option>  -->
<!--         <option value="CONTENEDOR">CONTENEDOR</option>  -->
<!--         <option value="VEHICULO PROPIO">VEHICULO PROPIO</option>  -->
<!--        </select> </td> -->
<!--  <td><input type='text'><a href='#'  onclick='autoriza()' >Cambio Flete</a></td> -->
<!--  <td><input type='button' value='FINALIZAR' /></td> -->
<!--  </tr>		 -->
  
	 <% 	 String url = "main.jsp?app=ingreso&modulo=ingreso&param=" + (param==null?"":param) + "&tipo=" + (tipo==null ?"": tipo ); 
 int paginas = 0; //gingreso.getTotalPaginaslistaingreso(tipo, param); 
 %> 
 <%@ taglib uri="/WEB-INF/Paginador.tld" prefix="p" %> 
 <p:paginar  actual="<%= pag %>"   total="<%= (paginas) %>" url="<%= url %>"   /> 
 <br>Los campos con (*) son de busqueda
 <br>Tambien puede buscar por los PRODUCTOS (Referencia y Descripcion) asociados