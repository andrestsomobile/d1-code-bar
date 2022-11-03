<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="maestro.control.*,maestro.entity.*,ingreso.control.*,ingreso.entity.*,java.util.*" %>

<%

String procodsx = request.getParameter("procodsx");
String bodcodsx = request.getParameter("bodega");
String campo = request.getParameter("campo");
String formulario = request.getParameter("formulario");

String tipo = request.getParameter("tipo");
if(tipo==null || ( tipo!=null && (!tipo.equals("NAC") && !tipo.equals("SNAC") && !tipo.equals("TODO")))) tipo = "TODO";

gstproducto gprod = new gstproducto();
gstcompania gcomp = new gstcompania();
gstentrada gent = new gstentrada();
gstbodega gbod = new gstbodega();
producto prod = gprod.getproducto(procodsx);
compania comp = null;
Collection posiciones =null; 
bodega bod = gbod.getbodega(bodcodsx);

if(prod!=null) {
	comp = gcomp.getcompania(prod.getprocodigocia());	 
	posiciones = gent.getListaPosicionesSaldo(procodsx, tipo, bodcodsx);
}



%>    

<%! 
private String getpixel(String posicion , Collection datos, String tipo ) {
	if(datos==null) return "";
	boolean tiene = datos.contains(posicion);
	return tiene ?tipo.equals("TODO") ? "_verde" : tipo.equals("NAC") ?  "_azul" : "_rojo" : "";
}

%>
<style type="text/css">
<!--
.Estilo1 {color: #FFFFFF}
-->
</style>


<table width="1253" border="1">
  <tr>
    <td colspan="67"><div align="center"><strong>BODEGA 13 ESTANTERIA </strong></div></td>
  </tr>
  <tr>
    <td width="4" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="18" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="19" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="14" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="14" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="19" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><form name='saldo' action="mapa.jsp?bodega=<%= bodcodsx %>&campo=<%= campo %>&formulario=<%= formulario %>&procodsx=<%= procodsx %>" method="post" > 
    Bodega: <%= bod.getbodnombre() %> <br>
   <%if(comp!=null) { %> Compania: <%= comp.getcomnombre() %><br> <% }%>
  <% if(prod!=null) { %>  Producto: <%= prod.getpromodelo() + " - " + prod.getprodescripcion()%> <br> 
	Saldo Total: <%= gent.getSaldo(procodsx, tipo) %> <br>
	Tipo Saldo: <select name="tipo" onchange="document.forms[0].submit()"> 
		<option value="NAC" <%= tipo.equals("NAC")? "selected" : "" %> > NACIONALIZADO</option>
		<option value="SNAC" <%= tipo.equals("SNAC")? "selected" : "" %>>SIN NACIONALIZAR</option>
		<option value="TODO" <%= tipo.equals("TODO")? "selected" : "" %>>TODO</option>
	</select>
	<% } %>
	</form></div></td>
    <td width="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="6" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="5" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="16" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="19" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="19" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="14" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="30"><div align="center"><strong>ETAPA 2 </strong></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="36"><div align="center"><strong>ETAPA 1 </strong></div></td>
  </tr>
  <tr>
    <td colspan="30">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="36">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="35">&nbsp;</td>
    <td bordercolor="#FFFFFF"><div align="center">D</div></td>
    <td bordercolor="#FFFFFF"><div align="center">C</div></td>
    <td bordercolor="#FFFFFF"><div align="center">B</div></td>
    <td bordercolor="#FFFFFF"><div align="center">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">A</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">B</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">C</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">D</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">E</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">F</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">G</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">H</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">J</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">I</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">H</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">G</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">F</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">E</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">D</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">C</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">B</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">A</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td rowspan="35">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td rowspan="35">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">J</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">I</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">H</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">G</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">F</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">E</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">D</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">C</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">B</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">A</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">A</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">B</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">C</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">D</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">E</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">F</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">G</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">H</td>
  </tr>
  <tr>
    <td colspan="28" bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="35">&nbsp;</td>
  </tr>
  
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D132')"><img src="./disenno/mapas/pixel<%= getpixel("D132" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C132')"><img src="./disenno/mapas/pixel<%= getpixel("C132" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B132')"><img src="./disenno/mapas/pixel<%= getpixel("B132" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A132')"><img src="./disenno/mapas/pixel<%= getpixel("A132" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">132</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">110</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">88</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">66</td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">44</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">22</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D131')"><img src="./disenno/mapas/pixel<%= getpixel("D131" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C131')"><img src="./disenno/mapas/pixel<%= getpixel("C131" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B131')"><img src="./disenno/mapas/pixel<%= getpixel("B131" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A131')"><img src="./disenno/mapas/pixel<%= getpixel("A131" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">131</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">109</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">87</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">65</td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">43</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">21</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">130</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">108</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">86</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">64</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">42</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">20</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">129</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">107</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">85</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">63</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">41</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">19</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">128</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">106</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">84</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">62</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">40</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">18</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">127</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">105</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">83</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">61</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">39</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">17</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">126</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">104</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">82</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">60</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">38</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">16</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">125</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">103</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">81</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">59</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">37</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">15</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">124</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">102</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">80</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">58</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">36</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">14</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">123</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">101</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">79</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">57</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">35</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">13</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">122</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">100</td>
    <td colspan="4" rowspan="2" bordercolor="#000000" bgcolor="#FFFFFF"><div align="center">PUENTE</div></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center">PUENTE</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">78</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">56</td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center">PUENTE</div></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center">PUENTE</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">34</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">12</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">121</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">99</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">77</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">55</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">33</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">11</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">120</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">98</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">76</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">54</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">32</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">10</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">119</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">97</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">75</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">53</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">31</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">9</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">118</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">96</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">74</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">52</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">30</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">8</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">117</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">95</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">73</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">51</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">29</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">7</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">116</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">94</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">72</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">50</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">28</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">6</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">115</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">93</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">71</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">49</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">27</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">5</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">114</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">92</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">70</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">48</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">26</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF">4</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td> <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">113</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">91</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">69</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">47</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">25</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">3</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">112</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">90</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">68</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">46</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">24</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">2</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">111</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">89</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">67</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">45</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">23</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">1</td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I21')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td colspan="28">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="35">&nbsp;</td>
  </tr>
</table>
</body>
</html>
