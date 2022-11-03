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
    <td align= "center"><table border="0" align="center" cellpadding="0" cellspacing="3" >
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla_mapa">
                    <tr> 
                     <td><A href="javascript:pick('UNICA')"> <img src="./disenno/mapas/pixel<%= getpixel("UNICA" , posiciones, tipo)  %>.gif" width="139" height="150"  border="0"> 
                        </A></td>

                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      
      </table></table>