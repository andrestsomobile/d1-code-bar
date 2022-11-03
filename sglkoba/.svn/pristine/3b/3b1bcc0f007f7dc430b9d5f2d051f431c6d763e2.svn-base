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
	font-size: 12;
}
.Estilo2 {font-size: 12px}
.Estilo6 {color: #000000; font-size: 12; }
-->
</style>


<table width="830" border="1" bordercolor="#000000" class="tabla_mapa">
  
  <tr bordercolor="#000000">
    <td colspan="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center"><form name='saldo' action="mapa.jsp?bodega=<%= bodcodsx %>&campo=<%= campo %>&formulario=<%= formulario %>&procodsx=<%= procodsx %>" method="post" > 
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
    <td colspan="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">ETAPA 2 </div></td>
  </tr>
  
  <tr>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">D</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">C</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">B</div></td>
    <td width="23" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="center" class="Estilo2">A</div></td>
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
  </tr>
  
  
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo6">132</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo6">110</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo1">zzz</span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">88</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">131</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">109</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">87</span></td>
  </tr>
  <tr>
    <td colspan="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF" height="5"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">130</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">108</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">86</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">129</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">107</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">85</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">128</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">106</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">84</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">127</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">105</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">83</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF" >&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">126</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">104</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">82</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">125</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">103</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">81</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">124</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">102</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">80</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">123</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">101</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">79</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">122</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">100</span></td>
    <td colspan="4" rowspan="2" bordercolor="#000000" bgcolor="#FFFFFF"><div align="center"><span class="Estilo2">PUENTE</span></div></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td colspan="4" rowspan="2" bordercolor="#000000"><div align="center" class="Estilo2">PUENTE</div></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">78</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">121</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">99</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">77</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">120</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">98</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">76</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">119</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">97</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">75</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">118</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">96</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">74</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">117</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">95</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">73</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">116</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">94</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">72</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">115</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">93</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">71</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">114</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">92</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">70</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">113</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">91</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">69</span></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">112</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">90</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">68</span></td>
  </tr>
  <tr>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">111</span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">89</span></td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#000000">&nbsp;</td>
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2"></span></td>
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
    <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="Estilo2">67</span></td>
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
  </tr>
</table>
</body>
</html>
