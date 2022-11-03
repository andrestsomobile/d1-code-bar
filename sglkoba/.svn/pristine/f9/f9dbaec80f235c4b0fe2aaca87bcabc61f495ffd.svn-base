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

<table width="715" cellpadding="0"  cellspacing="0"  border="1" bordercolor="#000000" >
  <tr> 
    <td align="center"> 
    <form name='saldo' action="mapa.jsp?bodega=<%= bodcodsx %>&campo=<%= campo %>&formulario=<%= formulario %>&procodsx=<%= procodsx %>" method="post" > 
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
	
  <tr> 
    <td align= "center"> 
	<table cellpadding="0"  cellspacing="0"   >
  <tr valign="bottom"> 
            <td width="170" valign="top"><table width="100%" border="0" cellspacing="6" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr align="center">
                  <td width="4%">&nbsp;</td>
                  <td width="10%">A</td>
                  <td width="10%">B</td>
                  <td width="9%">C</td>
                  <td width="10%">D</td>
                  <td width="11%">E</td>
                  <td width="9%">F</td>
                  <td width="9%">G</td>
                  <td width="9%">H</td>
                  <td width="9%">I</td>
                  <td width="10%">J</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>110</td>
                  <td><a href="javascript:pick('A110')"><img src="./disenno/mapas/pixel<%= getpixel("A110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B110')"><img src="./disenno/mapas/pixel<%= getpixel("A110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C110')"><img src="./disenno/mapas/pixel<%= getpixel("C110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D110')"><img src="./disenno/mapas/pixel<%= getpixel("D110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E110')"><img src="./disenno/mapas/pixel<%= getpixel("E110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F110')"><img src="./disenno/mapas/pixel<%= getpixel("F110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G110')"><img src="./disenno/mapas/pixel<%= getpixel("G110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H110')"><img src="./disenno/mapas/pixel<%= getpixel("H110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I110')"><img src="./disenno/mapas/pixel<%= getpixel("I110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J110')"><img src="./disenno/mapas/pixel<%= getpixel("J110" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>109</td>
                  <td><a href="javascript:pick('A109')"><img src="./disenno/mapas/pixel<%= getpixel("A109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B109')"><img src="./disenno/mapas/pixel<%= getpixel("B109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C109')"><img src="./disenno/mapas/pixel<%= getpixel("C109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D109')"><img src="./disenno/mapas/pixel<%= getpixel("D109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E109')"><img src="./disenno/mapas/pixel<%= getpixel("E109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F109')"><img src="./disenno/mapas/pixel<%= getpixel("F109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G109')"><img src="./disenno/mapas/pixel<%= getpixel("G109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H109')"><img src="./disenno/mapas/pixel<%= getpixel("H109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I109')"><img src="./disenno/mapas/pixel<%= getpixel("I109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J109')"><img src="./disenno/mapas/pixel<%= getpixel("J109" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>108</td>
                  <td><a href="javascript:pick('A108')"><img src="./disenno/mapas/pixel<%= getpixel("A108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B108')"><img src="./disenno/mapas/pixel<%= getpixel("B108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C108')"><img src="./disenno/mapas/pixel<%= getpixel("C108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D108')"><img src="./disenno/mapas/pixel<%= getpixel("D108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E108')"><img src="./disenno/mapas/pixel<%= getpixel("E108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F108')"><img src="./disenno/mapas/pixel<%= getpixel("F108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G108')"><img src="./disenno/mapas/pixel<%= getpixel("G108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H108')"><img src="./disenno/mapas/pixel<%= getpixel("H108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I108')"><img src="./disenno/mapas/pixel<%= getpixel("I108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J108')"><img src="./disenno/mapas/pixel<%= getpixel("J108" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>107</td>
                  <td><a href="javascript:pick('A107')"><img src="./disenno/mapas/pixel<%= getpixel("A107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B107')"><img src="./disenno/mapas/pixel<%= getpixel("B107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C107')"><img src="./disenno/mapas/pixel<%= getpixel("C107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D107')"><img src="./disenno/mapas/pixel<%= getpixel("D107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E107')"><img src="./disenno/mapas/pixel<%= getpixel("E107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F107')"><img src="./disenno/mapas/pixel<%= getpixel("F107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G107')"><img src="./disenno/mapas/pixel<%= getpixel("G107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H107')"><img src="./disenno/mapas/pixel<%= getpixel("H107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I107')"><img src="./disenno/mapas/pixel<%= getpixel("I107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J107')"><img src="./disenno/mapas/pixel<%= getpixel("J107" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>106</td>
                  <td><a href="javascript:pick('A106')"><img src="./disenno/mapas/pixel<%= getpixel("A106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B106')"><img src="./disenno/mapas/pixel<%= getpixel("B106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C106')"><img src="./disenno/mapas/pixel<%= getpixel("C106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D106')"><img src="./disenno/mapas/pixel<%= getpixel("D106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E106')"><img src="./disenno/mapas/pixel<%= getpixel("E106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F106')"><img src="./disenno/mapas/pixel<%= getpixel("E18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G106')"><img src="./disenno/mapas/pixel<%= getpixel("G106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H106')"><img src="./disenno/mapas/pixel<%= getpixel("C18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I106')"><img src="./disenno/mapas/pixel<%= getpixel("I106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J106')"><img src="./disenno/mapas/pixel<%= getpixel("J106" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>105</td>
                  <td><a href="javascript:pick('A105')"><img src="./disenno/mapas/pixel<%= getpixel("A105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B105')"><img src="./disenno/mapas/pixel<%= getpixel("B105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C105')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D105')"><img src="./disenno/mapas/pixel<%= getpixel("D105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E105')"><img src="./disenno/mapas/pixel<%= getpixel("E105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F105')"><img src="./disenno/mapas/pixel<%= getpixel("F105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G105')"><img src="./disenno/mapas/pixel<%= getpixel("G105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H105')"><img src="./disenno/mapas/pixel<%= getpixel("H105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I105')"><img src="./disenno/mapas/pixel<%= getpixel("I105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J105')"><img src="./disenno/mapas/pixel<%= getpixel("J105" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>104</td>
                  <td><a href="javascript:pick('A104')"><img src="./disenno/mapas/pixel<%= getpixel("A104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B104')"><img src="./disenno/mapas/pixel<%= getpixel("B104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C104')"><img src="./disenno/mapas/pixel<%= getpixel("C104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D104')"><img src="./disenno/mapas/pixel<%= getpixel("D104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E104')"><img src="./disenno/mapas/pixel<%= getpixel("E104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F104')"><img src="./disenno/mapas/pixel<%= getpixel("F104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G104')"><img src="./disenno/mapas/pixel<%= getpixel("G104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H104')"><img src="./disenno/mapas/pixel<%= getpixel("H104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I104')"><img src="./disenno/mapas/pixel<%= getpixel("I104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J104')"><img src="./disenno/mapas/pixel<%= getpixel("J104" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>103</td>
                  <td><a href="javascript:pick('A103')"><img src="./disenno/mapas/pixel<%= getpixel("A103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B103')"><img src="./disenno/mapas/pixel<%= getpixel("B103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C103')"><img src="./disenno/mapas/pixel<%= getpixel("C103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D103')"><img src="./disenno/mapas/pixel<%= getpixel("D103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E103')"><img src="./disenno/mapas/pixel<%= getpixel("E103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F103')"><img src="./disenno/mapas/pixel<%= getpixel("F103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G103')"><img src="./disenno/mapas/pixel<%= getpixel("G103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H103')"><img src="./disenno/mapas/pixel<%= getpixel("H103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I103')"><img src="./disenno/mapas/pixel<%= getpixel("I103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J103')"><img src="./disenno/mapas/pixel<%= getpixel("J103" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>102</td>
                  <td><a href="javascript:pick('A102')"><img src="./disenno/mapas/pixel<%= getpixel("A102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B102')"><img src="./disenno/mapas/pixel<%= getpixel("B102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C102')"><img src="./disenno/mapas/pixel<%= getpixel("C102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D102')"><img src="./disenno/mapas/pixel<%= getpixel("D102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E102')"><img src="./disenno/mapas/pixel<%= getpixel("E102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F102')"><img src="./disenno/mapas/pixel<%= getpixel("F102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G102')"><img src="./disenno/mapas/pixel<%= getpixel("G102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H102')"><img src="./disenno/mapas/pixel<%= getpixel("H102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I102')"><img src="./disenno/mapas/pixel<%= getpixel("I102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J102')"><img src="./disenno/mapas/pixel<%= getpixel("J102" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>101</td>
                  <td><a href="javascript:pick('A101')"><img src="./disenno/mapas/pixel<%= getpixel("A101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B101')"><img src="./disenno/mapas/pixel<%= getpixel("B101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C101')"><img src="./disenno/mapas/pixel<%= getpixel("C101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D101')"><img src="./disenno/mapas/pixel<%= getpixel("D101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E101')"><img src="./disenno/mapas/pixel<%= getpixel("E101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F101')"><img src="./disenno/mapas/pixel<%= getpixel("F101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G101')"><img src="./disenno/mapas/pixel<%= getpixel("G101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H101')"><img src="./disenno/mapas/pixel<%= getpixel("H101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I101')"><img src="./disenno/mapas/pixel<%= getpixel("I101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J101')"><img src="./disenno/mapas/pixel<%= getpixel("J101" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>100</td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><a href="javascript:pick('C100')"><img src="./disenno/mapas/pixel<%= getpixel("C100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D100')"><img src="./disenno/mapas/pixel<%= getpixel("D100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E100')"><img src="./disenno/mapas/pixel<%= getpixel("E100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F100')"><img src="./disenno/mapas/pixel<%= getpixel("F100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G100')"><img src="./disenno/mapas/pixel<%= getpixel("G100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H100')"><img src="./disenno/mapas/pixel<%= getpixel("H100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I100')"><img src="./disenno/mapas/pixel<%= getpixel("I100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J100')"><img src="./disenno/mapas/pixel<%= getpixel("J100" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>99</td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><a href="javascript:pick('C99')"><img src="./disenno/mapas/pixel<%= getpixel("C99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D99')"><img src="./disenno/mapas/pixel<%= getpixel("D99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E99')"><img src="./disenno/mapas/pixel<%= getpixel("E99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F99')"><img src="./disenno/mapas/pixel<%= getpixel("F99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G99')"><img src="./disenno/mapas/pixel<%= getpixel("G99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H99')"><img src="./disenno/mapas/pixel<%= getpixel("H99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I99')"><img src="./disenno/mapas/pixel<%= getpixel("I99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J99')"><img src="./disenno/mapas/pixel<%= getpixel("J99" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>98</td>
                  <td><a href="javascript:pick('A98')"><img src="./disenno/mapas/pixel<%= getpixel("A98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B98')"><img src="./disenno/mapas/pixel<%= getpixel("B98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C98')"><img src="./disenno/mapas/pixel<%= getpixel("C98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D98')"><img src="./disenno/mapas/pixel<%= getpixel("D98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E98')"><img src="./disenno/mapas/pixel<%= getpixel("E98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F98')"><img src="./disenno/mapas/pixel<%= getpixel("F98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G98')"><img src="./disenno/mapas/pixel<%= getpixel("G98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H98')"><img src="./disenno/mapas/pixel<%= getpixel("H98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I98')"><img src="./disenno/mapas/pixel<%= getpixel("I98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J98')"><img src="./disenno/mapas/pixel<%= getpixel("J98" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>97</td>
                  <td><a href="javascript:pick('A97')"><img src="./disenno/mapas/pixel<%= getpixel("A97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B97')"><img src="./disenno/mapas/pixel<%= getpixel("B97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C97')"><img src="./disenno/mapas/pixel<%= getpixel("C97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D97')"><img src="./disenno/mapas/pixel<%= getpixel("D97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E97')"><img src="./disenno/mapas/pixel<%= getpixel("E97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F97')"><img src="./disenno/mapas/pixel<%= getpixel("F97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G97')"><img src="./disenno/mapas/pixel<%= getpixel("G97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H97')"><img src="./disenno/mapas/pixel<%= getpixel("H97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I97')"><img src="./disenno/mapas/pixel<%= getpixel("I97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J97')"><img src="./disenno/mapas/pixel<%= getpixel("J97" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>96</td>
                  <td><a href="javascript:pick('A96')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B96')"><img src="./disenno/mapas/pixel<%= getpixel("B96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C96')"><img src="./disenno/mapas/pixel<%= getpixel("C96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D96')"><img src="./disenno/mapas/pixel<%= getpixel("D96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E96')"><img src="./disenno/mapas/pixel<%= getpixel("E96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F96')"><img src="./disenno/mapas/pixel<%= getpixel("F96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G96')"><img src="./disenno/mapas/pixel<%= getpixel("G96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H96')"><img src="./disenno/mapas/pixel<%= getpixel("H96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I96')"><img src="./disenno/mapas/pixel<%= getpixel("I96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J96')"><img src="./disenno/mapas/pixel<%= getpixel("J96" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>95</td>
                  <td><a href="javascript:pick('A95')"><img src="./disenno/mapas/pixel<%= getpixel("A95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B95')"><img src="./disenno/mapas/pixel<%= getpixel("B95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C95')"><img src="./disenno/mapas/pixel<%= getpixel("C95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D95')"><img src="./disenno/mapas/pixel<%= getpixel("D95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E95')"><img src="./disenno/mapas/pixel<%= getpixel("E95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F95')"><img src="./disenno/mapas/pixel<%= getpixel("F95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G95')"><img src="./disenno/mapas/pixel<%= getpixel("G95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H95')"><img src="./disenno/mapas/pixel<%= getpixel("H95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I95')"><img src="./disenno/mapas/pixel<%= getpixel("I95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J95')"><img src="./disenno/mapas/pixel<%= getpixel("J95" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>94</td>
                  <td><a href="javascript:pick('A94')"><img src="./disenno/mapas/pixel<%= getpixel("A94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B94')"><img src="./disenno/mapas/pixel<%= getpixel("B94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C94')"><img src="./disenno/mapas/pixel<%= getpixel("C94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D94')"><img src="./disenno/mapas/pixel<%= getpixel("D94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E94')"><img src="./disenno/mapas/pixel<%= getpixel("E94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F94')"><img src="./disenno/mapas/pixel<%= getpixel("F94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G94')"><img src="./disenno/mapas/pixel<%= getpixel("G94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H94')"><img src="./disenno/mapas/pixel<%= getpixel("H94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I94')"><img src="./disenno/mapas/pixel<%= getpixel("I94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J94')"><img src="./disenno/mapas/pixel<%= getpixel("J94" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>93</td>
                  <td><a href="javascript:pick('A93')"><img src="./disenno/mapas/pixel<%= getpixel("A93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B93')"><img src="./disenno/mapas/pixel<%= getpixel("B93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C93')"><img src="./disenno/mapas/pixel<%= getpixel("C93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D93')"><img src="./disenno/mapas/pixel<%= getpixel("D93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E93')"><img src="./disenno/mapas/pixel<%= getpixel("E93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F93')"><img src="./disenno/mapas/pixel<%= getpixel("F93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G93')"><img src="./disenno/mapas/pixel<%= getpixel("G93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H93')"><img src="./disenno/mapas/pixel<%= getpixel("H93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I93')"><img src="./disenno/mapas/pixel<%= getpixel("I93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J93')"><img src="./disenno/mapas/pixel<%= getpixel("J93" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>92</td>
                  <td><a href="javascript:pick('A92')"><img src="./disenno/mapas/pixel<%= getpixel("A92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B92')"><img src="./disenno/mapas/pixel<%= getpixel("B92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C92')"><img src="./disenno/mapas/pixel<%= getpixel("C92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D92')"><img src="./disenno/mapas/pixel<%= getpixel("D92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E92')"><img src="./disenno/mapas/pixel<%= getpixel("E92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F92')"><img src="./disenno/mapas/pixel<%= getpixel("F92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G92')"><img src="./disenno/mapas/pixel<%= getpixel("G92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H92')"><img src="./disenno/mapas/pixel<%= getpixel("H92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I92')"><img src="./disenno/mapas/pixel<%= getpixel("I92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J92')"><img src="./disenno/mapas/pixel<%= getpixel("J92" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>91</td>
                  <td><a href="javascript:pick('A91')"><img src="./disenno/mapas/pixel<%= getpixel("A91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B91')"><img src="./disenno/mapas/pixel<%= getpixel("B91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C91')"><img src="./disenno/mapas/pixel<%= getpixel("C91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D91')"><img src="./disenno/mapas/pixel<%= getpixel("D91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E91')"><img src="./disenno/mapas/pixel<%= getpixel("E91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F91')"><img src="./disenno/mapas/pixel<%= getpixel("F91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G91')"><img src="./disenno/mapas/pixel<%= getpixel("G91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H91')"><img src="./disenno/mapas/pixel<%= getpixel("H91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I91')"><img src="./disenno/mapas/pixel<%= getpixel("I91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J91')"><img src="./disenno/mapas/pixel<%= getpixel("J91" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                  <tr>
				  <td>90</td>
                    <td><a href="javascript:pick('A90')"><img src="./disenno/mapas/pixel<%= getpixel("A90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('B90')"><img src="./disenno/mapas/pixel<%= getpixel("B90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('C90')"><img src="./disenno/mapas/pixel<%= getpixel("C90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('D90')"><img src="./disenno/mapas/pixel<%= getpixel("D90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('E90')"><img src="./disenno/mapas/pixel<%= getpixel("E90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('F90')"><img src="./disenno/mapas/pixel<%= getpixel("F90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('G90')"><img src="./disenno/mapas/pixel<%= getpixel("G90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('H90')"><img src="./disenno/mapas/pixel<%= getpixel("H90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('I90')"><img src="./disenno/mapas/pixel<%= getpixel("I90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('J90')"><img src="./disenno/mapas/pixel<%= getpixel("J90" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    
                  </tr>
                  <tr>
				  <td>89</td>
                    <td><a href="javascript:pick('A89')"><img src="./disenno/mapas/pixel<%= getpixel("A89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('B89')"><img src="./disenno/mapas/pixel<%= getpixel("B89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('C89')"><img src="./disenno/mapas/pixel<%= getpixel("C89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('D89')"><img src="./disenno/mapas/pixel<%= getpixel("D89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('E89')"><img src="./disenno/mapas/pixel<%= getpixel("E89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('F89')"><img src="./disenno/mapas/pixel<%= getpixel("F89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('G89')"><img src="./disenno/mapas/pixel<%= getpixel("G89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('H89')"><img src="./disenno/mapas/pixel<%= getpixel("H89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('I89')"><img src="./disenno/mapas/pixel<%= getpixel("I89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('J89')"><img src="./disenno/mapas/pixel<%= getpixel("J89" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr align="center">
                    <td width="4%">&nbsp;</td>
                    <td width="10%">A</td>
                    <td width="9%">B</td>
                    <td width="10%">C</td>
                    <td width="12%">D</td>
                    <td width="9%">E</td>
                    <td width="9%">F</td>
                    <td width="9%">G</td>
                    <td width="9%">H</td>
                    <td width="9%">I</td>
                    <td width="10%">J</td>
                  </tr>
              </table></td>
            </tr>
          </table>
            <br>
          </td>
                  
          <td width="27" valign="top"><table width="100%" border="0" cellspacing="6" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr align="center">
                  <td width="9%">J</td>
                  <td width="9%">I</td>
                  <td width="9%">H</td>
                  <td width="9%">G</td>
                  <td width="9%">F</td>
                  <td width="9%">E</td>
                  <td width="9%">D</td>
                  <td width="9%">C</td>
                  <td width="9%">B</td>
                  <td width="14%">A</td>
                  <td width="5%">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J88')"><img src="./disenno/mapas/pixel<%= getpixel("J88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I88')"><img src="./disenno/mapas/pixel<%= getpixel("I88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H88')"><img src="./disenno/mapas/pixel<%= getpixel("H88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G88')"><img src="./disenno/mapas/pixel<%= getpixel("G88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F88')"><img src="./disenno/mapas/pixel<%= getpixel("F88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E88')"><img src="./disenno/mapas/pixel<%= getpixel("E88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D88')"><img src="./disenno/mapas/pixel<%= getpixel("D88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C88')"><img src="./disenno/mapas/pixel<%= getpixel("C88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B88')"><img src="./disenno/mapas/pixel<%= getpixel("B88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A88')"><img src="./disenno/mapas/pixel<%= getpixel("A88" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>88</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J87')"><img src="./disenno/mapas/pixel<%= getpixel("J87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I87')"><img src="./disenno/mapas/pixel<%= getpixel("I87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H87')"><img src="./disenno/mapas/pixel<%= getpixel("H87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G87')"><img src="./disenno/mapas/pixel<%= getpixel("G87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F87')"><img src="./disenno/mapas/pixel<%= getpixel("F87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E87')"><img src="./disenno/mapas/pixel<%= getpixel("E87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D87')"><img src="./disenno/mapas/pixel<%= getpixel("D87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C87')"><img src="./disenno/mapas/pixel<%= getpixel("C87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B87')"><img src="./disenno/mapas/pixel<%= getpixel("B87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A87')"><img src="./disenno/mapas/pixel<%= getpixel("A87" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>87</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J86')"><img src="./disenno/mapas/pixel<%= getpixel("J86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I86')"><img src="./disenno/mapas/pixel<%= getpixel("I86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H86')"><img src="./disenno/mapas/pixel<%= getpixel("H86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G86')"><img src="./disenno/mapas/pixel<%= getpixel("G86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F86')"><img src="./disenno/mapas/pixel<%= getpixel("F86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E86')"><img src="./disenno/mapas/pixel<%= getpixel("E86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D86')"><img src="./disenno/mapas/pixel<%= getpixel("D86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C86')"><img src="./disenno/mapas/pixel<%= getpixel("C86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B86')"><img src="./disenno/mapas/pixel<%= getpixel("B86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A86')"><img src="./disenno/mapas/pixel<%= getpixel("A86" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>86</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J85')"><img src="./disenno/mapas/pixel<%= getpixel("J85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I85')"><img src="./disenno/mapas/pixel<%= getpixel("I85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H85')"><img src="./disenno/mapas/pixel<%= getpixel("H85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G85')"><img src="./disenno/mapas/pixel<%= getpixel("G85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F85')"><img src="./disenno/mapas/pixel<%= getpixel("F85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E85')"><img src="./disenno/mapas/pixel<%= getpixel("E85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D85')"><img src="./disenno/mapas/pixel<%= getpixel("D85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C85')"><img src="./disenno/mapas/pixel<%= getpixel("C85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B85')"><img src="./disenno/mapas/pixel<%= getpixel("B85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A85')"><img src="./disenno/mapas/pixel<%= getpixel("A85" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>85</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J84')"><img src="./disenno/mapas/pixel<%= getpixel("J84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I84')"><img src="./disenno/mapas/pixel<%= getpixel("I84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H84')"><img src="./disenno/mapas/pixel<%= getpixel("H84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G84')"><img src="./disenno/mapas/pixel<%= getpixel("G84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F84')"><img src="./disenno/mapas/pixel<%= getpixel("F84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E84')"><img src="./disenno/mapas/pixel<%= getpixel("E84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D84')"><img src="./disenno/mapas/pixel<%= getpixel("D84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C84')"><img src="./disenno/mapas/pixel<%= getpixel("C84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B84')"><img src="./disenno/mapas/pixel<%= getpixel("B84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A84')"><img src="./disenno/mapas/pixel<%= getpixel("A84" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>84</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J83')"><img src="./disenno/mapas/pixel<%= getpixel("J83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I83')"><img src="./disenno/mapas/pixel<%= getpixel("I83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H83')"><img src="./disenno/mapas/pixel<%= getpixel("H83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G83')"><img src="./disenno/mapas/pixel<%= getpixel("G83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F83')"><img src="./disenno/mapas/pixel<%= getpixel("F83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E83')"><img src="./disenno/mapas/pixel<%= getpixel("E83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D83')"><img src="./disenno/mapas/pixel<%= getpixel("D83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C83')"><img src="./disenno/mapas/pixel<%= getpixel("C83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B83')"><img src="./disenno/mapas/pixel<%= getpixel("B83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A83')"><img src="./disenno/mapas/pixel<%= getpixel("A83" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>83</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J82')"><img src="./disenno/mapas/pixel<%= getpixel("J82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I82')"><img src="./disenno/mapas/pixel<%= getpixel("I82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H82')"><img src="./disenno/mapas/pixel<%= getpixel("H82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G82')"><img src="./disenno/mapas/pixel<%= getpixel("G82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F82')"><img src="./disenno/mapas/pixel<%= getpixel("F82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E82')"><img src="./disenno/mapas/pixel<%= getpixel("E82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D82')"><img src="./disenno/mapas/pixel<%= getpixel("D82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C82')"><img src="./disenno/mapas/pixel<%= getpixel("C82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B82')"><img src="./disenno/mapas/pixel<%= getpixel("B82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A82')"><img src="./disenno/mapas/pixel<%= getpixel("A82" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>82</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J81')"><img src="./disenno/mapas/pixel<%= getpixel("J81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I81')"><img src="./disenno/mapas/pixel<%= getpixel("I81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H81')"><img src="./disenno/mapas/pixel<%= getpixel("H81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G81')"><img src="./disenno/mapas/pixel<%= getpixel("G81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F81')"><img src="./disenno/mapas/pixel<%= getpixel("F81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E81')"><img src="./disenno/mapas/pixel<%= getpixel("E81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D81')"><img src="./disenno/mapas/pixel<%= getpixel("D81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C81')"><img src="./disenno/mapas/pixel<%= getpixel("C81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B81')"><img src="./disenno/mapas/pixel<%= getpixel("B81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A81')"><img src="./disenno/mapas/pixel<%= getpixel("A81" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>81</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J80')"><img src="./disenno/mapas/pixel<%= getpixel("J80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I80')"><img src="./disenno/mapas/pixel<%= getpixel("I80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H80')"><img src="./disenno/mapas/pixel<%= getpixel("H80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G80')"><img src="./disenno/mapas/pixel<%= getpixel("G80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F80')"><img src="./disenno/mapas/pixel<%= getpixel("F80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E80')"><img src="./disenno/mapas/pixel<%= getpixel("E80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D80')"><img src="./disenno/mapas/pixel<%= getpixel("D80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C80')"><img src="./disenno/mapas/pixel<%= getpixel("C80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B80')"><img src="./disenno/mapas/pixel<%= getpixel("B80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A80')"><img src="./disenno/mapas/pixel<%= getpixel("A80" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>80</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J79')"><img src="./disenno/mapas/pixel<%= getpixel("J79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I79')"><img src="./disenno/mapas/pixel<%= getpixel("I79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H79')"><img src="./disenno/mapas/pixel<%= getpixel("H79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G79')"><img src="./disenno/mapas/pixel<%= getpixel("G79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F79')"><img src="./disenno/mapas/pixel<%= getpixel("F79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E79')"><img src="./disenno/mapas/pixel<%= getpixel("E79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D79')"><img src="./disenno/mapas/pixel<%= getpixel("D79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C79')"><img src="./disenno/mapas/pixel<%= getpixel("C79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B79')"><img src="./disenno/mapas/pixel<%= getpixel("B79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A79')"><img src="./disenno/mapas/pixel<%= getpixel("A79" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>79</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J78')"><img src="./disenno/mapas/pixel<%= getpixel("J78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I78')"><img src="./disenno/mapas/pixel<%= getpixel("I78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H78')"><img src="./disenno/mapas/pixel<%= getpixel("H78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G78')"><img src="./disenno/mapas/pixel<%= getpixel("G78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F78')"><img src="./disenno/mapas/pixel<%= getpixel("F78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E78')"><img src="./disenno/mapas/pixel<%= getpixel("E78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D78')"><img src="./disenno/mapas/pixel<%= getpixel("D78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C78')"><img src="./disenno/mapas/pixel<%= getpixel("C78" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td>78</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J77')"><img src="./disenno/mapas/pixel<%= getpixel("J77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I77')"><img src="./disenno/mapas/pixel<%= getpixel("I77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H77')"><img src="./disenno/mapas/pixel<%= getpixel("H77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G77')"><img src="./disenno/mapas/pixel<%= getpixel("G77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F77')"><img src="./disenno/mapas/pixel<%= getpixel("F77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E77')"><img src="./disenno/mapas/pixel<%= getpixel("E77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D77')"><img src="./disenno/mapas/pixel<%= getpixel("D77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C77')"><img src="./disenno/mapas/pixel<%= getpixel("C77" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td>77</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J76')"><img src="./disenno/mapas/pixel<%= getpixel("J76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I76')"><img src="./disenno/mapas/pixel<%= getpixel("I76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H76')"><img src="./disenno/mapas/pixel<%= getpixel("H76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G76')"><img src="./disenno/mapas/pixel<%= getpixel("G76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F76')"><img src="./disenno/mapas/pixel<%= getpixel("F76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E76')"><img src="./disenno/mapas/pixel<%= getpixel("E76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D76')"><img src="./disenno/mapas/pixel<%= getpixel("D76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C76')"><img src="./disenno/mapas/pixel<%= getpixel("C76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B76')"><img src="./disenno/mapas/pixel<%= getpixel("B76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A76')"><img src="./disenno/mapas/pixel<%= getpixel("A76" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>76</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J75')"><img src="./disenno/mapas/pixel<%= getpixel("J75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I75')"><img src="./disenno/mapas/pixel<%= getpixel("I75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H75')"><img src="./disenno/mapas/pixel<%= getpixel("H75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G75')"><img src="./disenno/mapas/pixel<%= getpixel("G75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F75')"><img src="./disenno/mapas/pixel<%= getpixel("F75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E75')"><img src="./disenno/mapas/pixel<%= getpixel("E75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D75')"><img src="./disenno/mapas/pixel<%= getpixel("D75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C75')"><img src="./disenno/mapas/pixel<%= getpixel("C75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B75')"><img src="./disenno/mapas/pixel<%= getpixel("B75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A75')"><img src="./disenno/mapas/pixel<%= getpixel("A75" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>75</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J74')"><img src="./disenno/mapas/pixel<%= getpixel("J74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I74')"><img src="./disenno/mapas/pixel<%= getpixel("I74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H74')"><img src="./disenno/mapas/pixel<%= getpixel("H74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G74')"><img src="./disenno/mapas/pixel<%= getpixel("G74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F74')"><img src="./disenno/mapas/pixel<%= getpixel("F74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E74')"><img src="./disenno/mapas/pixel<%= getpixel("E74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D74')"><img src="./disenno/mapas/pixel<%= getpixel("D74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C74')"><img src="./disenno/mapas/pixel<%= getpixel("C74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B74')"><img src="./disenno/mapas/pixel<%= getpixel("B74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A74')"><img src="./disenno/mapas/pixel<%= getpixel("A74" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>74</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J73')"><img src="./disenno/mapas/pixel<%= getpixel("J73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I73')"><img src="./disenno/mapas/pixel<%= getpixel("I73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H73')"><img src="./disenno/mapas/pixel<%= getpixel("H73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G73')"><img src="./disenno/mapas/pixel<%= getpixel("G73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F73')"><img src="./disenno/mapas/pixel<%= getpixel("F73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E73')"><img src="./disenno/mapas/pixel<%= getpixel("E73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D73')"><img src="./disenno/mapas/pixel<%= getpixel("D73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C73')"><img src="./disenno/mapas/pixel<%= getpixel("C73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B73')"><img src="./disenno/mapas/pixel<%= getpixel("B73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A73')"><img src="./disenno/mapas/pixel<%= getpixel("A73" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>73</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J72')"><img src="./disenno/mapas/pixel<%= getpixel("J72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I72')"><img src="./disenno/mapas/pixel<%= getpixel("I72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H72')"><img src="./disenno/mapas/pixel<%= getpixel("H72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G72')"><img src="./disenno/mapas/pixel<%= getpixel("G72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F72')"><img src="./disenno/mapas/pixel<%= getpixel("F72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E72')"><img src="./disenno/mapas/pixel<%= getpixel("E72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D72')"><img src="./disenno/mapas/pixel<%= getpixel("D72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C72')"><img src="./disenno/mapas/pixel<%= getpixel("C72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B72')"><img src="./disenno/mapas/pixel<%= getpixel("B72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A72')"><img src="./disenno/mapas/pixel<%= getpixel("A72" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>72</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J71')"><img src="./disenno/mapas/pixel<%= getpixel("J71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I71')"><img src="./disenno/mapas/pixel<%= getpixel("I71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H71')"><img src="./disenno/mapas/pixel<%= getpixel("H71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G71')"><img src="./disenno/mapas/pixel<%= getpixel("G71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F71')"><img src="./disenno/mapas/pixel<%= getpixel("F71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E71')"><img src="./disenno/mapas/pixel<%= getpixel("E71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D71')"><img src="./disenno/mapas/pixel<%= getpixel("D71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C71')"><img src="./disenno/mapas/pixel<%= getpixel("C71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B71')"><img src="./disenno/mapas/pixel<%= getpixel("B71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A71')"><img src="./disenno/mapas/pixel<%= getpixel("A71" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>71</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J70')"><img src="./disenno/mapas/pixel<%= getpixel("J70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I70')"><img src="./disenno/mapas/pixel<%= getpixel("I70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H70')"><img src="./disenno/mapas/pixel<%= getpixel("H70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G70')"><img src="./disenno/mapas/pixel<%= getpixel("G70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F70')"><img src="./disenno/mapas/pixel<%= getpixel("F70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E70')"><img src="./disenno/mapas/pixel<%= getpixel("E70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D70')"><img src="./disenno/mapas/pixel<%= getpixel("D70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C70')"><img src="./disenno/mapas/pixel<%= getpixel("C70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B70')"><img src="./disenno/mapas/pixel<%= getpixel("B70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A70')"><img src="./disenno/mapas/pixel<%= getpixel("A70" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>70</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J69')"><img src="./disenno/mapas/pixel<%= getpixel("J69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I69')"><img src="./disenno/mapas/pixel<%= getpixel("I69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H69')"><img src="./disenno/mapas/pixel<%= getpixel("H69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G69')"><img src="./disenno/mapas/pixel<%= getpixel("G69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F69')"><img src="./disenno/mapas/pixel<%= getpixel("F69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E69')"><img src="./disenno/mapas/pixel<%= getpixel("E69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D69')"><img src="./disenno/mapas/pixel<%= getpixel("D69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C69')"><img src="./disenno/mapas/pixel<%= getpixel("C69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B69')"><img src="./disenno/mapas/pixel<%= getpixel("B69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A69')"><img src="./disenno/mapas/pixel<%= getpixel("A69" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>69</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
				<td><a href="javascript:pick('J68')"><img src="./disenno/mapas/pixel<%= getpixel("J68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('I68')"><img src="./disenno/mapas/pixel<%= getpixel("I68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('H68')"><img src="./disenno/mapas/pixel<%= getpixel("H68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G68')"><img src="./disenno/mapas/pixel<%= getpixel("G68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F68')"><img src="./disenno/mapas/pixel<%= getpixel("F68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E68')"><img src="./disenno/mapas/pixel<%= getpixel("E68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D68')"><img src="./disenno/mapas/pixel<%= getpixel("D68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C68')"><img src="./disenno/mapas/pixel<%= getpixel("C68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B68')"><img src="./disenno/mapas/pixel<%= getpixel("B68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A68')"><img src="./disenno/mapas/pixel<%= getpixel("A68" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>68</td>
                </tr>
                <tr>
				<td><a href="javascript:pick('J67')"><img src="./disenno/mapas/pixel<%= getpixel("J67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('I67')"><img src="./disenno/mapas/pixel<%= getpixel("I67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('H67')"><img src="./disenno/mapas/pixel<%= getpixel("H67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G67')"><img src="./disenno/mapas/pixel<%= getpixel("G67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F67')"><img src="./disenno/mapas/pixel<%= getpixel("F67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E67')"><img src="./disenno/mapas/pixel<%= getpixel("E67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D67')"><img src="./disenno/mapas/pixel<%= getpixel("D67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C67')"><img src="./disenno/mapas/pixel<%= getpixel("C67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B67')"><img src="./disenno/mapas/pixel<%= getpixel("B67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A67')"><img src="./disenno/mapas/pixel<%= getpixel("A67" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>67</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr align="center">
				  <td width="9%">J</td>
				  <td width="9%">I</td>
				  <td width="9%">H</td>
                    <td width="9%">G</td>
                    <td width="9%">F</td>
                    <td width="9%">E</td>
                    <td width="9%">D</td>
                    <td width="9%">C</td>
                    <td width="9%">B</td>
                    <td width="14%">A</td>
                    <td width="5%">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <br>
      </td>
	  
	  <td width="27" valign="bottom"><br>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
                <td><img src="./disenno/mapas/pixel.gif" width="55" height="1">&nbsp;</td>
        </tr>
      </table></td>

          <td width="170" valign="top"><table width="100%" border="0" cellspacing="6" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr align="center">
                  <td width="4%">&nbsp;</td>
                  <td width="10%">A</td>
                  <td width="10%">B</td>
                  <td width="9%">C</td>
                  <td width="10%">D</td>
                  <td width="11%">E</td>
                  <td width="9%">F</td>
                  <td width="9%">G</td>
                  <td width="9%">H</td>
                  <td width="9%">I</td>
                  <td width="10%">J</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>66</td>
                  <td><a href="javascript:pick('A66')"><img src="./disenno/mapas/pixel<%= getpixel("A66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B66')"><img src="./disenno/mapas/pixel<%= getpixel("A66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C66')"><img src="./disenno/mapas/pixel<%= getpixel("C66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick(D66')"><img src="./disenno/mapas/pixel<%= getpixel("D66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E66')"><img src="./disenno/mapas/pixel<%= getpixel("E66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F66')"><img src="./disenno/mapas/pixel<%= getpixel("F66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G66')"><img src="./disenno/mapas/pixel<%= getpixel("G66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H66')"><img src="./disenno/mapas/pixel<%= getpixel("H66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I66')"><img src="./disenno/mapas/pixel<%= getpixel("I66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J66')"><img src="./disenno/mapas/pixel<%= getpixel("J66" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>65</td>
                  <td><a href="javascript:pick('A65')"><img src="./disenno/mapas/pixel<%= getpixel("A65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B65')"><img src="./disenno/mapas/pixel<%= getpixel("B65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C65')"><img src="./disenno/mapas/pixel<%= getpixel("C65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D65')"><img src="./disenno/mapas/pixel<%= getpixel("D65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E65')"><img src="./disenno/mapas/pixel<%= getpixel("E65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F65')"><img src="./disenno/mapas/pixel<%= getpixel("F65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick(G65')"><img src="./disenno/mapas/pixel<%= getpixel("G65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H65')"><img src="./disenno/mapas/pixel<%= getpixel("H65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I65')"><img src="./disenno/mapas/pixel<%= getpixel("I65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J65')"><img src="./disenno/mapas/pixel<%= getpixel("J65" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>64</td>
                  <td><a href="javascript:pick('A64')"><img src="./disenno/mapas/pixel<%= getpixel("A64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B64')"><img src="./disenno/mapas/pixel<%= getpixel("B64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C64')"><img src="./disenno/mapas/pixel<%= getpixel("C64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D64')"><img src="./disenno/mapas/pixel<%= getpixel("D64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E64')"><img src="./disenno/mapas/pixel<%= getpixel("E64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F64')"><img src="./disenno/mapas/pixel<%= getpixel("F64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G64')"><img src="./disenno/mapas/pixel<%= getpixel("G64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H64')"><img src="./disenno/mapas/pixel<%= getpixel("H64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I64')"><img src="./disenno/mapas/pixel<%= getpixel("I64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J64')"><img src="./disenno/mapas/pixel<%= getpixel("J64" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>63</td>
                  <td><a href="javascript:pick('A63')"><img src="./disenno/mapas/pixel<%= getpixel("A63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B63')"><img src="./disenno/mapas/pixel<%= getpixel("B63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C63')"><img src="./disenno/mapas/pixel<%= getpixel("C63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D63')"><img src="./disenno/mapas/pixel<%= getpixel("D63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E63')"><img src="./disenno/mapas/pixel<%= getpixel("E63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F63')"><img src="./disenno/mapas/pixel<%= getpixel("F63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G63')"><img src="./disenno/mapas/pixel<%= getpixel("G63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H63')"><img src="./disenno/mapas/pixel<%= getpixel("H63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I63')"><img src="./disenno/mapas/pixel<%= getpixel("I63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J63')"><img src="./disenno/mapas/pixel<%= getpixel("J63" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>62</td>
                  <td><a href="javascript:pick('A62')"><img src="./disenno/mapas/pixel<%= getpixel("A62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B62')"><img src="./disenno/mapas/pixel<%= getpixel("B62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C62')"><img src="./disenno/mapas/pixel<%= getpixel("C62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D62')"><img src="./disenno/mapas/pixel<%= getpixel("D62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E62')"><img src="./disenno/mapas/pixel<%= getpixel("E62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F62')"><img src="./disenno/mapas/pixel<%= getpixel("E18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G62')"><img src="./disenno/mapas/pixel<%= getpixel("G62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H62')"><img src="./disenno/mapas/pixel<%= getpixel("C18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I62')"><img src="./disenno/mapas/pixel<%= getpixel("I62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J62')"><img src="./disenno/mapas/pixel<%= getpixel("J62" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>61</td>
                  <td><a href="javascript:pick('A61')"><img src="./disenno/mapas/pixel<%= getpixel("A61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B61')"><img src="./disenno/mapas/pixel<%= getpixel("B61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C61')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D61')"><img src="./disenno/mapas/pixel<%= getpixel("D61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E61')"><img src="./disenno/mapas/pixel<%= getpixel("E61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F61')"><img src="./disenno/mapas/pixel<%= getpixel("F61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G61')"><img src="./disenno/mapas/pixel<%= getpixel("G61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H61')"><img src="./disenno/mapas/pixel<%= getpixel("H61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I61')"><img src="./disenno/mapas/pixel<%= getpixel("I61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J61')"><img src="./disenno/mapas/pixel<%= getpixel("J61" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>60</td>
                  <td><a href="javascript:pick('A60')"><img src="./disenno/mapas/pixel<%= getpixel("A60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B60')"><img src="./disenno/mapas/pixel<%= getpixel("B60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C60')"><img src="./disenno/mapas/pixel<%= getpixel("C60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D60')"><img src="./disenno/mapas/pixel<%= getpixel("D60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E60')"><img src="./disenno/mapas/pixel<%= getpixel("E60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F60')"><img src="./disenno/mapas/pixel<%= getpixel("F60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G60')"><img src="./disenno/mapas/pixel<%= getpixel("G60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H60')"><img src="./disenno/mapas/pixel<%= getpixel("H60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I60')"><img src="./disenno/mapas/pixel<%= getpixel("I60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J60')"><img src="./disenno/mapas/pixel<%= getpixel("J60" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>59</td>
                  <td><a href="javascript:pick('A59')"><img src="./disenno/mapas/pixel<%= getpixel("A59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B59')"><img src="./disenno/mapas/pixel<%= getpixel("B59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C59')"><img src="./disenno/mapas/pixel<%= getpixel("C59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D59')"><img src="./disenno/mapas/pixel<%= getpixel("D59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E59')"><img src="./disenno/mapas/pixel<%= getpixel("E59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F59')"><img src="./disenno/mapas/pixel<%= getpixel("F59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G59')"><img src="./disenno/mapas/pixel<%= getpixel("G59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H59')"><img src="./disenno/mapas/pixel<%= getpixel("H59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I59')"><img src="./disenno/mapas/pixel<%= getpixel("I59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J59')"><img src="./disenno/mapas/pixel<%= getpixel("J59" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>58</td>
                  <td><a href="javascript:pick('A58')"><img src="./disenno/mapas/pixel<%= getpixel("A58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B58')"><img src="./disenno/mapas/pixel<%= getpixel("B58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C58')"><img src="./disenno/mapas/pixel<%= getpixel("C58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D58')"><img src="./disenno/mapas/pixel<%= getpixel("D58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E58')"><img src="./disenno/mapas/pixel<%= getpixel("E58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F58')"><img src="./disenno/mapas/pixel<%= getpixel("F58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G58')"><img src="./disenno/mapas/pixel<%= getpixel("G58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H58')"><img src="./disenno/mapas/pixel<%= getpixel("H58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I58')"><img src="./disenno/mapas/pixel<%= getpixel("I58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J58')"><img src="./disenno/mapas/pixel<%= getpixel("J58" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>57</td>
                  <td><a href="javascript:pick('A57')"><img src="./disenno/mapas/pixel<%= getpixel("A57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B57')"><img src="./disenno/mapas/pixel<%= getpixel("B57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C57')"><img src="./disenno/mapas/pixel<%= getpixel("C57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D57')"><img src="./disenno/mapas/pixel<%= getpixel("D57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E57')"><img src="./disenno/mapas/pixel<%= getpixel("E57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F57')"><img src="./disenno/mapas/pixel<%= getpixel("F57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G57')"><img src="./disenno/mapas/pixel<%= getpixel("G57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H57')"><img src="./disenno/mapas/pixel<%= getpixel("H57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I57')"><img src="./disenno/mapas/pixel<%= getpixel("I57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J57')"><img src="./disenno/mapas/pixel<%= getpixel("J57" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>56</td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><a href="javascript:pick('C56')"><img src="./disenno/mapas/pixel<%= getpixel("C56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D56')"><img src="./disenno/mapas/pixel<%= getpixel("D56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E56')"><img src="./disenno/mapas/pixel<%= getpixel("E56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F56')"><img src="./disenno/mapas/pixel<%= getpixel("F56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G56')"><img src="./disenno/mapas/pixel<%= getpixel("G56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H56')"><img src="./disenno/mapas/pixel<%= getpixel("H56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I56')"><img src="./disenno/mapas/pixel<%= getpixel("I56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J56')"><img src="./disenno/mapas/pixel<%= getpixel("J56" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>55</td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><a href="javascript:pick('C55')"><img src="./disenno/mapas/pixel<%= getpixel("C55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D55')"><img src="./disenno/mapas/pixel<%= getpixel("D55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E55')"><img src="./disenno/mapas/pixel<%= getpixel("E55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F55')"><img src="./disenno/mapas/pixel<%= getpixel("F55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G55')"><img src="./disenno/mapas/pixel<%= getpixel("G55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H55')"><img src="./disenno/mapas/pixel<%= getpixel("H55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I55')"><img src="./disenno/mapas/pixel<%= getpixel("I55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J55')"><img src="./disenno/mapas/pixel<%= getpixel("J55" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>54</td>
                  <td><a href="javascript:pick('A54')"><img src="./disenno/mapas/pixel<%= getpixel("A54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B54')"><img src="./disenno/mapas/pixel<%= getpixel("B54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C54')"><img src="./disenno/mapas/pixel<%= getpixel("C54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D54')"><img src="./disenno/mapas/pixel<%= getpixel("D54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E54')"><img src="./disenno/mapas/pixel<%= getpixel("E54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F54')"><img src="./disenno/mapas/pixel<%= getpixel("F54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G54')"><img src="./disenno/mapas/pixel<%= getpixel("G54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H54')"><img src="./disenno/mapas/pixel<%= getpixel("H54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I54')"><img src="./disenno/mapas/pixel<%= getpixel("I54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J54')"><img src="./disenno/mapas/pixel<%= getpixel("J54" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>53</td>
                  <td><a href="javascript:pick('A53')"><img src="./disenno/mapas/pixel<%= getpixel("A53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B53')"><img src="./disenno/mapas/pixel<%= getpixel("B53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C53')"><img src="./disenno/mapas/pixel<%= getpixel("C53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D53')"><img src="./disenno/mapas/pixel<%= getpixel("D53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E53')"><img src="./disenno/mapas/pixel<%= getpixel("E53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F53')"><img src="./disenno/mapas/pixel<%= getpixel("F53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G53')"><img src="./disenno/mapas/pixel<%= getpixel("G53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H53')"><img src="./disenno/mapas/pixel<%= getpixel("H53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I53')"><img src="./disenno/mapas/pixel<%= getpixel("I53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J53')"><img src="./disenno/mapas/pixel<%= getpixel("J53" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>52</td>
                  <td><a href="javascript:pick('A52')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B52')"><img src="./disenno/mapas/pixel<%= getpixel("B52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C52')"><img src="./disenno/mapas/pixel<%= getpixel("C52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D52')"><img src="./disenno/mapas/pixel<%= getpixel("D52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E52')"><img src="./disenno/mapas/pixel<%= getpixel("E52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F52')"><img src="./disenno/mapas/pixel<%= getpixel("F52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G52')"><img src="./disenno/mapas/pixel<%= getpixel("G52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H52')"><img src="./disenno/mapas/pixel<%= getpixel("H52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I52')"><img src="./disenno/mapas/pixel<%= getpixel("I52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J52')"><img src="./disenno/mapas/pixel<%= getpixel("J52" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>51</td>
                  <td><a href="javascript:pick('A51')"><img src="./disenno/mapas/pixel<%= getpixel("A51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B51')"><img src="./disenno/mapas/pixel<%= getpixel("B51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C51')"><img src="./disenno/mapas/pixel<%= getpixel("C51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D51')"><img src="./disenno/mapas/pixel<%= getpixel("D51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E51')"><img src="./disenno/mapas/pixel<%= getpixel("E51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F51')"><img src="./disenno/mapas/pixel<%= getpixel("F51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G51')"><img src="./disenno/mapas/pixel<%= getpixel("G51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H51')"><img src="./disenno/mapas/pixel<%= getpixel("H51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I51')"><img src="./disenno/mapas/pixel<%= getpixel("I51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J51')"><img src="./disenno/mapas/pixel<%= getpixel("J51" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>50</td>
                  <td><a href="javascript:pick('A50')"><img src="./disenno/mapas/pixel<%= getpixel("A50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B50')"><img src="./disenno/mapas/pixel<%= getpixel("B50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C50')"><img src="./disenno/mapas/pixel<%= getpixel("C50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D50')"><img src="./disenno/mapas/pixel<%= getpixel("D50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E50')"><img src="./disenno/mapas/pixel<%= getpixel("E50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F50')"><img src="./disenno/mapas/pixel<%= getpixel("F50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G50')"><img src="./disenno/mapas/pixel<%= getpixel("G50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H50')"><img src="./disenno/mapas/pixel<%= getpixel("H50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I50')"><img src="./disenno/mapas/pixel<%= getpixel("I50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J50')"><img src="./disenno/mapas/pixel<%= getpixel("J50" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>49</td>
                  <td><a href="javascript:pick('A49')"><img src="./disenno/mapas/pixel<%= getpixel("A49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B49')"><img src="./disenno/mapas/pixel<%= getpixel("B49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C49')"><img src="./disenno/mapas/pixel<%= getpixel("C49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D49')"><img src="./disenno/mapas/pixel<%= getpixel("D49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E49')"><img src="./disenno/mapas/pixel<%= getpixel("E49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F49')"><img src="./disenno/mapas/pixel<%= getpixel("F49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G49')"><img src="./disenno/mapas/pixel<%= getpixel("G49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H49')"><img src="./disenno/mapas/pixel<%= getpixel("H49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I49')"><img src="./disenno/mapas/pixel<%= getpixel("I49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J49')"><img src="./disenno/mapas/pixel<%= getpixel("J49" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td>48</td>
                  <td><a href="javascript:pick('A48')"><img src="./disenno/mapas/pixel<%= getpixel("A48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B48')"><img src="./disenno/mapas/pixel<%= getpixel("B48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C48')"><img src="./disenno/mapas/pixel<%= getpixel("C48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D48')"><img src="./disenno/mapas/pixel<%= getpixel("D48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E48')"><img src="./disenno/mapas/pixel<%= getpixel("E48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F48')"><img src="./disenno/mapas/pixel<%= getpixel("F48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G48')"><img src="./disenno/mapas/pixel<%= getpixel("G48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H48')"><img src="./disenno/mapas/pixel<%= getpixel("H48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I48')"><img src="./disenno/mapas/pixel<%= getpixel("I48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J48')"><img src="./disenno/mapas/pixel<%= getpixel("J48" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
                <tr>
                  <td>47</td>
                  <td><a href="javascript:pick('A47')"><img src="./disenno/mapas/pixel<%= getpixel("A47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B47')"><img src="./disenno/mapas/pixel<%= getpixel("B47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C47')"><img src="./disenno/mapas/pixel<%= getpixel("C47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D47')"><img src="./disenno/mapas/pixel<%= getpixel("D47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E47')"><img src="./disenno/mapas/pixel<%= getpixel("E47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F47')"><img src="./disenno/mapas/pixel<%= getpixel("F47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G47')"><img src="./disenno/mapas/pixel<%= getpixel("G47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H47')"><img src="./disenno/mapas/pixel<%= getpixel("H47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I47')"><img src="./disenno/mapas/pixel<%= getpixel("I47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('J47')"><img src="./disenno/mapas/pixel<%= getpixel("J47" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                  <tr>
				  <td>46</td>
                    <td><a href="javascript:pick('A46')"><img src="./disenno/mapas/pixel<%= getpixel("A46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('B46')"><img src="./disenno/mapas/pixel<%= getpixel("B46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('C46')"><img src="./disenno/mapas/pixel<%= getpixel("C46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('D46')"><img src="./disenno/mapas/pixel<%= getpixel("D46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('E46')"><img src="./disenno/mapas/pixel<%= getpixel("E46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('F46')"><img src="./disenno/mapas/pixel<%= getpixel("F46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('G46')"><img src="./disenno/mapas/pixel<%= getpixel("G46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('H46')"><img src="./disenno/mapas/pixel<%= getpixel("H46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('I46')"><img src="./disenno/mapas/pixel<%= getpixel("I46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('J46')"><img src="./disenno/mapas/pixel<%= getpixel("J46" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    
                  </tr>
                  <tr>
				  <td>45</td>
                    <td><a href="javascript:pick('A45')"><img src="./disenno/mapas/pixel<%= getpixel("A45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('B45')"><img src="./disenno/mapas/pixel<%= getpixel("B45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('C45')"><img src="./disenno/mapas/pixel<%= getpixel("C45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('D45')"><img src="./disenno/mapas/pixel<%= getpixel("D45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('E45')"><img src="./disenno/mapas/pixel<%= getpixel("E45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('F45')"><img src="./disenno/mapas/pixel<%= getpixel("F45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('G45')"><img src="./disenno/mapas/pixel<%= getpixel("G45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('H45')"><img src="./disenno/mapas/pixel<%= getpixel("H45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('I45')"><img src="./disenno/mapas/pixel<%= getpixel("I45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('J45')"><img src="./disenno/mapas/pixel<%= getpixel("J45" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr align="center">
                    <td width="4%">&nbsp;</td>
                    <td width="10%">A</td>
                    <td width="9%">B</td>
                    <td width="10%">C</td>
                    <td width="12%">D</td>
                    <td width="9%">E</td>
                    <td width="9%">F</td>
                    <td width="9%">G</td>
                    <td width="9%">H</td>
                    <td width="9%">I</td>
                    <td width="10%">J</td>
                  </tr>
              </table></td>
            </tr>
          </table>
            <br>
          </td>
                  
          <td width="27" valign="top"><table width="100%" border="0" cellspacing="6" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr align="center">
                  <td width="9%">J</td>
                  <td width="9%">I</td>
                  <td width="9%">H</td>
                  <td width="9%">G</td>
                  <td width="9%">F</td>
                  <td width="9%">E</td>
                  <td width="9%">D</td>
                  <td width="9%">C</td>
                  <td width="9%">B</td>
                  <td width="14%">A</td>
                  <td width="5%">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J44')"><img src="./disenno/mapas/pixel<%= getpixel("J44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I44')"><img src="./disenno/mapas/pixel<%= getpixel("I44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H44')"><img src="./disenno/mapas/pixel<%= getpixel("H44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G44')"><img src="./disenno/mapas/pixel<%= getpixel("G44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F44')"><img src="./disenno/mapas/pixel<%= getpixel("F44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E44')"><img src="./disenno/mapas/pixel<%= getpixel("E44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D44')"><img src="./disenno/mapas/pixel<%= getpixel("D44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C44')"><img src="./disenno/mapas/pixel<%= getpixel("C44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B44')"><img src="./disenno/mapas/pixel<%= getpixel("B44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A44')"><img src="./disenno/mapas/pixel<%= getpixel("A44" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>44</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J43')"><img src="./disenno/mapas/pixel<%= getpixel("J43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I43')"><img src="./disenno/mapas/pixel<%= getpixel("I43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H43')"><img src="./disenno/mapas/pixel<%= getpixel("H43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G43')"><img src="./disenno/mapas/pixel<%= getpixel("G43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F43')"><img src="./disenno/mapas/pixel<%= getpixel("F43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E43')"><img src="./disenno/mapas/pixel<%= getpixel("E43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D43')"><img src="./disenno/mapas/pixel<%= getpixel("D43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C43')"><img src="./disenno/mapas/pixel<%= getpixel("C43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B43')"><img src="./disenno/mapas/pixel<%= getpixel("B43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A43')"><img src="./disenno/mapas/pixel<%= getpixel("A43" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>43</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J42')"><img src="./disenno/mapas/pixel<%= getpixel("J42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I42')"><img src="./disenno/mapas/pixel<%= getpixel("I42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H42')"><img src="./disenno/mapas/pixel<%= getpixel("H42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G42')"><img src="./disenno/mapas/pixel<%= getpixel("G42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F42')"><img src="./disenno/mapas/pixel<%= getpixel("F42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E42')"><img src="./disenno/mapas/pixel<%= getpixel("E42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D42')"><img src="./disenno/mapas/pixel<%= getpixel("D42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C42')"><img src="./disenno/mapas/pixel<%= getpixel("C42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B42')"><img src="./disenno/mapas/pixel<%= getpixel("B42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A42')"><img src="./disenno/mapas/pixel<%= getpixel("A42" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>42</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J41')"><img src="./disenno/mapas/pixel<%= getpixel("J41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I41')"><img src="./disenno/mapas/pixel<%= getpixel("I41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H41')"><img src="./disenno/mapas/pixel<%= getpixel("H41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G41')"><img src="./disenno/mapas/pixel<%= getpixel("G41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F41')"><img src="./disenno/mapas/pixel<%= getpixel("F41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E41')"><img src="./disenno/mapas/pixel<%= getpixel("E41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D41')"><img src="./disenno/mapas/pixel<%= getpixel("D41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C41')"><img src="./disenno/mapas/pixel<%= getpixel("C41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B41')"><img src="./disenno/mapas/pixel<%= getpixel("B41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A41')"><img src="./disenno/mapas/pixel<%= getpixel("A41" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>41</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J40')"><img src="./disenno/mapas/pixel<%= getpixel("J40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I40')"><img src="./disenno/mapas/pixel<%= getpixel("I40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H40')"><img src="./disenno/mapas/pixel<%= getpixel("H40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G40')"><img src="./disenno/mapas/pixel<%= getpixel("G40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F40')"><img src="./disenno/mapas/pixel<%= getpixel("F40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E40')"><img src="./disenno/mapas/pixel<%= getpixel("E40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D40')"><img src="./disenno/mapas/pixel<%= getpixel("D40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C40')"><img src="./disenno/mapas/pixel<%= getpixel("C40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B40')"><img src="./disenno/mapas/pixel<%= getpixel("B40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A40')"><img src="./disenno/mapas/pixel<%= getpixel("A40" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>40</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J39')"><img src="./disenno/mapas/pixel<%= getpixel("J39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I39')"><img src="./disenno/mapas/pixel<%= getpixel("I39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H39')"><img src="./disenno/mapas/pixel<%= getpixel("H39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G39')"><img src="./disenno/mapas/pixel<%= getpixel("G39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F39')"><img src="./disenno/mapas/pixel<%= getpixel("F39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E39')"><img src="./disenno/mapas/pixel<%= getpixel("E39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D39')"><img src="./disenno/mapas/pixel<%= getpixel("D39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C39')"><img src="./disenno/mapas/pixel<%= getpixel("C39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B39')"><img src="./disenno/mapas/pixel<%= getpixel("B39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A39')"><img src="./disenno/mapas/pixel<%= getpixel("A39" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>39</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J38')"><img src="./disenno/mapas/pixel<%= getpixel("J38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I38')"><img src="./disenno/mapas/pixel<%= getpixel("I38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H38')"><img src="./disenno/mapas/pixel<%= getpixel("H38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G38')"><img src="./disenno/mapas/pixel<%= getpixel("G38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F38')"><img src="./disenno/mapas/pixel<%= getpixel("F38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E38')"><img src="./disenno/mapas/pixel<%= getpixel("E38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D38')"><img src="./disenno/mapas/pixel<%= getpixel("D38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C38')"><img src="./disenno/mapas/pixel<%= getpixel("C38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B38')"><img src="./disenno/mapas/pixel<%= getpixel("B38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A38')"><img src="./disenno/mapas/pixel<%= getpixel("A38" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>38</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J37')"><img src="./disenno/mapas/pixel<%= getpixel("J37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I37')"><img src="./disenno/mapas/pixel<%= getpixel("I37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H37')"><img src="./disenno/mapas/pixel<%= getpixel("H37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G37')"><img src="./disenno/mapas/pixel<%= getpixel("G37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F37')"><img src="./disenno/mapas/pixel<%= getpixel("F37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E37')"><img src="./disenno/mapas/pixel<%= getpixel("E37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D37')"><img src="./disenno/mapas/pixel<%= getpixel("D37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C37')"><img src="./disenno/mapas/pixel<%= getpixel("C37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B37')"><img src="./disenno/mapas/pixel<%= getpixel("B37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A37')"><img src="./disenno/mapas/pixel<%= getpixel("A37" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>37</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J36')"><img src="./disenno/mapas/pixel<%= getpixel("J36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I36')"><img src="./disenno/mapas/pixel<%= getpixel("I36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H36')"><img src="./disenno/mapas/pixel<%= getpixel("H36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G36')"><img src="./disenno/mapas/pixel<%= getpixel("G36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F36')"><img src="./disenno/mapas/pixel<%= getpixel("F36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E36')"><img src="./disenno/mapas/pixel<%= getpixel("E36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D36')"><img src="./disenno/mapas/pixel<%= getpixel("D36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C36')"><img src="./disenno/mapas/pixel<%= getpixel("C36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B36')"><img src="./disenno/mapas/pixel<%= getpixel("B36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A36')"><img src="./disenno/mapas/pixel<%= getpixel("A36" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>36</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J35')"><img src="./disenno/mapas/pixel<%= getpixel("J35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I35')"><img src="./disenno/mapas/pixel<%= getpixel("I35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H35')"><img src="./disenno/mapas/pixel<%= getpixel("H35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G35')"><img src="./disenno/mapas/pixel<%= getpixel("G35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F35')"><img src="./disenno/mapas/pixel<%= getpixel("F35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E35')"><img src="./disenno/mapas/pixel<%= getpixel("E35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D35')"><img src="./disenno/mapas/pixel<%= getpixel("D35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C35')"><img src="./disenno/mapas/pixel<%= getpixel("C35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B35')"><img src="./disenno/mapas/pixel<%= getpixel("B35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A35')"><img src="./disenno/mapas/pixel<%= getpixel("A35" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>35</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J34')"><img src="./disenno/mapas/pixel<%= getpixel("J34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I34')"><img src="./disenno/mapas/pixel<%= getpixel("I34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H34')"><img src="./disenno/mapas/pixel<%= getpixel("H34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G34')"><img src="./disenno/mapas/pixel<%= getpixel("G34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F34')"><img src="./disenno/mapas/pixel<%= getpixel("F34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E34')"><img src="./disenno/mapas/pixel<%= getpixel("E34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D34')"><img src="./disenno/mapas/pixel<%= getpixel("D34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C34')"><img src="./disenno/mapas/pixel<%= getpixel("C34" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td>34</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J33')"><img src="./disenno/mapas/pixel<%= getpixel("J33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I33')"><img src="./disenno/mapas/pixel<%= getpixel("I33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H33')"><img src="./disenno/mapas/pixel<%= getpixel("H33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G33')"><img src="./disenno/mapas/pixel<%= getpixel("G33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F33')"><img src="./disenno/mapas/pixel<%= getpixel("F33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E33')"><img src="./disenno/mapas/pixel<%= getpixel("E33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D33')"><img src="./disenno/mapas/pixel<%= getpixel("D33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C33')"><img src="./disenno/mapas/pixel<%= getpixel("C33" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUENTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td>33</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J32')"><img src="./disenno/mapas/pixel<%= getpixel("J32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I32')"><img src="./disenno/mapas/pixel<%= getpixel("I32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H32')"><img src="./disenno/mapas/pixel<%= getpixel("H32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G32')"><img src="./disenno/mapas/pixel<%= getpixel("G32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F32')"><img src="./disenno/mapas/pixel<%= getpixel("F32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E32')"><img src="./disenno/mapas/pixel<%= getpixel("E32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D32')"><img src="./disenno/mapas/pixel<%= getpixel("D32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C32')"><img src="./disenno/mapas/pixel<%= getpixel("C32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B32')"><img src="./disenno/mapas/pixel<%= getpixel("B32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A32')"><img src="./disenno/mapas/pixel<%= getpixel("A32" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>32</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J31')"><img src="./disenno/mapas/pixel<%= getpixel("J31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I31')"><img src="./disenno/mapas/pixel<%= getpixel("I31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H31')"><img src="./disenno/mapas/pixel<%= getpixel("H31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G31')"><img src="./disenno/mapas/pixel<%= getpixel("G31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F31')"><img src="./disenno/mapas/pixel<%= getpixel("F31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E31')"><img src="./disenno/mapas/pixel<%= getpixel("E31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D31')"><img src="./disenno/mapas/pixel<%= getpixel("D31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C31')"><img src="./disenno/mapas/pixel<%= getpixel("C31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B31')"><img src="./disenno/mapas/pixel<%= getpixel("B31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A31')"><img src="./disenno/mapas/pixel<%= getpixel("A31" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>31</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J30')"><img src="./disenno/mapas/pixel<%= getpixel("J30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I30')"><img src="./disenno/mapas/pixel<%= getpixel("I30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H30')"><img src="./disenno/mapas/pixel<%= getpixel("H30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G30')"><img src="./disenno/mapas/pixel<%= getpixel("G30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F30')"><img src="./disenno/mapas/pixel<%= getpixel("F30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E30')"><img src="./disenno/mapas/pixel<%= getpixel("E30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D30')"><img src="./disenno/mapas/pixel<%= getpixel("D30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C30')"><img src="./disenno/mapas/pixel<%= getpixel("C30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B30')"><img src="./disenno/mapas/pixel<%= getpixel("B30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A30')"><img src="./disenno/mapas/pixel<%= getpixel("A30" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>30</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J29')"><img src="./disenno/mapas/pixel<%= getpixel("J29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I29')"><img src="./disenno/mapas/pixel<%= getpixel("I29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H29')"><img src="./disenno/mapas/pixel<%= getpixel("H29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G29')"><img src="./disenno/mapas/pixel<%= getpixel("G29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F29')"><img src="./disenno/mapas/pixel<%= getpixel("F29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E29')"><img src="./disenno/mapas/pixel<%= getpixel("E29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D29')"><img src="./disenno/mapas/pixel<%= getpixel("D29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C29')"><img src="./disenno/mapas/pixel<%= getpixel("C29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B29')"><img src="./disenno/mapas/pixel<%= getpixel("B29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A29')"><img src="./disenno/mapas/pixel<%= getpixel("A29" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>29</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J28')"><img src="./disenno/mapas/pixel<%= getpixel("J28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I28')"><img src="./disenno/mapas/pixel<%= getpixel("I28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H28')"><img src="./disenno/mapas/pixel<%= getpixel("H28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G28')"><img src="./disenno/mapas/pixel<%= getpixel("G28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F28')"><img src="./disenno/mapas/pixel<%= getpixel("F28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E28')"><img src="./disenno/mapas/pixel<%= getpixel("E28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D28')"><img src="./disenno/mapas/pixel<%= getpixel("D28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C28')"><img src="./disenno/mapas/pixel<%= getpixel("C28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B28')"><img src="./disenno/mapas/pixel<%= getpixel("B28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A28')"><img src="./disenno/mapas/pixel<%= getpixel("A28" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>28</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J27')"><img src="./disenno/mapas/pixel<%= getpixel("J27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I27')"><img src="./disenno/mapas/pixel<%= getpixel("I27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H27')"><img src="./disenno/mapas/pixel<%= getpixel("H27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G27')"><img src="./disenno/mapas/pixel<%= getpixel("G27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F27')"><img src="./disenno/mapas/pixel<%= getpixel("F27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E27')"><img src="./disenno/mapas/pixel<%= getpixel("E27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D27')"><img src="./disenno/mapas/pixel<%= getpixel("D27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C27')"><img src="./disenno/mapas/pixel<%= getpixel("C27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B27')"><img src="./disenno/mapas/pixel<%= getpixel("B27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A27')"><img src="./disenno/mapas/pixel<%= getpixel("A27" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>27</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
                  <td><a href="javascript:pick('J26')"><img src="./disenno/mapas/pixel<%= getpixel("J26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I26')"><img src="./disenno/mapas/pixel<%= getpixel("I26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H26')"><img src="./disenno/mapas/pixel<%= getpixel("H26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G26')"><img src="./disenno/mapas/pixel<%= getpixel("G26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F26')"><img src="./disenno/mapas/pixel<%= getpixel("F26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E26')"><img src="./disenno/mapas/pixel<%= getpixel("E26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D26')"><img src="./disenno/mapas/pixel<%= getpixel("D26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C26')"><img src="./disenno/mapas/pixel<%= getpixel("C26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B26')"><img src="./disenno/mapas/pixel<%= getpixel("B26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A26')"><img src="./disenno/mapas/pixel<%= getpixel("A26" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>26</td>
                </tr>
                <tr>
                  <td><a href="javascript:pick('J25')"><img src="./disenno/mapas/pixel<%= getpixel("J25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('I25')"><img src="./disenno/mapas/pixel<%= getpixel("I25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('H25')"><img src="./disenno/mapas/pixel<%= getpixel("H25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G25')"><img src="./disenno/mapas/pixel<%= getpixel("G25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F25')"><img src="./disenno/mapas/pixel<%= getpixel("F25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E25')"><img src="./disenno/mapas/pixel<%= getpixel("E25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D25')"><img src="./disenno/mapas/pixel<%= getpixel("D25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C25')"><img src="./disenno/mapas/pixel<%= getpixel("C25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B25')"><img src="./disenno/mapas/pixel<%= getpixel("B25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A25')"><img src="./disenno/mapas/pixel<%= getpixel("A25" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>25</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                <tr>
				<td><a href="javascript:pick('J24')"><img src="./disenno/mapas/pixel<%= getpixel("J24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('I24')"><img src="./disenno/mapas/pixel<%= getpixel("I24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('H24')"><img src="./disenno/mapas/pixel<%= getpixel("H24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G24')"><img src="./disenno/mapas/pixel<%= getpixel("G24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F24')"><img src="./disenno/mapas/pixel<%= getpixel("F24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E24')"><img src="./disenno/mapas/pixel<%= getpixel("E24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D24')"><img src="./disenno/mapas/pixel<%= getpixel("D24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C24')"><img src="./disenno/mapas/pixel<%= getpixel("C24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B24')"><img src="./disenno/mapas/pixel<%= getpixel("B24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A24')"><img src="./disenno/mapas/pixel<%= getpixel("A24" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>24</td>
                </tr>
                <tr>
				<td><a href="javascript:pick('J23')"><img src="./disenno/mapas/pixel<%= getpixel("J23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('I23')"><img src="./disenno/mapas/pixel<%= getpixel("I23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
				<td><a href="javascript:pick('H23')"><img src="./disenno/mapas/pixel<%= getpixel("H23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('G23')"><img src="./disenno/mapas/pixel<%= getpixel("G23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('F23')"><img src="./disenno/mapas/pixel<%= getpixel("F23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('E23')"><img src="./disenno/mapas/pixel<%= getpixel("E23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('D23')"><img src="./disenno/mapas/pixel<%= getpixel("D23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('C23')"><img src="./disenno/mapas/pixel<%= getpixel("C23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('B23')"><img src="./disenno/mapas/pixel<%= getpixel("B23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td><a href="javascript:pick('A23')"><img src="./disenno/mapas/pixel<%= getpixel("A23" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                  <td>23</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr align="center">
				  <td width="9%">J</td>
				  <td width="9%">I</td>
				  <td width="9%">H</td>
                    <td width="9%">G</td>
                    <td width="9%">F</td>
                    <td width="9%">E</td>
                    <td width="9%">D</td>
                    <td width="9%">C</td>
                    <td width="9%">B</td>
                    <td width="14%">A</td>
                    <td width="5%">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <br>
      </td>
	  
	  <td width="27" valign="bottom"><br>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
                <td><img src="./disenno/mapas/pixel.gif" width="55" height="1">&nbsp;</td>
        </tr>
      </table></td>

          <td width="490">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="5%">&nbsp;</td>
                <td width="10%">A</td>
                <td width="10%">B</td>
                <td width="10%">C</td>
                <td width="10%">D</td>
                <td width="10%">E</td>
                <td width="10%">F</td>
                <td width="10%">G</td>
                <td width="10%">H</td>
               
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="6" cellpadding="0">		
			  <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                  <tr>
                    <td>22</td>
                    <td><a href="javascript:pick('A22')"><img src="./disenno/mapas/pixel<%= getpixel("A22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('B22')"><img src="./disenno/mapas/pixel<%= getpixel("B22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('C22')"><img src="./disenno/mapas/pixel<%= getpixel("C22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('D22')"><img src="./disenno/mapas/pixel<%= getpixel("D22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('E22')"><img src="./disenno/mapas/pixel<%= getpixel("E22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('F22')"><img src="./disenno/mapas/pixel<%= getpixel("F22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('G22')"><img src="./disenno/mapas/pixel<%= getpixel("G22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('H22')"><img src="./disenno/mapas/pixel<%= getpixel("H22" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    
                  </tr>
                  <tr>
                    <td>21</td>
                    <td><a href="javascript:pick('A21')"><img src="./disenno/mapas/pixel<%= getpixel("A21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('B21')"><img src="./disenno/mapas/pixel<%= getpixel("B21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('C21')"><img src="./disenno/mapas/pixel<%= getpixel("C21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('D21')"><img src="./disenno/mapas/pixel<%= getpixel("D21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('E21')"><img src="./disenno/mapas/pixel<%= getpixel("E21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('F21')"><img src="./disenno/mapas/pixel<%= getpixel("F21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('G21')"><img src="./disenno/mapas/pixel<%= getpixel("G21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    <td><a href="javascript:pick('H21')"><img src="./disenno/mapas/pixel<%= getpixel("H21" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a></td>
                    
                  </tr>
                </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>20</td>
                      <td><a href="javascript:pick('A20')"><img src="./disenno/mapas/pixel<%= getpixel("A20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B20')"><img src="./disenno/mapas/pixel<%= getpixel("B20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C20')"><img src="./disenno/mapas/pixel<%= getpixel("C20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D20')"><img src="./disenno/mapas/pixel<%= getpixel("D20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E20')"><img src="./disenno/mapas/pixel<%= getpixel("E20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F20')"><img src="./disenno/mapas/pixel<%= getpixel("F20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G20')"><img src="./disenno/mapas/pixel<%= getpixel("G20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H20')"><img src="./disenno/mapas/pixel<%= getpixel("H20" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                     
                    </tr>
                    <tr> 
                      <td>19</td>
                      <td><a href="javascript:pick('A19')"><img src="./disenno/mapas/pixel<%= getpixel("A19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B19')"><img src="./disenno/mapas/pixel<%= getpixel("B19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C19')"><img src="./disenno/mapas/pixel<%= getpixel("C19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D19')"><img src="./disenno/mapas/pixel<%= getpixel("D19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E19')"><img src="./disenno/mapas/pixel<%= getpixel("E19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F19')"><img src="./disenno/mapas/pixel<%= getpixel("F19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G19')"><img src="./disenno/mapas/pixel<%= getpixel("G19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H19')"><img src="./disenno/mapas/pixel<%= getpixel("H19" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                     
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>18</td>
                      <td><a href="javascript:pick('A18')"><img src="./disenno/mapas/pixel<%= getpixel("A18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B18')"><img src="./disenno/mapas/pixel<%= getpixel("B18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C18')"><img src="./disenno/mapas/pixel<%= getpixel("C18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D18')"><img src="./disenno/mapas/pixel<%= getpixel("D18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E18')"><img src="./disenno/mapas/pixel<%= getpixel("E18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F18')"><img src="./disenno/mapas/pixel<%= getpixel("F18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G18')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H18')"><img src="./disenno/mapas/pixel<%= getpixel("H18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                     
                    </tr>
                    <tr> 
                      <td>17</td>
                      <td><a href="javascript:pick('A17')"><img src="./disenno/mapas/pixel<%= getpixel("A17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B17')"><img src="./disenno/mapas/pixel<%= getpixel("B17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C17')"><img src="./disenno/mapas/pixel<%= getpixel("C17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D17')"><img src="./disenno/mapas/pixel<%= getpixel("D17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E17')"><img src="./disenno/mapas/pixel<%= getpixel("E17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F17')"><img src="./disenno/mapas/pixel<%= getpixel("F17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G17')"><img src="./disenno/mapas/pixel<%= getpixel("G17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H17')"><img src="./disenno/mapas/pixel<%= getpixel("H17" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>16</td>
                      <td><a href="javascript:pick('A16')"><img src="./disenno/mapas/pixel<%= getpixel("A16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B16')"><img src="./disenno/mapas/pixel<%= getpixel("B16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C16')"><img src="./disenno/mapas/pixel<%= getpixel("C16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D16')"><img src="./disenno/mapas/pixel<%= getpixel("D16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E16')"><img src="./disenno/mapas/pixel<%= getpixel("E16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F16')"><img src="./disenno/mapas/pixel<%= getpixel("F16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G16')"><img src="./disenno/mapas/pixel<%= getpixel("G16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H16')"><img src="./disenno/mapas/pixel<%= getpixel("H16" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                    <tr> 
                      <td>15</td>
                      <td><a href="javascript:pick('A15')"><img src="./disenno/mapas/pixel<%= getpixel("A15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B15')"><img src="./disenno/mapas/pixel<%= getpixel("B15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C15')"><img src="./disenno/mapas/pixel<%= getpixel("C15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D15')"><img src="./disenno/mapas/pixel<%= getpixel("D15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E15')"><img src="./disenno/mapas/pixel<%= getpixel("E15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F15')"><img src="./disenno/mapas/pixel<%= getpixel("F15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G15')"><img src="./disenno/mapas/pixel<%= getpixel("G15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H15')"><img src="./disenno/mapas/pixel<%= getpixel("H15" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>14</td>
                      <td><a href="javascript:pick('A14')"><img src="./disenno/mapas/pixel<%= getpixel("A14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B14')"><img src="./disenno/mapas/pixel<%= getpixel("B14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C14')"><img src="./disenno/mapas/pixel<%= getpixel("C14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D14')"><img src="./disenno/mapas/pixel<%= getpixel("D14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E14')"><img src="./disenno/mapas/pixel<%= getpixel("E14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F14')"><img src="./disenno/mapas/pixel<%= getpixel("F14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G14')"><img src="./disenno/mapas/pixel<%= getpixel("G14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H14')"><img src="./disenno/mapas/pixel<%= getpixel("H14" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                    <tr> 
                      <td>13</td>
                      <td><a href="javascript:pick('A13')"><img src="./disenno/mapas/pixel<%= getpixel("A13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B13')"><img src="./disenno/mapas/pixel<%= getpixel("B13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C13')"><img src="./disenno/mapas/pixel<%= getpixel("C13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D13')"><img src="./disenno/mapas/pixel<%= getpixel("D13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E13')"><img src="./disenno/mapas/pixel<%= getpixel("E13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F13')"><img src="./disenno/mapas/pixel<%= getpixel("F13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G13')"><img src="./disenno/mapas/pixel<%= getpixel("G13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H13')"><img src="./disenno/mapas/pixel<%= getpixel("H13" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                     
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>12</td>
                      <td><a href="javascript:pick('A12')"><img src="./disenno/mapas/pixel<%= getpixel("A12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B12')"><img src="./disenno/mapas/pixel<%= getpixel("B12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C12')"><img src="./disenno/mapas/pixel<%= getpixel("C12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D12')"><img src="./disenno/mapas/pixel<%= getpixel("D12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E12')"><img src="./disenno/mapas/pixel<%= getpixel("E12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F12')"><img src="./disenno/mapas/pixel<%= getpixel("F12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G12')"><img src="./disenno/mapas/pixel<%= getpixel("G12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H12')"><img src="./disenno/mapas/pixel<%= getpixel("H12" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                     
                    </tr>
                    <tr> 
                      <td>11</td>
                      <td><a href="javascript:pick('A11')"><img src="./disenno/mapas/pixel<%= getpixel("A11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B11')"><img src="./disenno/mapas/pixel<%= getpixel("B11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C11')"><img src="./disenno/mapas/pixel<%= getpixel("C11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D11')"><img src="./disenno/mapas/pixel<%= getpixel("D11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E11')"><img src="./disenno/mapas/pixel<%= getpixel("E11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F11')"><img src="./disenno/mapas/pixel<%= getpixel("F11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G11')"><img src="./disenno/mapas/pixel<%= getpixel("G11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H11')"><img src="./disenno/mapas/pixel<%= getpixel("H11" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>10</td>
                      <td><a href="javascript:pick('A10')"><img src="./disenno/mapas/pixel<%= getpixel("A10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B10')"><img src="./disenno/mapas/pixel<%= getpixel("B10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C10')"><img src="./disenno/mapas/pixel<%= getpixel("C10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D10')"><img src="./disenno/mapas/pixel<%= getpixel("D10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E10')"><img src="./disenno/mapas/pixel<%= getpixel("E10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F10')"><img src="./disenno/mapas/pixel<%= getpixel("F10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G10')"><img src="./disenno/mapas/pixel<%= getpixel("G10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H10')"><img src="./disenno/mapas/pixel<%= getpixel("H10" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                    <tr> 
                      <td>09</td>
                      <td><a href="javascript:pick('A09')"><img src="./disenno/mapas/pixel<%= getpixel("A09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B09')"><img src="./disenno/mapas/pixel<%= getpixel("B09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C09')"><img src="./disenno/mapas/pixel<%= getpixel("C09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D09')"><img src="./disenno/mapas/pixel<%= getpixel("D09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E09')"><img src="./disenno/mapas/pixel<%= getpixel("E09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F09')"><img src="./disenno/mapas/pixel<%= getpixel("F09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G09')"><img src="./disenno/mapas/pixel<%= getpixel("G09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H09')"><img src="./disenno/mapas/pixel<%= getpixel("H09" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>08</td>
                      <td><a href="javascript:pick('A08')"><img src="./disenno/mapas/pixel<%= getpixel("A08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B08')"><img src="./disenno/mapas/pixel<%= getpixel("B08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C08')"><img src="./disenno/mapas/pixel<%= getpixel("C08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D08')"><img src="./disenno/mapas/pixel<%= getpixel("D08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E08')"><img src="./disenno/mapas/pixel<%= getpixel("E08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F08')"><img src="./disenno/mapas/pixel<%= getpixel("F08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G08')"><img src="./disenno/mapas/pixel<%= getpixel("G08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H08')"><img src="./disenno/mapas/pixel<%= getpixel("H08" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                    <tr> 
                      <td>07</td>
                      <td><a href="javascript:pick('A07')"><img src="./disenno/mapas/pixel<%= getpixel("A07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B07')"><img src="./disenno/mapas/pixel<%= getpixel("B07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C07')"><img src="./disenno/mapas/pixel<%= getpixel("C07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D07')"><img src="./disenno/mapas/pixel<%= getpixel("D07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E07')"><img src="./disenno/mapas/pixel<%= getpixel("E07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F07')"><img src="./disenno/mapas/pixel<%= getpixel("F07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G07')"><img src="./disenno/mapas/pixel<%= getpixel("G07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H07')"><img src="./disenno/mapas/pixel<%= getpixel("H07" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>06</td>
                      <td><a href="javascript:pick('A06')"><img src="./disenno/mapas/pixel<%= getpixel("A06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B06')"><img src="./disenno/mapas/pixel<%= getpixel("B06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C06')"><img src="./disenno/mapas/pixel<%= getpixel("C06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D06')"><img src="./disenno/mapas/pixel<%= getpixel("D06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E06')"><img src="./disenno/mapas/pixel<%= getpixel("E06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F06')"><img src="./disenno/mapas/pixel<%= getpixel("F06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G06')"><img src="./disenno/mapas/pixel<%= getpixel("G06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H06')"><img src="./disenno/mapas/pixel<%= getpixel("H06" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
                    <tr> 
                      <td>05</td>
                      <td><a href="javascript:pick('A05')"><img src="./disenno/mapas/pixel<%= getpixel("A05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B05')"><img src="./disenno/mapas/pixel<%= getpixel("B05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C05')"><img src="./disenno/mapas/pixel<%= getpixel("C05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D05')"><img src="./disenno/mapas/pixel<%= getpixel("D05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E05')"><img src="./disenno/mapas/pixel<%= getpixel("E05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F05')"><img src="./disenno/mapas/pixel<%= getpixel("F05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G05')"><img src="./disenno/mapas/pixel<%= getpixel("G05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H05')"><img src="./disenno/mapas/pixel<%= getpixel("H05" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                     
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>04</td>
                      <td><a href="javascript:pick('A04')"><img src="./disenno/mapas/pixel<%= getpixel("A04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B04')"><img src="./disenno/mapas/pixel<%= getpixel("B04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C04')"><img src="./disenno/mapas/pixel<%= getpixel("C04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D04')"><img src="./disenno/mapas/pixel<%= getpixel("D04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E04')"><img src="./disenno/mapas/pixel<%= getpixel("E04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F04')"><img src="./disenno/mapas/pixel<%= getpixel("F04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G04')"><img src="./disenno/mapas/pixel<%= getpixel("G04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H04')"><img src="./disenno/mapas/pixel<%= getpixel("H04" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
					                    <tr> 
                      <td>03</td>
                      <td><a href="javascript:pick('A03')"><img src="./disenno/mapas/pixel<%= getpixel("A03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B03')"><img src="./disenno/mapas/pixel<%= getpixel("B03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C03')"><img src="./disenno/mapas/pixel<%= getpixel("C03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D03')"><img src="./disenno/mapas/pixel<%= getpixel("D03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E03')"><img src="./disenno/mapas/pixel<%= getpixel("E03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F03')"><img src="./disenno/mapas/pixel<%= getpixel("F03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G03')"><img src="./disenno/mapas/pixel<%= getpixel("G03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H03')"><img src="./disenno/mapas/pixel<%= getpixel("H03" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>

                  </table></td>
              </tr>
			  
			                <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                      <td>02</td>
                      <td><a href="javascript:pick('A02')"><img src="./disenno/mapas/pixel<%= getpixel("A02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B02')"><img src="./disenno/mapas/pixel<%= getpixel("B02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C02')"><img src="./disenno/mapas/pixel<%= getpixel("C02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D02')"><img src="./disenno/mapas/pixel<%= getpixel("D02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E02')"><img src="./disenno/mapas/pixel<%= getpixel("E02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F02')"><img src="./disenno/mapas/pixel<%= getpixel("F02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G02')"><img src="./disenno/mapas/pixel<%= getpixel("G02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H02')"><img src="./disenno/mapas/pixel<%= getpixel("H02" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      
                    </tr>
					                    <tr> 
                      <td>01</td>
                      <td><a href="javascript:pick('A01')"><img src="./disenno/mapas/pixel<%= getpixel("A01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('B01')"><img src="./disenno/mapas/pixel<%= getpixel("B01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('C01')"><img src="./disenno/mapas/pixel<%= getpixel("C01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('D01')"><img src="./disenno/mapas/pixel<%= getpixel("D01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('E01')"><img src="./disenno/mapas/pixel<%= getpixel("E01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('F01')"><img src="./disenno/mapas/pixel<%= getpixel("F01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('G01')"><img src="./disenno/mapas/pixel<%= getpixel("G01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                      <td><a href="javascript:pick('H01')"><img src="./disenno/mapas/pixel<%= getpixel("H01" , posiciones, tipo)  %>.gif" width="45" height="15" border="0"></a></td>
                     
                    </tr>

                  </table></td>
              </tr>              			  
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td width="5%">&nbsp;</td>
                <td width="10%">A</td>
                <td width="10%">B</td>
                <td width="10%">C</td>
                <td width="10%">D</td>
                <td width="10%">E</td>
                <td width="10%">F</td>
                <td width="10%">G</td>
                <td width="10%">H</td>
              </tr>
            </table> 
      <br>
          </td>
  </tr>
</table>
</table>
<a href="javascript:pick('G18')"><img src="./disenno/mapas/pixel<%= getpixel("G18" , posiciones, tipo)  %>.gif" width="45" height="15" border="0" /></a>