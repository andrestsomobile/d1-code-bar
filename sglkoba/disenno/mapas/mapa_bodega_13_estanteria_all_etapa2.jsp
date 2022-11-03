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
.Estilo1 {
	color: #FFFFFF;
	font-size: 12px;
}
.Estilo2 {font-size: 12px}
-->
</style>


<table width="830" border="1" class="tabla_mapa">
  
  <tr bordercolor="#000000">
    <td colspan="29" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><form name='saldo' action="mapa.jsp?bodega=<%= bodcodsx %>&campo=<%= campo %>&formulario=<%= formulario %>&procodsx=<%= procodsx %>" method="post" > 
      <div align="center">Bodega: <%= bod.getbodnombre() %> <br />
        <%if(comp!=null) { %>
        Compania: <%= comp.getcomnombre() %><br />
  <% }%>
  <% if(prod!=null) { %>
        Producto: <%= prod.getpromodelo() + " - " + prod.getprodescripcion()%> <br />
        Saldo Total: <%= gent.getSaldo(procodsx, tipo) %> <br />
        Tipo Saldo:
  <select name="tipo" onchange="document.forms[0].submit()">
    <option value="NAC" <%= tipo.equals("NAC")? "selected" : "" %> > NACIONALIZADO</option>
    <option value="SNAC" <%= tipo.equals("SNAC")? "selected" : "" %>>SIN NACIONALIZAR</option>
    <option value="TODO" <%= tipo.equals("TODO")? "selected" : "" %>>TODO</option>
  </select>
  <% } %>
      </div>
    </form>
    </div></td>
  </tr>
  
  <tr>
    <td colspan="28" bordercolor="#000000"><div align="center">Etapa 2 </div></td>
    <td width="1" bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  
  <tr>
    <td width="23" bordercolor="#FFFFFF"><div align="center" class="Estilo2">D</div></td>
    <td width="23" bordercolor="#FFFFFF"><div align="center" class="Estilo2">C</div></td>
    <td width="23" bordercolor="#FFFFFF"><div align="center" class="Estilo2">B</div></td>
    <td width="23" bordercolor="#FFFFFF"><div align="center" class="Estilo2">A</div></td>
    <td width="18" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td width="15" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td width="16" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td width="18" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><span class="Estilo2"></span></div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">A</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">B</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">C</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">D</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">E</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">F</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">G</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">H</div></td>
    <td width="66" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><span class="Estilo2"></span></div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">J</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">I</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">H</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">G</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">F</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">E</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">D</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">C</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">B</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">A</div></td>
    <td width="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  
  
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D132')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D132" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C132')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C132" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B132')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B132" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A132')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A132" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">132</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">110</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H110')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H110" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A88')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A88" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">88</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D131')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D131" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C131')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C131" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B131')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B131" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A131')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A131" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">131</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">109</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H109')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H109" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A87')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A87" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">87</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF" height="5"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D130')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D130" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C130')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C130" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B130')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B130" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A130')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A130" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">130</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">108</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H108')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H108" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A86')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A86" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">86</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D129')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D129" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C129')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C129" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B129')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B129" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A129')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A129" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">129</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">107</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H107')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H107" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B85')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B85" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">85</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D128')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D128" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C128')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C128" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B128')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B128" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A128')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A128" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">128</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">106</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H106')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H106" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A84')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A84" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">84</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D127')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D127" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C127')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C127" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B127')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B127" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A127')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A127" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">127</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">105</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H105')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H105" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A83')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A83" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">83</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" ><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D126')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D126" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C126')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C126" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B126')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B126" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A126')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A126" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">126</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">104</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H104')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H104" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A82')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A82" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">82</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D125')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D125" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C125')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C125" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B125')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B125" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A125')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A125" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">125</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">103</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H103')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H103" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A81')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A81" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">81</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D124')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D124" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C124')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C124" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B124')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B124" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A124')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A124" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">124</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">102</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H102')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H102" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I21" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A80')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A80" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">80</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D123')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D123" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C123')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C123" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B123')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B123" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A123')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A123" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">123</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">101</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H101')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H101" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A79')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A79" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">79</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D122')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D122" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C122')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C122" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B122')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B122" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A122')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A122" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">122</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">100</span></td>
    <td colspan="4" rowspan="2" bordercolor="#000000" bgcolor="#FFFFFF"><div align="center" class="Estilo2">PUENTE</div></td>
    <td bordercolor="#000000"><a href="javascript:pick('E100')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E100" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F100')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F100" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G100')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G100" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H100')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H100" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J78')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J78" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I78')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I78" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H78')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H78" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G78')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G78" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F78')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F78" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E78')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E78" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center" class="Estilo2">PUENTE</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">78</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D121')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D121" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C121')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C121" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B121')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B121" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A121')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A121" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">121</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">99</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('E99')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E99" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F99')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F99" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G99')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G99" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H99')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H99" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J77')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J77" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I77')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I77" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H77')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H77" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G77')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G77" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F77')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F77" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E77')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E77" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">77</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D120')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D120" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C120')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C120" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B120')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B120" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A120')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A120" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">120</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">98</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H98')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H98" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A76')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A76" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">76</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D119')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D119" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C119')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C119" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B119')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B119" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A119')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A119" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">119</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">97</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H97')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H97" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A75')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A75" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">75</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D118')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D118" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C118')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C118" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B118')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B118" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A118')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A118" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">118</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">96</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H96')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H96" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A74')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A74" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">74</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D117')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D117" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C117')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C117" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B117')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B117" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A117')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A117" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">117</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">95</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H95')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H95" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A73')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A73" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">73</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D116')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D116" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C116')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C116" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B116')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B116" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A116')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A116" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">116</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">94</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H94')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H94" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A72')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A72" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">72</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D115')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D115" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C115')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C115" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B115')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B115" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A115')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A115" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">115</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">93</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H93')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H93" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A71')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A71" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">71</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D114')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D114" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C114')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C114" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B114')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B114" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A114')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A114" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">114</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">92</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000" bgcolor="#FFFFFF"><a href="javascript:pick('H92')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H92" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A70')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A70" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">70</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D113')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D113" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C113')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C113" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B113')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B113" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A113')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A113" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">113</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">91</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H91')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H91" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A69')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A69" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">69</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D112')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D112" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C112')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C112" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B112')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B112" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A112')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A112" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">112</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">90</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H90')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H90" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A68')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A68" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">68</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#000000"><a href="javascript:pick('D111')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D111" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C111')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C111" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B111')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B111" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A111')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A111" , posiciones, tipo)  %>.gif" width="23" height="7" border="0"></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">111</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">89</span></td>
    <td bordercolor="#000000"><a href="javascript:pick('A89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H89')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H89" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000"><a href="javascript:pick('J67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("J67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('I67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("I67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('H67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("H67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('G67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("G67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('F67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("F67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('E67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("E67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('D67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("D67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('C67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("C67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('B67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("B67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#000000"><a href="javascript:pick('A67')" class="Estilo2"><img src="./disenno/mapas/pixel<%= getpixel("A67" , posiciones, tipo)  %>.gif" width="23" height="7" border="0" /></a></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">67</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF"><div align="center" class="Estilo2">D</div></td>
    <td bordercolor="#FFFFFF"><div align="center" class="Estilo2">C</div></td>
    <td bordercolor="#FFFFFF"><div align="center" class="Estilo2">B</div></td>
    <td bordercolor="#FFFFFF"><div align="center" class="Estilo2">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><span class="Estilo2"></span></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><span class="Estilo2"></span></div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">J</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">I</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">H</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">G</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">F</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">E</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">D</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">C</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">B</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">A</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
</body>
</html>
