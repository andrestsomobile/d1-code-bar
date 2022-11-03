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
.Estilo2 {font-size: 9px}
.Estilo3 {font-size: 12px; }
.Estilo5 {font-size: 12}
.Estilo7 {color: #000000}
.Estilo8 {font-size: 12px; color: #000000; }
.Estilo10 {font-size: 12px; color: #FFFFFF; }
.Estilo11 {color: #FFFFFF}
-->
</style>


<table height="1030" border="1">
  
  <tr bordercolor="#000000">
    <td height="2" colspan="35" bgcolor="#FFFFFF"></td>
  </tr>
  
  <tr bordercolor="#000000">
    <td height="104" colspan="35"><div align="center"><form name='saldo' action="mapa.jsp?bodega=<%= bodcodsx %>&campo=<%= campo %>&formulario=<%= formulario %>&procodsx=<%= procodsx %>" method="post" > 
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
  <tr bordercolor="#000000">
    <td height="18" colspan="35"><div align="center" class="Estilo3">ETAPA 1 </div></td>
  </tr>
  <tr>
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo7"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><span class="Estilo2"><span class="Estilo3"><span class="Estilo7"></span></span></span></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo7"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo7"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo7"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo7"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><span class="Estilo2"><span class="Estilo3"><span class="Estilo7"></span></span></span></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo8">H</div></td>
  </tr>
  
  
  <tr>
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">66</span></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('A66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('B66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('C66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('D66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('E66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('F66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('G66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('H66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('J66')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J66" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A44')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A44" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">44</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">22</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H22')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H22" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">65</span></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('A65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('B65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('C65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('D65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('E65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('F65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('G65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('H65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('I65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('J65')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J65" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A43')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A43" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">43</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">21</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H21')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr bordercolor="#FFFFFF" height="5">
    <td height="21" colspan="35" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">64</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J64')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J64" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A42')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A42" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">42</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">20</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H20')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H20" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">63</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J63')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J63" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A41')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A41" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">41</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">19</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H19')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H19" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">62</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J62')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J62" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A40')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A40" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">40</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">18</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H18')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H18" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">61</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J61')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J61" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A39')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A39" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">39</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">17</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H17')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H17" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="21" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo3"></span></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">60</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J60')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J60" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A38')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A38" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">38</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">16</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H16')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H16" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">59</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J59')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J59" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A37')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A37" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">37</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">15</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H15')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H15" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">58</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J58')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J58" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A36')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A36" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">36</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">14</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H14')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H14" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">57</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J57')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J57" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A35')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A35" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">35</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">13</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H13')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H13" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">56</span></td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center" class="Estilo8">PUENTE</div></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('G56')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G56" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H56')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H56" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I56')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I56" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J56')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J56" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J34')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J34" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I34')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I34" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H34')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H34" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G34')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G34" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center" class="Estilo8">PUENTE</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">34</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">12</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H12')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H12" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">55</span></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('G55')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G55" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H55')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H55" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I55')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I55" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J55')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J55" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J33')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J33" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I33')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I33" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H33')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H33" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G33')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G33" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF"><span class="Estilo3"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">33</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">11</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H11')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H11" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">54</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J54')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J54" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A32')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A32" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">32</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">10</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H10')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H10" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">53</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J53')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J53" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A31')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A31" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">31</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">09</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H09')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H09" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">52</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J52')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J52" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A30')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A30" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">30</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">08</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H08')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H08" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">51</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J51')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J51" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A29')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A29" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">29</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">07</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H07')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H07" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">50</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J50')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J50" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A28')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A28" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">28</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">06</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H06')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H06" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">49</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J49')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J49" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A27')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A27" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">27</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">05</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H05')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H05" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">48</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J48')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J48" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A26')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A26" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">26</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF"><span class="Estilo8">04</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td> 
    <td bordercolor="#000000"><a href="javascript:pick('H04')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H04" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">47</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J47')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J47" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A25')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A25" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">25</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">03</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H03')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H03" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
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
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">46</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J46')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J46" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo10">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A24')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A24" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">24</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">02</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H02')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H02" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">45</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('J45')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J45" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo11"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("J23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("I23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A23')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A23" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">23</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo8">01</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("A01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("B01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("C01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("D01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("E01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("F01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("G01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H01')" class="Estilo8"><img src="./disenno/mapas/pixel<%= getpixel("H01" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
  </tr>
  <tr>
    <td height="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center"><span class="Estilo3"><span class="Estilo5"><span class="Estilo5"><span class="Estilo7"><span class="Estilo3"><span class="Estilo3"><span class="Estilo3"><span class="Estilo11"></span></span></span></span></span></span></span></span></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center"><span class="Estilo3"><span class="Estilo5"><span class="Estilo5"><span class="Estilo7"><span class="Estilo3"><span class="Estilo3"><span class="Estilo3"></span></span></span></span></span></span></span></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="Estilo8"><div align="center" class="Estilo8">H</div></td>
  </tr>
</table>
</body>
</html>
