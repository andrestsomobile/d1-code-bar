<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="administracion.control.gstpermiso,maestro.control.*, maestro.entity.*, registro.form.registro_pedidoForm"%>

<html>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
registro_pedidoForm entf = (registro_pedidoForm)request.getAttribute("registro_pedidoForm");
String Codsx = entf.getrepecodsx();
System.out.print("CODSX(entrada_datos)-->"+Codsx);
String empleado = entf.getrepeempleado();
/*String compania = entf.getentcompania();
System.out.print("COMPANIA(entrada_datos)-->"+compania);
gstcompania gcom = new gstcompania();*/
%>

<div class="titulo">Gestion de Pedidos Registrados </div>
<br>
<html:form action="registro_pedidoAction.do?app=registro&modulo=registro_pedidos_datos" method="post">
	<html:hidden property="opcion" />
	<table align="center" border="0" width='80%' cellpadding="3" cellspacing="0" class="tabla_datos">



		<tr>
			<td>Codigo
			<td><html:text property="repecodsx" readonly="true" styleClass="readonly" />* <html:errors
				property="repecodsx" />
                        <td>Fecha Sistema
                        <td><html:text property="repefecha" readonly="true" styleClass="readonly" />* <html:errors
				property="repefecha" />
                </tr>
                <tr>
                    <td>Empleado
                <html:hidden property="repeempleado" />
                <td><html:text property="repeempleado" readonly="true" styleClass="readonly" value='<%=new gstempleado().getempleado(empleado).getempnombre() %>'></html:text>*

                
             
                       <td>Estado
                       <td colspan="1" >
                           <%if(entf==null) { %> <html:text property="repeesta" value="TRAMITE" readonly="true" styleClass="readonly"/>
      <% } else if(entf.getrepeesta().equals("TRAMITE")) { %> <html:select property="repeesta"  > <html:option value="TRAMITE">TRAMITE</html:option>
          <html:option value="FINALIZADO">FINALIZADO</html:option> </html:select>
      <% } else {%> <html:text property="repeesta" value="FINALIZADO" readonly="true" styleClass="readonly"/>
      <%
  	//coloco el enlace con permiso de administracion para que lo active:
	if(gstpermiso.getAdministracion(session, "util", "registro_pedido_datos.jsp") ) {
  %> <a href="registro_pedidoAction.do?opcion=activar&codsx=<%= entf.getrepeesta()  %>">
      </a> <% } } %> <html:errors property="repeesta" />
                
                <tr>
                       <td>Hora Ingreso
		       <td><html:text property="repehoin" />* <html:errors
				property="repehoin" />

                       <td>Hora Salida
		       <td><html:text property="repehofi" />* <html:errors
				property="repehofi" />
                </tr>

                <tr>
                    <td colspan="4" align="center" >PEDIDOS PARA ALISTAR 
                </tr>
                
                                
                              
               

  <tr align="center">
  <%
  boolean tramite =entf==null  || (entf!=null && entf.getrepeesta().equals("TRAMITE"));

  %>

    <td colspan="4"> <%if(!gstpermiso.getEscritura(session, "registro_pedidos", "registro_pedidos_datos.jsp") && tramite  ){ %>
    <html:submit  value="Grabar"/> <% } %> <html:button  property="cancelar" value="Cancelar" onclick="window.location='main.jsp?app=util&modulo=registro_pedidos'" />


    <%if((gstpermiso.getAdministracion(session, "util", "registro_pedidos_datos.jsp") && !tramite  ) && !entf.getrepecodsx().equals("0")) { System.out.print("tramite->"+tramite);System.out.print("CODSX2->"+Codsx);%>
  </tr>
  <tr>
      <td colspan="4" align="center">
  	<a href="registro_pedidoAction.do?opcion=activar&repecodsx=<%= Codsx %>">ACTIVAR REGISTRO</a>
  <%} %>
  </tr>
	</table>
</html:form>
</html>
