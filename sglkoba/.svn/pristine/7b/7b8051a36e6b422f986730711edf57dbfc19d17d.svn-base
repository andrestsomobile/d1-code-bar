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


<table width="1278" border="1">
  <tr bordercolor="#000000">
    <td colspan="67" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bordercolor="#000000">
    <td colspan="67" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><form name='saldo' action="mapa.jsp?bodega=<%= bodcodsx %>&campo=<%= campo %>&formulario=<%= formulario %>&procodsx=<%= procodsx %>" method="post" > 
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
      </form>
    </div></td>
  </tr>
  <tr>
    <td colspan="30" bordercolor="#000000"><div align="center">Etapa 2 </div></td>
    <td width="6" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="36" bordercolor="#000000"><div align="center">Etapa 1 </div></td>
  </tr>
  <tr>
    <td colspan="30" bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="36" bordercolor="#000000">&nbsp;</td>
  </tr>
  <tr>
    <td width="4" rowspan="35" bordercolor="#000000">&nbsp;</td>
    <td width="18" bordercolor="#FFFFFF"><div align="center">D</div></td>
    <td width="19" bordercolor="#FFFFFF"><div align="center">C</div></td>
    <td width="14" bordercolor="#FFFFFF"><div align="center">B</div></td>
    <td width="14" bordercolor="#FFFFFF"><div align="center">A</div></td>
    <td width="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">J</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">I</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td width="19" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="7" rowspan="35">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="5" rowspan="35">&nbsp;</td>
    <td width="16" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">I</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">J</div></td>
    <td width="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">J</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">I</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td width="19" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="10" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="19" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td width="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td width="13" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td width="14" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
  </tr>
  
  
  <tr>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">132</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">110</td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#000000"><span class="Estilo1">111</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">88</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">66</td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('A66')"><img src="./disenno/mapas/pixel<%= getpixel("A66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('B66')"><img src="./disenno/mapas/pixel<%= getpixel("B66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('C66')"><img src="./disenno/mapas/pixel<%= getpixel("C66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('D66')"><img src="./disenno/mapas/pixel<%= getpixel("D66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('E66')"><img src="./disenno/mapas/pixel<%= getpixel("E66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('F66')"><img src="./disenno/mapas/pixel<%= getpixel("F66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('G66')"><img src="./disenno/mapas/pixel<%= getpixel("G66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('H66')"><img src="./disenno/mapas/pixel<%= getpixel("H66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I66')"><img src="./disenno/mapas/pixel<%= getpixel("I66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('J66')"><img src="./disenno/mapas/pixel<%= getpixel("J66" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J44')"><img src="./disenno/mapas/pixel<%= getpixel("J44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I44')"><img src="./disenno/mapas/pixel<%= getpixel("I44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H44')"><img src="./disenno/mapas/pixel<%= getpixel("H44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G44')"><img src="./disenno/mapas/pixel<%= getpixel("G44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F44')"><img src="./disenno/mapas/pixel<%= getpixel("F44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E44')"><img src="./disenno/mapas/pixel<%= getpixel("E44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D44')"><img src="./disenno/mapas/pixel<%= getpixel("D44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C44')"><img src="./disenno/mapas/pixel<%= getpixel("C44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B44')"><img src="./disenno/mapas/pixel<%= getpixel("B44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A44')"><img src="./disenno/mapas/pixel<%= getpixel("A44" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">44</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">22</td>
    <td bordercolor="#000000"><a href="javascript:pick('A22')"><img src="./disenno/mapas/pixel<%= getpixel("A22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B22')"><img src="./disenno/mapas/pixel<%= getpixel("B22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C22')"><img src="./disenno/mapas/pixel<%= getpixel("C22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D22')"><img src="./disenno/mapas/pixel<%= getpixel("D22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E22')"><img src="./disenno/mapas/pixel<%= getpixel("E22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F22')"><img src="./disenno/mapas/pixel<%= getpixel("F22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G22')"><img src="./disenno/mapas/pixel<%= getpixel("G22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H22')"><img src="./disenno/mapas/pixel<%= getpixel("H22" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">131</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">109</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">87</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">65</td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('A65')"><img src="./disenno/mapas/pixel<%= getpixel("A65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('B65')"><img src="./disenno/mapas/pixel<%= getpixel("B65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('C65')"><img src="./disenno/mapas/pixel<%= getpixel("C65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('D65')"><img src="./disenno/mapas/pixel<%= getpixel("D65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('E65')"><img src="./disenno/mapas/pixel<%= getpixel("E65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('F65')"><img src="./disenno/mapas/pixel<%= getpixel("F65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('G65')"><img src="./disenno/mapas/pixel<%= getpixel("G65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('H65')"><img src="./disenno/mapas/pixel<%= getpixel("H65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I65')"><img src="./disenno/mapas/pixel<%= getpixel("I65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('J65')"><img src="./disenno/mapas/pixel<%= getpixel("J65" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J43')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I43')"><img src="./disenno/mapas/pixel<%= getpixel("I43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H43')"><img src="./disenno/mapas/pixel<%= getpixel("H43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G43')"><img src="./disenno/mapas/pixel<%= getpixel("G43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F43')"><img src="./disenno/mapas/pixel<%= getpixel("F43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E43')"><img src="./disenno/mapas/pixel<%= getpixel("E43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D43')"><img src="./disenno/mapas/pixel<%= getpixel("D43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C43')"><img src="./disenno/mapas/pixel<%= getpixel("C43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B43')"><img src="./disenno/mapas/pixel<%= getpixel("B43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A43')"><img src="./disenno/mapas/pixel<%= getpixel("A43" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">43</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">21</td>
    <td bordercolor="#000000"><a href="javascript:pick('A21')"><img src="./disenno/mapas/pixel<%= getpixel("A21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B21')"><img src="./disenno/mapas/pixel<%= getpixel("B21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C21')"><img src="./disenno/mapas/pixel<%= getpixel("C21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D21')"><img src="./disenno/mapas/pixel<%= getpixel("D21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E21')"><img src="./disenno/mapas/pixel<%= getpixel("E21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F21')"><img src="./disenno/mapas/pixel<%= getpixel("F21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G21')"><img src="./disenno/mapas/pixel<%= getpixel("G21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H21')"><img src="./disenno/mapas/pixel<%= getpixel("H21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">130</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">108</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">86</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">64</td>
    <td bordercolor="#000000"><a href="javascript:pick('A64')"><img src="./disenno/mapas/pixel<%= getpixel("A64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B64')"><img src="./disenno/mapas/pixel<%= getpixel("B64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C64')"><img src="./disenno/mapas/pixel<%= getpixel("C64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D64')"><img src="./disenno/mapas/pixel<%= getpixel("D64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E64')"><img src="./disenno/mapas/pixel<%= getpixel("E64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F64')"><img src="./disenno/mapas/pixel<%= getpixel("F64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G64')"><img src="./disenno/mapas/pixel<%= getpixel("G64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H64')"><img src="./disenno/mapas/pixel<%= getpixel("H64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I64')"><img src="./disenno/mapas/pixel<%= getpixel("I64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J64')"><img src="./disenno/mapas/pixel<%= getpixel("J64" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J42')"><img src="./disenno/mapas/pixel<%= getpixel("J42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I42')"><img src="./disenno/mapas/pixel<%= getpixel("I42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H42')"><img src="./disenno/mapas/pixel<%= getpixel("H42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G42')"><img src="./disenno/mapas/pixel<%= getpixel("G42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F42')"><img src="./disenno/mapas/pixel<%= getpixel("F42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E42')"><img src="./disenno/mapas/pixel<%= getpixel("E42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D42')"><img src="./disenno/mapas/pixel<%= getpixel("D42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C42')"><img src="./disenno/mapas/pixel<%= getpixel("C42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B42')"><img src="./disenno/mapas/pixel<%= getpixel("B42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A42')"><img src="./disenno/mapas/pixel<%= getpixel("A42" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">42</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">20</td>
    <td bordercolor="#000000"><a href="javascript:pick('A20')"><img src="./disenno/mapas/pixel<%= getpixel("A20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B20')"><img src="./disenno/mapas/pixel<%= getpixel("B20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C20')"><img src="./disenno/mapas/pixel<%= getpixel("C20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D20')"><img src="./disenno/mapas/pixel<%= getpixel("D20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E20')"><img src="./disenno/mapas/pixel<%= getpixel("E20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F20')"><img src="./disenno/mapas/pixel<%= getpixel("F20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G20')"><img src="./disenno/mapas/pixel<%= getpixel("G20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H20')"><img src="./disenno/mapas/pixel<%= getpixel("H20" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">129</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">107</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">85</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">63</td>
    <td bordercolor="#000000"><a href="javascript:pick('A63')"><img src="./disenno/mapas/pixel<%= getpixel("A63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B63')"><img src="./disenno/mapas/pixel<%= getpixel("B63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C63')"><img src="./disenno/mapas/pixel<%= getpixel("C63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D63')"><img src="./disenno/mapas/pixel<%= getpixel("D63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E63')"><img src="./disenno/mapas/pixel<%= getpixel("E63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F63')"><img src="./disenno/mapas/pixel<%= getpixel("F63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G63')"><img src="./disenno/mapas/pixel<%= getpixel("G63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H63')"><img src="./disenno/mapas/pixel<%= getpixel("H63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I63')"><img src="./disenno/mapas/pixel<%= getpixel("I63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J63')"><img src="./disenno/mapas/pixel<%= getpixel("J63" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J41')"><img src="./disenno/mapas/pixel<%= getpixel("J41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I41')"><img src="./disenno/mapas/pixel<%= getpixel("I41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H41')"><img src="./disenno/mapas/pixel<%= getpixel("H41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G41')"><img src="./disenno/mapas/pixel<%= getpixel("G41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F41')"><img src="./disenno/mapas/pixel<%= getpixel("F41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E41')"><img src="./disenno/mapas/pixel<%= getpixel("E41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D41')"><img src="./disenno/mapas/pixel<%= getpixel("D41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C41')"><img src="./disenno/mapas/pixel<%= getpixel("C41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B41')"><img src="./disenno/mapas/pixel<%= getpixel("B41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A41')"><img src="./disenno/mapas/pixel<%= getpixel("A41" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">41</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">19</td>
    <td bordercolor="#000000"><a href="javascript:pick('A19')"><img src="./disenno/mapas/pixel<%= getpixel("A19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B19')"><img src="./disenno/mapas/pixel<%= getpixel("B19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C19')"><img src="./disenno/mapas/pixel<%= getpixel("C19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D19')"><img src="./disenno/mapas/pixel<%= getpixel("D19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E19')"><img src="./disenno/mapas/pixel<%= getpixel("E19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F19')"><img src="./disenno/mapas/pixel<%= getpixel("F19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G19')"><img src="./disenno/mapas/pixel<%= getpixel("G19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H19')"><img src="./disenno/mapas/pixel<%= getpixel("H19" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">128</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">106</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">84</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">62</td>
    <td bordercolor="#000000"><a href="javascript:pick('A62')"><img src="./disenno/mapas/pixel<%= getpixel("A62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B62')"><img src="./disenno/mapas/pixel<%= getpixel("B62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C62')"><img src="./disenno/mapas/pixel<%= getpixel("C62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D62')"><img src="./disenno/mapas/pixel<%= getpixel("D62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E62')"><img src="./disenno/mapas/pixel<%= getpixel("C62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F62')"><img src="./disenno/mapas/pixel<%= getpixel("F62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G62')"><img src="./disenno/mapas/pixel<%= getpixel("G62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H62')"><img src="./disenno/mapas/pixel<%= getpixel("H62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I62')"><img src="./disenno/mapas/pixel<%= getpixel("I62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J62')"><img src="./disenno/mapas/pixel<%= getpixel("J62" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J40')"><img src="./disenno/mapas/pixel<%= getpixel("J40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I40')"><img src="./disenno/mapas/pixel<%= getpixel("I40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H40')"><img src="./disenno/mapas/pixel<%= getpixel("H40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G40')"><img src="./disenno/mapas/pixel<%= getpixel("G40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F40')"><img src="./disenno/mapas/pixel<%= getpixel("F40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E40')"><img src="./disenno/mapas/pixel<%= getpixel("E40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D40')"><img src="./disenno/mapas/pixel<%= getpixel("D40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C40')"><img src="./disenno/mapas/pixel<%= getpixel("C40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B40')"><img src="./disenno/mapas/pixel<%= getpixel("B40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A40')"><img src="./disenno/mapas/pixel<%= getpixel("A40" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">40</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">18</td>
    <td bordercolor="#000000"><a href="javascript:pick('A18')"><img src="./disenno/mapas/pixel<%= getpixel("A18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B18')"><img src="./disenno/mapas/pixel<%= getpixel("B18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C18')"><img src="./disenno/mapas/pixel<%= getpixel("C18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D18')"><img src="./disenno/mapas/pixel<%= getpixel("D18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E18')"><img src="./disenno/mapas/pixel<%= getpixel("E18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F18')"><img src="./disenno/mapas/pixel<%= getpixel("F18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G18')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H18')"><img src="./disenno/mapas/pixel<%= getpixel("H18" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">127</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">105</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">83</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">61</td>
    <td bordercolor="#000000"><a href="javascript:pick('A61')"><img src="./disenno/mapas/pixel<%= getpixel("A61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B61')"><img src="./disenno/mapas/pixel<%= getpixel("B61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C61')"><img src="./disenno/mapas/pixel<%= getpixel("C61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D61')"><img src="./disenno/mapas/pixel<%= getpixel("D61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E61')"><img src="./disenno/mapas/pixel<%= getpixel("E61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F61')"><img src="./disenno/mapas/pixel<%= getpixel("F61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G61')"><img src="./disenno/mapas/pixel<%= getpixel("G61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H61')"><img src="./disenno/mapas/pixel<%= getpixel("H61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I61')"><img src="./disenno/mapas/pixel<%= getpixel("I61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J61')"><img src="./disenno/mapas/pixel<%= getpixel("J61" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J39')"><img src="./disenno/mapas/pixel<%= getpixel("J39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I39')"><img src="./disenno/mapas/pixel<%= getpixel("I39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H39')"><img src="./disenno/mapas/pixel<%= getpixel("H39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G39')"><img src="./disenno/mapas/pixel<%= getpixel("G39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F39')"><img src="./disenno/mapas/pixel<%= getpixel("F39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E39')"><img src="./disenno/mapas/pixel<%= getpixel("E39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D39')"><img src="./disenno/mapas/pixel<%= getpixel("D39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C39')"><img src="./disenno/mapas/pixel<%= getpixel("C39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B39')"><img src="./disenno/mapas/pixel<%= getpixel("B39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A39')"><img src="./disenno/mapas/pixel<%= getpixel("A39" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">39</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">17</td>
    <td bordercolor="#000000"><a href="javascript:pick('A17')"><img src="./disenno/mapas/pixel<%= getpixel("A17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B17')"><img src="./disenno/mapas/pixel<%= getpixel("B17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C17')"><img src="./disenno/mapas/pixel<%= getpixel("C17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D17')"><img src="./disenno/mapas/pixel<%= getpixel("D17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E17')"><img src="./disenno/mapas/pixel<%= getpixel("E17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F17')"><img src="./disenno/mapas/pixel<%= getpixel("F17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G17')"><img src="./disenno/mapas/pixel<%= getpixel("G17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H17')"><img src="./disenno/mapas/pixel<%= getpixel("H17" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">126</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">104</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">82</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">60</td>
    <td bordercolor="#000000"><a href="javascript:pick('A60')"><img src="./disenno/mapas/pixel<%= getpixel("A60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B60')"><img src="./disenno/mapas/pixel<%= getpixel("B60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C60')"><img src="./disenno/mapas/pixel<%= getpixel("C60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D60')"><img src="./disenno/mapas/pixel<%= getpixel("D60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E60')"><img src="./disenno/mapas/pixel<%= getpixel("E60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F60')"><img src="./disenno/mapas/pixel<%= getpixel("F60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G60')"><img src="./disenno/mapas/pixel<%= getpixel("G60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H60')"><img src="./disenno/mapas/pixel<%= getpixel("H60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I60')"><img src="./disenno/mapas/pixel<%= getpixel("I60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J60')"><img src="./disenno/mapas/pixel<%= getpixel("J60" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J38')"><img src="./disenno/mapas/pixel<%= getpixel("J38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I38')"><img src="./disenno/mapas/pixel<%= getpixel("I38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H38')"><img src="./disenno/mapas/pixel<%= getpixel("H38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G38')"><img src="./disenno/mapas/pixel<%= getpixel("G38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F38')"><img src="./disenno/mapas/pixel<%= getpixel("F38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E38')"><img src="./disenno/mapas/pixel<%= getpixel("E38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D38')"><img src="./disenno/mapas/pixel<%= getpixel("D38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C38')"><img src="./disenno/mapas/pixel<%= getpixel("C38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B38')"><img src="./disenno/mapas/pixel<%= getpixel("B38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A38')"><img src="./disenno/mapas/pixel<%= getpixel("A38" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">38</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">16</td>
    <td bordercolor="#000000"><a href="javascript:pick('A16')"><img src="./disenno/mapas/pixel<%= getpixel("A16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B16')"><img src="./disenno/mapas/pixel<%= getpixel("B16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C16')"><img src="./disenno/mapas/pixel<%= getpixel("C16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D16')"><img src="./disenno/mapas/pixel<%= getpixel("D16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E16')"><img src="./disenno/mapas/pixel<%= getpixel("E16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F16')"><img src="./disenno/mapas/pixel<%= getpixel("F16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G16')"><img src="./disenno/mapas/pixel<%= getpixel("G16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H16')"><img src="./disenno/mapas/pixel<%= getpixel("H16" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">125</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">103</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">81</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">59</td>
    <td bordercolor="#000000"><a href="javascript:pick('A59')"><img src="./disenno/mapas/pixel<%= getpixel("A59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B59')"><img src="./disenno/mapas/pixel<%= getpixel("B59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C59')"><img src="./disenno/mapas/pixel<%= getpixel("C59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D59')"><img src="./disenno/mapas/pixel<%= getpixel("D59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E59')"><img src="./disenno/mapas/pixel<%= getpixel("E59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F59')"><img src="./disenno/mapas/pixel<%= getpixel("F59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G59')"><img src="./disenno/mapas/pixel<%= getpixel("G59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H59')"><img src="./disenno/mapas/pixel<%= getpixel("H59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I59')"><img src="./disenno/mapas/pixel<%= getpixel("I59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J59')"><img src="./disenno/mapas/pixel<%= getpixel("J59" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J37')"><img src="./disenno/mapas/pixel<%= getpixel("J37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I37')"><img src="./disenno/mapas/pixel<%= getpixel("I37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H37')"><img src="./disenno/mapas/pixel<%= getpixel("H37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G37')"><img src="./disenno/mapas/pixel<%= getpixel("G37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F37')"><img src="./disenno/mapas/pixel<%= getpixel("F37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E37')"><img src="./disenno/mapas/pixel<%= getpixel("E37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D37')"><img src="./disenno/mapas/pixel<%= getpixel("D37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C37')"><img src="./disenno/mapas/pixel<%= getpixel("C37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B37')"><img src="./disenno/mapas/pixel<%= getpixel("B37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A37')"><img src="./disenno/mapas/pixel<%= getpixel("A37" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">37</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">15</td>
    <td bordercolor="#000000"><a href="javascript:pick('A15')"><img src="./disenno/mapas/pixel<%= getpixel("A15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B15')"><img src="./disenno/mapas/pixel<%= getpixel("B15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C15')"><img src="./disenno/mapas/pixel<%= getpixel("C15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D15')"><img src="./disenno/mapas/pixel<%= getpixel("D15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E15')"><img src="./disenno/mapas/pixel<%= getpixel("E15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F15')"><img src="./disenno/mapas/pixel<%= getpixel("F15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G15')"><img src="./disenno/mapas/pixel<%= getpixel("G15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H15')"><img src="./disenno/mapas/pixel<%= getpixel("H15" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">124</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">102</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">80</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">58</td>
    <td bordercolor="#000000"><a href="javascript:pick('A58')"><img src="./disenno/mapas/pixel<%= getpixel("A58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B58')"><img src="./disenno/mapas/pixel<%= getpixel("B58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C58')"><img src="./disenno/mapas/pixel<%= getpixel("C58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D58')"><img src="./disenno/mapas/pixel<%= getpixel("D58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E58')"><img src="./disenno/mapas/pixel<%= getpixel("E58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F58')"><img src="./disenno/mapas/pixel<%= getpixel("F58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G58')"><img src="./disenno/mapas/pixel<%= getpixel("G58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H58')"><img src="./disenno/mapas/pixel<%= getpixel("H58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I58')"><img src="./disenno/mapas/pixel<%= getpixel("I58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J58')"><img src="./disenno/mapas/pixel<%= getpixel("J58" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J36')"><img src="./disenno/mapas/pixel<%= getpixel("J36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I36')"><img src="./disenno/mapas/pixel<%= getpixel("I36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H36')"><img src="./disenno/mapas/pixel<%= getpixel("H36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G36')"><img src="./disenno/mapas/pixel<%= getpixel("G36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F36')"><img src="./disenno/mapas/pixel<%= getpixel("F36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E36')"><img src="./disenno/mapas/pixel<%= getpixel("E36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D36')"><img src="./disenno/mapas/pixel<%= getpixel("D36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C36')"><img src="./disenno/mapas/pixel<%= getpixel("C36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B36')"><img src="./disenno/mapas/pixel<%= getpixel("B36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A36')"><img src="./disenno/mapas/pixel<%= getpixel("A36" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">36</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">14</td>
    <td bordercolor="#000000"><a href="javascript:pick('A14')"><img src="./disenno/mapas/pixel<%= getpixel("A14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B14')"><img src="./disenno/mapas/pixel<%= getpixel("B14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C14')"><img src="./disenno/mapas/pixel<%= getpixel("C14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D14')"><img src="./disenno/mapas/pixel<%= getpixel("D14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E14')"><img src="./disenno/mapas/pixel<%= getpixel("E14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F14')"><img src="./disenno/mapas/pixel<%= getpixel("F14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G14')"><img src="./disenno/mapas/pixel<%= getpixel("G14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H14')"><img src="./disenno/mapas/pixel<%= getpixel("H14" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">123</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">101</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">79</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">57</td>
    <td bordercolor="#000000"><a href="javascript:pick('A57')"><img src="./disenno/mapas/pixel<%= getpixel("A57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B57')"><img src="./disenno/mapas/pixel<%= getpixel("B57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C57')"><img src="./disenno/mapas/pixel<%= getpixel("C57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D57')"><img src="./disenno/mapas/pixel<%= getpixel("D57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E57')"><img src="./disenno/mapas/pixel<%= getpixel("E57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F57')"><img src="./disenno/mapas/pixel<%= getpixel("F57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G57')"><img src="./disenno/mapas/pixel<%= getpixel("G57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H57')"><img src="./disenno/mapas/pixel<%= getpixel("H57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I57')"><img src="./disenno/mapas/pixel<%= getpixel("I57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J57')"><img src="./disenno/mapas/pixel<%= getpixel("J57" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J35')"><img src="./disenno/mapas/pixel<%= getpixel("J35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I35')"><img src="./disenno/mapas/pixel<%= getpixel("I35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H35')"><img src="./disenno/mapas/pixel<%= getpixel("H35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G35')"><img src="./disenno/mapas/pixel<%= getpixel("G35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F35')"><img src="./disenno/mapas/pixel<%= getpixel("F35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E35')"><img src="./disenno/mapas/pixel<%= getpixel("E35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D35')"><img src="./disenno/mapas/pixel<%= getpixel("D35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C35')"><img src="./disenno/mapas/pixel<%= getpixel("C35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B35')"><img src="./disenno/mapas/pixel<%= getpixel("B35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A35')"><img src="./disenno/mapas/pixel<%= getpixel("A35" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">35</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">13</td>
    <td bordercolor="#000000"><a href="javascript:pick('A13')"><img src="./disenno/mapas/pixel<%= getpixel("A13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B13')"><img src="./disenno/mapas/pixel<%= getpixel("B13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C13')"><img src="./disenno/mapas/pixel<%= getpixel("C13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D13')"><img src="./disenno/mapas/pixel<%= getpixel("D13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E13')"><img src="./disenno/mapas/pixel<%= getpixel("E13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F13')"><img src="./disenno/mapas/pixel<%= getpixel("F13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G13')"><img src="./disenno/mapas/pixel<%= getpixel("G13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H13')"><img src="./disenno/mapas/pixel<%= getpixel("H13" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">122</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">100</td>
    <td colspan="4" rowspan="2" bordercolor="#000000" bgcolor="#FFFFFF"><div align="center">PUENTE</div></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center">PUENTE</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">78</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">56</td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center">PUENTE</div></td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('E56')"></a></td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('F56')"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G56')"><img src="./disenno/mapas/pixel<%= getpixel("G56" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H56')"><img src="./disenno/mapas/pixel<%= getpixel("H56" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I56')"><img src="./disenno/mapas/pixel<%= getpixel("I56" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J56')"><img src="./disenno/mapas/pixel<%= getpixel("J56" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J34')"><img src="./disenno/mapas/pixel<%= getpixel("J34" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I34')"><img src="./disenno/mapas/pixel<%= getpixel("I34" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H34')"><img src="./disenno/mapas/pixel<%= getpixel("H34" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G34')"><img src="./disenno/mapas/pixel<%= getpixel("G34" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('F34')"></a></td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('E34')"></a></td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center">PUENTE</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">34</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">12</td>
    <td bordercolor="#000000"><a href="javascript:pick('A12')"><img src="./disenno/mapas/pixel<%= getpixel("A12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B12')"><img src="./disenno/mapas/pixel<%= getpixel("B12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C12')"><img src="./disenno/mapas/pixel<%= getpixel("C12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D12')"><img src="./disenno/mapas/pixel<%= getpixel("D12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E12')"><img src="./disenno/mapas/pixel<%= getpixel("E12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F12')"><img src="./disenno/mapas/pixel<%= getpixel("F12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G12')"><img src="./disenno/mapas/pixel<%= getpixel("G12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H12')"><img src="./disenno/mapas/pixel<%= getpixel("H12" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">121</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">99</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">77</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">55</td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('E55')"></a></td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('F55')"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G55')"><img src="./disenno/mapas/pixel<%= getpixel("G55" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H55')"><img src="./disenno/mapas/pixel<%= getpixel("H55" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I55')"><img src="./disenno/mapas/pixel<%= getpixel("I55" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J55')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J33')"><img src="./disenno/mapas/pixel<%= getpixel("J33" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I33')"><img src="./disenno/mapas/pixel<%= getpixel("I33" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H33')"><img src="./disenno/mapas/pixel<%= getpixel("H33" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G33')"><img src="./disenno/mapas/pixel<%= getpixel("G33" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('F33')"></a></td>
    <td bordercolor="#FFFFFF"><a href="javascript:pick('E33')"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">33</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">11</td>
    <td bordercolor="#000000"><a href="javascript:pick('A11')"><img src="./disenno/mapas/pixel<%= getpixel("A11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B11')"><img src="./disenno/mapas/pixel<%= getpixel("B11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C11')"><img src="./disenno/mapas/pixel<%= getpixel("C11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D11')"><img src="./disenno/mapas/pixel<%= getpixel("D11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E11')"><img src="./disenno/mapas/pixel<%= getpixel("E11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F11')"><img src="./disenno/mapas/pixel<%= getpixel("F11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G11')"><img src="./disenno/mapas/pixel<%= getpixel("G11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H11')"><img src="./disenno/mapas/pixel<%= getpixel("H11" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">120</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">98</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">76</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">54</td>
    <td bordercolor="#000000"><a href="javascript:pick('A54')"><img src="./disenno/mapas/pixel<%= getpixel("A54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B54')"><img src="./disenno/mapas/pixel<%= getpixel("B54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C54')"><img src="./disenno/mapas/pixel<%= getpixel("C54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D54')"><img src="./disenno/mapas/pixel<%= getpixel("D54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E54')"><img src="./disenno/mapas/pixel<%= getpixel("E54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F54')"><img src="./disenno/mapas/pixel<%= getpixel("F54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G54')"><img src="./disenno/mapas/pixel<%= getpixel("G54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H54')"><img src="./disenno/mapas/pixel<%= getpixel("H54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I54')"><img src="./disenno/mapas/pixel<%= getpixel("I54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J54')"><img src="./disenno/mapas/pixel<%= getpixel("J54" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J32')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I32')"><img src="./disenno/mapas/pixel<%= getpixel("I32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H32')"><img src="./disenno/mapas/pixel<%= getpixel("H32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G32')"><img src="./disenno/mapas/pixel<%= getpixel("G32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F32')"><img src="./disenno/mapas/pixel<%= getpixel("F32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E32')"><img src="./disenno/mapas/pixel<%= getpixel("E32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D32')"><img src="./disenno/mapas/pixel<%= getpixel("D32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C32')"><img src="./disenno/mapas/pixel<%= getpixel("C32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B32')"><img src="./disenno/mapas/pixel<%= getpixel("B32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A32')"><img src="./disenno/mapas/pixel<%= getpixel("A32" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">32</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">10</td>
    <td bordercolor="#000000"><a href="javascript:pick('A10')"><img src="./disenno/mapas/pixel<%= getpixel("A10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B10')"><img src="./disenno/mapas/pixel<%= getpixel("B10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C10')"><img src="./disenno/mapas/pixel<%= getpixel("C10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D10')"><img src="./disenno/mapas/pixel<%= getpixel("D10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E10')"><img src="./disenno/mapas/pixel<%= getpixel("E10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F10')"><img src="./disenno/mapas/pixel<%= getpixel("F10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G10')"><img src="./disenno/mapas/pixel<%= getpixel("G10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H10')"><img src="./disenno/mapas/pixel<%= getpixel("H10" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">119</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">97</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">75</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">53</td>
    <td bordercolor="#000000"><a href="javascript:pick('A53')"><img src="./disenno/mapas/pixel<%= getpixel("A53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B53')"><img src="./disenno/mapas/pixel<%= getpixel("B53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C53')"><img src="./disenno/mapas/pixel<%= getpixel("C53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D53')"><img src="./disenno/mapas/pixel<%= getpixel("D53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E53')"><img src="./disenno/mapas/pixel<%= getpixel("E53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F53')"><img src="./disenno/mapas/pixel<%= getpixel("F53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G53')"><img src="./disenno/mapas/pixel<%= getpixel("G53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H53')"><img src="./disenno/mapas/pixel<%= getpixel("H53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I53')"><img src="./disenno/mapas/pixel<%= getpixel("I53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J53')"><img src="./disenno/mapas/pixel<%= getpixel("J53" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J31')"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I31')"><img src="./disenno/mapas/pixel<%= getpixel("I31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H31')"><img src="./disenno/mapas/pixel<%= getpixel("H31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G31')"><img src="./disenno/mapas/pixel<%= getpixel("G31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F31')"><img src="./disenno/mapas/pixel<%= getpixel("F31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E31')"><img src="./disenno/mapas/pixel<%= getpixel("E31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D31')"><img src="./disenno/mapas/pixel<%= getpixel("D31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C31')"><img src="./disenno/mapas/pixel<%= getpixel("C31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B31')"><img src="./disenno/mapas/pixel<%= getpixel("B31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A31')"><img src="./disenno/mapas/pixel<%= getpixel("A31" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">31</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">09</td>
    <td bordercolor="#000000"><a href="javascript:pick('A09')"><img src="./disenno/mapas/pixel<%= getpixel("A09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B09')"><img src="./disenno/mapas/pixel<%= getpixel("B09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C09')"><img src="./disenno/mapas/pixel<%= getpixel("C09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D09')"><img src="./disenno/mapas/pixel<%= getpixel("D09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E09')"><img src="./disenno/mapas/pixel<%= getpixel("E09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F09')"><img src="./disenno/mapas/pixel<%= getpixel("F09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G09')"><img src="./disenno/mapas/pixel<%= getpixel("G09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H09')"><img src="./disenno/mapas/pixel<%= getpixel("H09" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">118</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">96</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">74</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">52</td>
    <td bordercolor="#000000"><a href="javascript:pick('A52')"><img src="./disenno/mapas/pixel<%= getpixel("A52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B52')"><img src="./disenno/mapas/pixel<%= getpixel("B52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C52')"><img src="./disenno/mapas/pixel<%= getpixel("C52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D52')"><img src="./disenno/mapas/pixel<%= getpixel("D52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E52')"><img src="./disenno/mapas/pixel<%= getpixel("E52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F52')"><img src="./disenno/mapas/pixel<%= getpixel("F52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G52')"><img src="./disenno/mapas/pixel<%= getpixel("G52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H52')"><img src="./disenno/mapas/pixel<%= getpixel("H52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I52')"><img src="./disenno/mapas/pixel<%= getpixel("I52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J52')"><img src="./disenno/mapas/pixel<%= getpixel("J52" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J30')"><img src="./disenno/mapas/pixel<%= getpixel("J30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I30')"><img src="./disenno/mapas/pixel<%= getpixel("I30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H30')"><img src="./disenno/mapas/pixel<%= getpixel("H30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G30')"><img src="./disenno/mapas/pixel<%= getpixel("G30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F30')"><img src="./disenno/mapas/pixel<%= getpixel("F30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E30')"><img src="./disenno/mapas/pixel<%= getpixel("E30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D30')"><img src="./disenno/mapas/pixel<%= getpixel("D30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C30')"><img src="./disenno/mapas/pixel<%= getpixel("C30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B30')"><img src="./disenno/mapas/pixel<%= getpixel("B30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A30')"><img src="./disenno/mapas/pixel<%= getpixel("A30" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">30</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">08</td>
    <td bordercolor="#000000"><a href="javascript:pick('A08')"><img src="./disenno/mapas/pixel<%= getpixel("A08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B08')"><img src="./disenno/mapas/pixel<%= getpixel("B08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C08')"><img src="./disenno/mapas/pixel<%= getpixel("C08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D08')"><img src="./disenno/mapas/pixel<%= getpixel("D08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E08')"><img src="./disenno/mapas/pixel<%= getpixel("E08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F08')"><img src="./disenno/mapas/pixel<%= getpixel("F08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G08')"><img src="./disenno/mapas/pixel<%= getpixel("G08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H08')"><img src="./disenno/mapas/pixel<%= getpixel("H08" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">117</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">95</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">73</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">51</td>
    <td bordercolor="#000000"><a href="javascript:pick('A51')"><img src="./disenno/mapas/pixel<%= getpixel("A51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B51')"><img src="./disenno/mapas/pixel<%= getpixel("B51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C51')"><img src="./disenno/mapas/pixel<%= getpixel("C51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D51')"><img src="./disenno/mapas/pixel<%= getpixel("D51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E51')"><img src="./disenno/mapas/pixel<%= getpixel("E51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F51')"><img src="./disenno/mapas/pixel<%= getpixel("F51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G51')"><img src="./disenno/mapas/pixel<%= getpixel("G51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H51')"><img src="./disenno/mapas/pixel<%= getpixel("H51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I51')"><img src="./disenno/mapas/pixel<%= getpixel("I51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J51')"><img src="./disenno/mapas/pixel<%= getpixel("J51" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J29')"><img src="./disenno/mapas/pixel<%= getpixel("J29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I29')"><img src="./disenno/mapas/pixel<%= getpixel("I29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H29')"><img src="./disenno/mapas/pixel<%= getpixel("H29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G29')"><img src="./disenno/mapas/pixel<%= getpixel("G29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F29')"><img src="./disenno/mapas/pixel<%= getpixel("F29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E29')"><img src="./disenno/mapas/pixel<%= getpixel("E29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D29')"><img src="./disenno/mapas/pixel<%= getpixel("D29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C29')"><img src="./disenno/mapas/pixel<%= getpixel("C29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B29')"><img src="./disenno/mapas/pixel<%= getpixel("B29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A29')"><img src="./disenno/mapas/pixel<%= getpixel("A29" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">29</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">07</td>
    <td bordercolor="#000000"><a href="javascript:pick('A07')"><img src="./disenno/mapas/pixel<%= getpixel("A07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B07')"><img src="./disenno/mapas/pixel<%= getpixel("B07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C07')"><img src="./disenno/mapas/pixel<%= getpixel("C07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D07')"><img src="./disenno/mapas/pixel<%= getpixel("D07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E07')"><img src="./disenno/mapas/pixel<%= getpixel("E07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F07')"><img src="./disenno/mapas/pixel<%= getpixel("F07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G07')"><img src="./disenno/mapas/pixel<%= getpixel("G07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H07')"><img src="./disenno/mapas/pixel<%= getpixel("H07" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">116</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">94</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">72</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">50</td>
    <td bordercolor="#000000"><a href="javascript:pick('A50')"><img src="./disenno/mapas/pixel<%= getpixel("A50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B50')"><img src="./disenno/mapas/pixel<%= getpixel("B50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C50')"><img src="./disenno/mapas/pixel<%= getpixel("C50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D50')"><img src="./disenno/mapas/pixel<%= getpixel("D50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E50')"><img src="./disenno/mapas/pixel<%= getpixel("E50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F50')"><img src="./disenno/mapas/pixel<%= getpixel("F50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G50')"><img src="./disenno/mapas/pixel<%= getpixel("G50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H50')"><img src="./disenno/mapas/pixel<%= getpixel("H50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I50')"><img src="./disenno/mapas/pixel<%= getpixel("I50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J50')"><img src="./disenno/mapas/pixel<%= getpixel("J50" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J28')"><img src="./disenno/mapas/pixel<%= getpixel("J28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I28')"><img src="./disenno/mapas/pixel<%= getpixel("I28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H28')"><img src="./disenno/mapas/pixel<%= getpixel("H28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G28')"><img src="./disenno/mapas/pixel<%= getpixel("G28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F28')"><img src="./disenno/mapas/pixel<%= getpixel("F28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E28')"><img src="./disenno/mapas/pixel<%= getpixel("E28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D28')"><img src="./disenno/mapas/pixel<%= getpixel("D28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C28')"><img src="./disenno/mapas/pixel<%= getpixel("C28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B28')"><img src="./disenno/mapas/pixel<%= getpixel("B28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A28')"><img src="./disenno/mapas/pixel<%= getpixel("A28" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">28</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">06</td>
    <td bordercolor="#000000"><a href="javascript:pick('A06')"><img src="./disenno/mapas/pixel<%= getpixel("A06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B06')"><img src="./disenno/mapas/pixel<%= getpixel("B06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C06')"><img src="./disenno/mapas/pixel<%= getpixel("C06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D06')"><img src="./disenno/mapas/pixel<%= getpixel("D06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E06')"><img src="./disenno/mapas/pixel<%= getpixel("E06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F06')"><img src="./disenno/mapas/pixel<%= getpixel("F06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G06')"><img src="./disenno/mapas/pixel<%= getpixel("G06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H06')"><img src="./disenno/mapas/pixel<%= getpixel("H06" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">115</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">93</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">71</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">49</td>
    <td bordercolor="#000000"><a href="javascript:pick('A49')"><img src="./disenno/mapas/pixel<%= getpixel("A49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B49')"><img src="./disenno/mapas/pixel<%= getpixel("B49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C49')"><img src="./disenno/mapas/pixel<%= getpixel("C49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D49')"><img src="./disenno/mapas/pixel<%= getpixel("D49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E49')"><img src="./disenno/mapas/pixel<%= getpixel("E49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F49')"><img src="./disenno/mapas/pixel<%= getpixel("F49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G49')"><img src="./disenno/mapas/pixel<%= getpixel("G49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H49')"><img src="./disenno/mapas/pixel<%= getpixel("H49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I49')"><img src="./disenno/mapas/pixel<%= getpixel("I49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J49')"><img src="./disenno/mapas/pixel<%= getpixel("J49" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J27')"><img src="./disenno/mapas/pixel<%= getpixel("J27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I27')"><img src="./disenno/mapas/pixel<%= getpixel("I27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H27')"><img src="./disenno/mapas/pixel<%= getpixel("H27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G27')"><img src="./disenno/mapas/pixel<%= getpixel("G27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F27')"><img src="./disenno/mapas/pixel<%= getpixel("F27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E27')"><img src="./disenno/mapas/pixel<%= getpixel("E27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D27')"><img src="./disenno/mapas/pixel<%= getpixel("D27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C27')"><img src="./disenno/mapas/pixel<%= getpixel("C27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B27')"><img src="./disenno/mapas/pixel<%= getpixel("B27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A27')"><img src="./disenno/mapas/pixel<%= getpixel("A27" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">27</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">05</td>
    <td bordercolor="#000000"><a href="javascript:pick('A05')"><img src="./disenno/mapas/pixel<%= getpixel("A05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B05')"><img src="./disenno/mapas/pixel<%= getpixel("B05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C05')"><img src="./disenno/mapas/pixel<%= getpixel("C05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D05')"><img src="./disenno/mapas/pixel<%= getpixel("D05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E05')"><img src="./disenno/mapas/pixel<%= getpixel("E05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F05')"><img src="./disenno/mapas/pixel<%= getpixel("F05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G05')"><img src="./disenno/mapas/pixel<%= getpixel("G05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H05')"><img src="./disenno/mapas/pixel<%= getpixel("H05" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">114</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">92</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">70</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">48</td>
    <td bordercolor="#000000"><a href="javascript:pick('A48')"><img src="./disenno/mapas/pixel<%= getpixel("A48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B48')"><img src="./disenno/mapas/pixel<%= getpixel("B48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C48')"><img src="./disenno/mapas/pixel<%= getpixel("C48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D48')"><img src="./disenno/mapas/pixel<%= getpixel("D48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E48')"><img src="./disenno/mapas/pixel<%= getpixel("E48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F48')"><img src="./disenno/mapas/pixel<%= getpixel("F48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G48')"><img src="./disenno/mapas/pixel<%= getpixel("G48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H48')"><img src="./disenno/mapas/pixel<%= getpixel("H48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I48')"><img src="./disenno/mapas/pixel<%= getpixel("I48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J48')"><img src="./disenno/mapas/pixel<%= getpixel("J48" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J26')"><img src="./disenno/mapas/pixel<%= getpixel("J26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I26')"><img src="./disenno/mapas/pixel<%= getpixel("I26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H26')"><img src="./disenno/mapas/pixel<%= getpixel("H26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G26')"><img src="./disenno/mapas/pixel<%= getpixel("G26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F26')"><img src="./disenno/mapas/pixel<%= getpixel("F26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E26')"><img src="./disenno/mapas/pixel<%= getpixel("E26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D26')"><img src="./disenno/mapas/pixel<%= getpixel("D26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C26')"><img src="./disenno/mapas/pixel<%= getpixel("C26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B26')"><img src="./disenno/mapas/pixel<%= getpixel("B26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A26')"><img src="./disenno/mapas/pixel<%= getpixel("A26" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">26</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF">04</td>
    <td bordercolor="#000000"><a href="javascript:pick('A04')"><img src="./disenno/mapas/pixel<%= getpixel("A04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B04')"><img src="./disenno/mapas/pixel<%= getpixel("B04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C04')"><img src="./disenno/mapas/pixel<%= getpixel("C04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D04')"><img src="./disenno/mapas/pixel<%= getpixel("D04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E04')"><img src="./disenno/mapas/pixel<%= getpixel("E04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F04')"><img src="./disenno/mapas/pixel<%= getpixel("F04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G04')"><img src="./disenno/mapas/pixel<%= getpixel("G04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td> 
    <td bordercolor="#000000"><a href="javascript:pick('H04')"><img src="./disenno/mapas/pixel<%= getpixel("H04" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">113</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">91</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">69</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">47</td>
    <td bordercolor="#000000"><a href="javascript:pick('A47')"><img src="./disenno/mapas/pixel<%= getpixel("A47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B47')"><img src="./disenno/mapas/pixel<%= getpixel("B47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C47')"><img src="./disenno/mapas/pixel<%= getpixel("C47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D47')"><img src="./disenno/mapas/pixel<%= getpixel("D47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E47')"><img src="./disenno/mapas/pixel<%= getpixel("E47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F47')"><img src="./disenno/mapas/pixel<%= getpixel("F47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G47')"><img src="./disenno/mapas/pixel<%= getpixel("G47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H47')"><img src="./disenno/mapas/pixel<%= getpixel("H47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I47')"><img src="./disenno/mapas/pixel<%= getpixel("I47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J47')"><img src="./disenno/mapas/pixel<%= getpixel("J47" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J25')"><img src="./disenno/mapas/pixel<%= getpixel("J25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I25')"><img src="./disenno/mapas/pixel<%= getpixel("I25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H25')"><img src="./disenno/mapas/pixel<%= getpixel("H25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G25')"><img src="./disenno/mapas/pixel<%= getpixel("G25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F25')"><img src="./disenno/mapas/pixel<%= getpixel("F25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E25')"><img src="./disenno/mapas/pixel<%= getpixel("E25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D25')"><img src="./disenno/mapas/pixel<%= getpixel("D25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C25')"><img src="./disenno/mapas/pixel<%= getpixel("C25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B25')"><img src="./disenno/mapas/pixel<%= getpixel("B25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A25')"><img src="./disenno/mapas/pixel<%= getpixel("A25" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">25</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">03</td>
    <td bordercolor="#000000"><a href="javascript:pick('A03')"><img src="./disenno/mapas/pixel<%= getpixel("A03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B03')"><img src="./disenno/mapas/pixel<%= getpixel("B03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C03')"><img src="./disenno/mapas/pixel<%= getpixel("C03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D03')"><img src="./disenno/mapas/pixel<%= getpixel("D03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E03')"><img src="./disenno/mapas/pixel<%= getpixel("E03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F03')"><img src="./disenno/mapas/pixel<%= getpixel("F03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G03')"><img src="./disenno/mapas/pixel<%= getpixel("G03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H03')"><img src="./disenno/mapas/pixel<%= getpixel("H03" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
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
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">112</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">90</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">68</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">46</td>
    <td bordercolor="#000000"><a href="javascript:pick('A46')"><img src="./disenno/mapas/pixel<%= getpixel("A46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B46')"><img src="./disenno/mapas/pixel<%= getpixel("B46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C46')"><img src="./disenno/mapas/pixel<%= getpixel("C46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D46')"><img src="./disenno/mapas/pixel<%= getpixel("D46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E46')"><img src="./disenno/mapas/pixel<%= getpixel("E46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F46')"><img src="./disenno/mapas/pixel<%= getpixel("F46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G46')"><img src="./disenno/mapas/pixel<%= getpixel("G46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H46')"><img src="./disenno/mapas/pixel<%= getpixel("H46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I46')"><img src="./disenno/mapas/pixel<%= getpixel("I46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J46')"><img src="./disenno/mapas/pixel<%= getpixel("J46" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J24')"><img src="./disenno/mapas/pixel<%= getpixel("J24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I24')"><img src="./disenno/mapas/pixel<%= getpixel("I24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H24')"><img src="./disenno/mapas/pixel<%= getpixel("H24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G24')"><img src="./disenno/mapas/pixel<%= getpixel("G24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F24')"><img src="./disenno/mapas/pixel<%= getpixel("F24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E24')"><img src="./disenno/mapas/pixel<%= getpixel("E24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D24')"><img src="./disenno/mapas/pixel<%= getpixel("D24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C24')"><img src="./disenno/mapas/pixel<%= getpixel("C24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B24')"><img src="./disenno/mapas/pixel<%= getpixel("B24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A24')"><img src="./disenno/mapas/pixel<%= getpixel("A24" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">24</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">02</td>
    <td bordercolor="#000000"><a href="javascript:pick('A02')"><img src="./disenno/mapas/pixel<%= getpixel("A02" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B02')"><img src="./disenno/mapas/pixel<%= getpixel("B02" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C02')"><img src="./disenno/mapas/pixel<%= getpixel("C02" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D02')"><img src="./disenno/mapas/pixel<%= getpixel("D02" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E02')"><img src="./disenno/mapas/pixel<%= getpixel("E2" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F02')"><img src="./disenno/mapas/pixel<%= getpixel("F02" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G02')"><img src="./disenno/mapas/pixel<%= getpixel("G02" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H02')"><img src="./disenno/mapas/pixel<%= getpixel("H02" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">111</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">89</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">67</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">45</td>
    <td bordercolor="#000000"><a href="javascript:pick('A45')"><img src="./disenno/mapas/pixel<%= getpixel("A45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A45')"><img src="./disenno/mapas/pixel<%= getpixel("A45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B45')"><img src="./disenno/mapas/pixel<%= getpixel("B45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D45')"><img src="./disenno/mapas/pixel<%= getpixel("D45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E45')"><img src="./disenno/mapas/pixel<%= getpixel("E45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F45')"><img src="./disenno/mapas/pixel<%= getpixel("F45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G45')"><img src="./disenno/mapas/pixel<%= getpixel("G45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H45')"><img src="./disenno/mapas/pixel<%= getpixel("H45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I45')"><img src="./disenno/mapas/pixel<%= getpixel("I45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J45')"><img src="./disenno/mapas/pixel<%= getpixel("J45" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#000000"><a href="javascript:pick('J23')"><img src="./disenno/mapas/pixel<%= getpixel("J23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I23')"><img src="./disenno/mapas/pixel<%= getpixel("I23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H23')"><img src="./disenno/mapas/pixel<%= getpixel("H23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G23')"><img src="./disenno/mapas/pixel<%= getpixel("G23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F23')"><img src="./disenno/mapas/pixel<%= getpixel("F23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E23')"><img src="./disenno/mapas/pixel<%= getpixel("E23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D23')"><img src="./disenno/mapas/pixel<%= getpixel("D23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C23')"><img src="./disenno/mapas/pixel<%= getpixel("C23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B23')"><img src="./disenno/mapas/pixel<%= getpixel("B23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A23')"><img src="./disenno/mapas/pixel<%= getpixel("A23" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">23</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">01</td>
    <td bordercolor="#000000"><a href="javascript:pick('A01')"><img src="./disenno/mapas/pixel<%= getpixel("A01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B01')"><img src="./disenno/mapas/pixel<%= getpixel("B01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C01')"><img src="./disenno/mapas/pixel<%= getpixel("C01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D01')"><img src="./disenno/mapas/pixel<%= getpixel("D01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E01')"><img src="./disenno/mapas/pixel<%= getpixel("E01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F01')"><img src="./disenno/mapas/pixel<%= getpixel("F01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G01')"><img src="./disenno/mapas/pixel<%= getpixel("G01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H01')"><img src="./disenno/mapas/pixel<%= getpixel("H01" , posiciones, tipo)  %>.gif" width="23" height="15" border="0" /></a></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF"><div align="center">D</div></td>
    <td bordercolor="#FFFFFF"><div align="center">C</div></td>
    <td bordercolor="#FFFFFF"><div align="center">B</div></td>
    <td bordercolor="#FFFFFF"><div align="center">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center">H</div></td>
  </tr>
  <tr>
    <td colspan="28">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="35">&nbsp;</td>
  </tr>
</table>
</body>
</html>
