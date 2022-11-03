<%@ page contentType="text/html; charset=iso-8859-1"
language="java"
import="patio.entity.*,patio.control.*,java.util.*,archivo.control.*, archivo.entity.*, java.io.File, util.fecha"
%>
<%!
        gstentradapatio control= new gstentradapatio();
        gstdetalleentrada gentd = new gstdetalleentrada();
%>
<%
String devfechareal = request.getParameter("devfechareal");
ususistema us = (ususistema)session.getAttribute("ususistema");
String usu_cliente =null;
if(us.getusigrupo().equals("CL")) {
        usu_cliente = new gstpersona().getpersona(us.getusicodper()).getpercodcia();
}
entradapatio entity =null;
String epcodsx = request.getParameter("codsx");
if(epcodsx!=null) entity = control.getentradapatio(epcodsx);
%>

<div class="subtitulo">Entrada de Vehiculos </div>
<%
        ususistema  entidad_ususistema =  (ususistema)session.getAttribute("ususistema");
        //si es administrador lo dejo eliminar esta entrada:
        if(entidad_ususistema.getusigrupo().equals("AG") && entity!=null && entity.getepcerrado().equals("S")) {
%>
<br><div align='center' class='fuente'>
 Administrador:<br>
<a href="javascript:showList('main2.jsp?app=patio&ruta_pagina=/activacionentrada.jsp?epcodsx=<%=epcodsx%>',400,150, 550,200) ">Activar Entrada Patios</a>

</div><br>

<%
        }
       if(entidad_ususistema.getusigrupo().equals("AG") && entity!=null && entity.getepcerrado().equals("N")) {
%>
 Administrador:<br>
<a href='patiocontroller?modulo=eliminar_entradapatio&opcion=activar&epcodsx=<%=epcodsx%>'>Eliminar Entrada Patios</a>

<%
}
%>
<form name="frmmain" action="patiocontroller" method="post" men_validacion="Esta a punto de registrar los datos. Confirme que desea hacerlo" onSubmit="return validacionFormulario(this)">
    <input type="hidden" name="modulo" value="entradapatio"  id="modulo">
         <input type="hidden" name="app" value="patio" >
                  <input type="hidden" name="detallemov" id="detallemov" >
  <table  align="center" cellpadding="2" cellspacing="0"  style="font-size:11px;" class='tabla'>
    <%if(usu_cliente==null) {%>
    <tr> 
      <td colspan="4"> <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td ><a href="main.jsp?app=patio&modulo=entradapatio">Nuevo</a></td>
            <td><div align="right"><a href="main.jsp?app=patio&modulo=entradapatio">Cancelar</a></div></td>
          </tr>
        </table></td>
    <tr align="right" style="font-size:12px;color:#000066"> 
      <td colspan="4"> <div align="right"><a title="Click Aqui para ver la ayuda general "href="javascript:showayuda('30', 450, 200, 100,100);">Ver Mas</a> </div></td>
    </tr>
    <%} %>
    <tr> 
      <td>Empresa</td>
      <td width="227" > <input style="background-color:#eeeeee" name="epcodcia" readonly="true" type="text" value="<%= entity!=null?entity.getepcodcia():usu_cliente!=null?usu_cliente:""  %>" size="5"    validacion="R" men_validacion="usuario " > 
        <textarea style="background-color:#eeeeee" readonly name="epcodciadesc" cols="15" rows="2" ><%= entity!=null?new gstusuario().getusuario(entity.getepcodcia()).getusunombre():usu_cliente!=null?new gstusuario().getusuario(usu_cliente).getusunombre():""%></textarea> 
        <% if(usu_cliente==null) { if(entity==null) {%> <a href="javascript:showList('lista.jsp?app=archivo&modulo=usuario&estado=AC&usupatio=S&campo=epcodcia&nombre=epcodciadesc')"><img alt='Buscar Empresa' src="/zona/disenno/im_menus/search.jpg" width="25" height="22" border="0"></a> 
        <%} }%> 
      <td colspan="2"> <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
          <tr> 
            <td> Entrada: 
              <input style="background-color:#eeeeee" name="epcodsx" type="text" size="8" readonly="true" value='<%= entity!=null?entity.getepcodsx():""%>'> 
              <%if(entity==null) {%> <a href="#" onClick="javascript:if(document.frmmain.epcodcia.value=='') alert('Debe escoger la compañia');
                           else showList('lista.jsp?app=patio&modulo=entradapatio&campo=epcodsx&usucodsx='+document.frmmain.epcodcia.value);"><img src="./disenno/im_menus/search.jpg" border="0" class="iconito"></a> 
              <%}%> </td>
            <td>Fecha Ingreso 
              <input style="background-color:#eeeeee" name="epfechaingreso" type="text"  readonly="true"
                value="<%=  entity!=null?entity.getepfechaingreso():util.fecha.getFecha() %>" size="16"    validacion="R" men_validacion="fechaingreso "       ></td>
          </tr>
        </table>
        <%if (entidad_ususistema.getusigrupo().equals("CL")) {%> <div align="right"><a href="javascript:showList('main2.jsp?app=ayuda&ruta_pagina=/manual.jsp&tipoManual=cliente#entradasVehiculos',600,450,100,100)">Ver mas...</a></div>
        <%}%> 
    <tr> 
      <td>Preingreso</td>
      <td> <input name="epnumpreingreso" type="hidden" id="epnumpreingreso" value="<%= entity!=null?entity.getepnumpreingreso():""%>"
        size="10" readonly=""    validacion="R" men_validacion="Numero del preingreso" > 
        <input name="epmovcamion" type="hidden" value="<%= entity!=null? entity.getepmovcamion():""%>"> 
        <%
        if(entity!=null) {
        bascula.entity.movcamion mv =  new bascula.control.gstmovcamion().getmovcamion(entity.getepmovcamion());
         out.print("Placa: "+ mv.getmvcamplaca() + " <br>Fecha:  " + mv.getmvcamfecha() + ":" + mv.getmvcamhora() +  "<br> Remolque:" + mv.getmvcamremolque());
        }
        %> <% if(usu_cliente==null) { if(entity==null) {%> <a href="#" onClick="javascript: if(document.frmmain.epcodcia.value=='') alert('Debe seleccionar el usuario'); else
                showList('main2.jsp?app=patio&ruta_pagina=/lista_preing_patio.jsp&campo=epnumpreingreso&usucodsx='+document.frmmain.epcodcia.value, 600, 200, 300,300);"><img src="disenno/im_menus/search.jpg" id="lupita"></a> 
        <%} }%> 
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:11px">
          <caption>
          <strong>Datos del PreIngreso </strong> 
          </caption>
          <tr> 
            <td width="13%">Tipo Doc:</td>
            <td width="44%"><input  style="background-color:#eeeeee" name="eptipodocumento" type="text" value="<%= entity!=null?entity.geteptipodocumento():""%>" size="2" readonly="true" > 
              <input style="background-color:#eeeeee"  name="eptipodocumentodesc" type="text"
                value="<%= entity!=null? new gstanexo().getanexo(entity.geteptipodocumento()).getanexdesc():""%>" size="20" readonly="true" > 
            </td>
            <td width="16%">Num Doc</td>
            <td width="27%"><input  name="epnumdocumento"style="background-color:#eeeeee" type="text" id="epnumdocumento3"
                value="<%= entity!=null?entity.getepnumdocumento():""%>" size="20" readonly="true" ></td>
          </tr>
          <tr> 
            <td>Transito:</td>
            <td><input  style="background-color:#eeeeee" name="eptipotransito" type="text"
                value="<%= entity!=null && entity.geteptipotransito() != null?entity.geteptipotransito():""%>" size="2" readonly="true" > 
              <input  name="eptipotransitodesc" type="text"
                value="<%= entity!=null && entity.geteptipotransito() != null  && !entity.geteptipotransito().equals("")?new gstanexo().getanexo(entity.geteptipotransito()).getanexdesc():""%>" size="20" readonly="true" style="background-color:#eeeeee" > 
            </td>
            <td>Num. Transito:</td>
            <td> <input  name="epnumtransito" type="text" style="background-color:#eeeeee"
                value="<%= entity!=null && entity.getepnumtransito()!=null? entity.getepnumtransito():""%>" size="20" readonly="true" ></td>
          </tr>
        </table>
    <tr> 
      <td width="57"> Auxiliar de Patio</td>
      <td> <input name="epauxiliarpatio"   type="hidden" value="<%= entity!=null?entity.getepauxiliarpatio():usu_cliente==null?new gstpersona().getpersona(us.getusicodper()).getpercodsx():""%>" size="30"        > 
        <input name="epauxiliarpatiodesc"  readonly='true' style="background-color:#eeeeee"
      type="text" value="<%= entity!=null? new gstpersona().getpersona(entity.getepauxiliarpatio()).getpernombre():usu_cliente==null?new gstpersona().getpersona(us.getusicodper()).getpernombre():""%>" size="30"        > 
      <td width="164"> Administrador de Patio de la Empresa 
      <td width="303"><input name="epadminpatiousuario" type="text" class="campoTabla"
      value="<%=entity!=null?entity.getepadminpatiousuario():""   %>" <%=entity!=null?"readonly='true'":""%> size="30"
       validacion="R" men_validacion="Debe ingresar el nombre del Administrador del patio por parte del usuario "       > 
    <tr> 
      <td width="57"> Observaci&oacute;n</td>
      <td colspan='2'><textarea name="epobservacion" rows="2" ><%=entity!=null?entity.getepobservacion():""   %></textarea> 
      <td> <strong>Total Veh&iacute;culos: </strong><%= entity!=null?control.getnumerovehiculosentrada(entity.getepcodsx()) :""%> <br> <strong>Saldo Veh&iacute;culos: </strong><%= entity!=null?control.getnumerovehiculosentrada(entity.getepcodsx(), "N") :""%> </tr>
    <tr>
      <td>Formulario</td>
      <%
      if(entity==null) {
      %>
      	<td colspan="2">&nbsp;
      <% 
      }
      else {
      bascula.control.gstpreingreso gpreing = new bascula.control.gstpreingreso();
      cliente.control.gstformulario gformul =  new cliente.control.gstformulario();
      
      bascula.entity.preingreso preing = gpreing.getpreingreso(  entity.getepnumpreingreso()  );
      
      if(preing.getpreingform()==null) {
    	  %>
    	  <td colspan="2">EL PREINGRESO AUN NO TIENE FORMULARIO
    	  <% 
    	  
      }else {
      
    	  cliente.entity.formulario form = gformul.getformulario( preing.getpreingform());
      %>
<td colspan='2'><table width="100%" border="1" cellspacing="0" cellpadding="0" style="font-size:11px;" class='tabla'>      
          <tr> 
            <th>Consecutivo</th>
            <th>Estado</th>
            <th>No. Aprobacion</th>
          </tr>
          <tr>
            <td><%= form.getfmconsec() %></td>
            <td><%= form.getfmestado() %></td>
            <td> <%= form.getfmconseczfp()==null ? "&nbsp;" : form.getfmconseczfp() %></td>
          </tr>
        </table>
        
        <% }   }  %>
      <td>&nbsp;</tr>
      
  </table>  
  <%
   if(usu_cliente==null) {
   %><br>
     <input name="enviar" type="submit" id="enviar" value="GUARDAR"
          <%= entity!=null && entity.getepcerrado().equals("S")?"style='display:none'":""%>>
        &nbsp;&nbsp; <input name="opcion" type="submit" id="opcion" value="FINALIZAR ENTRADA"
<%= entity!=null && entity.getepcerrado().equals("S")?"style='display:none'":""%>>
<%
                 }
%>
</form>
 
 
  <%
if(entity!=null) {
%>

        <%
        if(entity!=null && !entity.getepcerrado().equals("S") && usu_cliente==null) {
        %>
<br>

 <table align="right" border="1" cellpadding="0" cellspacing="0"> <caption><b>Importar Desde un Excel
 
<a title="Click Aqui para ver la ayuda general "href="javascript:showayuda('96', 750, 600, 100,100);">Ejemplo</a>

 
 <b></caption>
 	<tr><td>
 	<form name="formimport" method="post" action="patiocontroller?modulo=importar&app=patio&ruta_server=<%= application.getRealPath(File.separator+File.separator) %>&entrada=<%=entity.getepcodsx()%>" enctype='multipart/form-data'  >
         
         
<input type="file" name="archivo">

<input type="submit" value="Importar" name="importar">
 </form>	
 </table>
<br><br><br><br>
<% } %>
<div align="center"> <strong>Vehiculos en la Entrada </strong> </div>
      
	  	<div align="right"><a title="Click Aqui para ver la ayuda general "href="javascript:showayuda('31', 450, 200, 100,100);">Ver Mas</a>
	      </div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px;color:#000066">
  <tr>
        <th >No.</th>
      <th>Chasis</th>
      <th>Marca</th>
      <th>Color</th>
      <th>Material</th>
      <th>Fecha Entrada Real</th>
      <th>Inconsistencia</th>
           
    <th>Modo Ingreso</th>
    <th>Tipo Ingreso</th>
    <th>Operaci&oacute;n</th>
  </tr>
           <%
   if(usu_cliente==null) {
   %>
        <%
        if(entity!=null && !entity.getepcerrado().equals("S")) {
        %>
 
 
<form name="form0" method="post" action="patiocontroller" men_validacion="Seguro desea REGISTRAR el vehiculo?" onSubmit="return validacionFormulario(this)">
    <input type="hidden" name="modulo" value="entrada_vehiculo" >
         <input type="hidden" name="app" value="patio" >
<input name="deventrada" type="hidden" value="<%=entity.getepcodsx()%>">
    <tr>
    	<td></td>
      <td><input name="devnumchasis" Checked='true' selected='true' focus(); type="text" size="18" validacion="R" men_validacion="Debe ingresar el Numero del Chasis"></td>
      <td> <input name="devmarca" type="text" size="8" ></td>
      <td><input name="devcolor" type="text" size="8" ></td>
      <td><input name="devmodelo" type="text" size="8" ></td>
      <td nowrap="nowrap">
         <input name="devfechareal" fecha="devfechareal" type="text" size="10" readonly validacion="R" men_validacion="La fecha es requerida" value="<%=(devfechareal==null)?(""):(devfechareal)%>">
         <a href="javascript:show_calendar('form0.devfechareal');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
   	     <img alt='Seleccionar Fecha' src="./disenno/im_menus/calendar3.gif" width="21" height="19" border="0"></a> 
      </td>

      <td> <input name="devinconsistencia" type="text" value="" size="25"></td>
          <td> <input name="devmodoing" type="radio" value="V" checked>
        Ni&ntilde; <br>
        <input name="devmodoing" type="radio" value="R">
        Rod
         <td>        <input type="radio" name="devtipoing" value="I" checked >
        Imp <br>
        <input type="radio" name="devtipoing" value="A" >
        Alm
      <td> <input name="opcion" type="submit" value="Agregar"></td>
    </tr>
  </form>
<%
}
}
 
        //listo los vehiculos que este man tenga:
        Collection lista = gentd.getlistadetalleentrada(entity.getepcodsx());
        Iterator ite = lista.iterator();
        int i=0;
        while(ite.hasNext()) {
        detalleentrada de = (detalleentrada)ite.next();
%>
<form name="form1_<%=i%>" method="post" action="patiocontroller" onSubmit="return validacionFormulario(this)">
   <input name="deventrada" type="hidden" value="<%=entity.getepcodsx()%>">
   <input type="hidden" name="modulo" value="entrada_vehiculo" >
   <input type="hidden" name="app" value="patio" >
   <input name="devcodsx" type="hidden" value="<%=de.getdevcodsx()%>">
   <input name="deventrada" type="hidden" value="<%=de.getdeventrada()%>">
    <tr>
        <td><%=++i%> </td>
       
      <td><input name="devnumchasis" type="text" size="18" value="<%= de.getdevnumchasis()%>" validacion="R" men_validacion="El número del chasis es un dato requerido"> </td>
      <td><input name="devmarca" type="text" size="8" value="<%= de.getdevmarca()%>"></td>
      <td><input name="devcolor" type="text" size="8" value="<%= de.getdevcolor()%>"></td>
      <td><input name="devmodelo" type="text" size="8" value="<%= de.getdevmodelo()%>"></td>
      <td nowrap="nowrap">
         <input name="devfechareal" fecha="devfechareal" type="text" size="10" readonly validacion="R" men_validacion="La fecha es requerida" value = '<%=de.getdevfechareal()!= null?fecha.getFecha_sin_hora(de.getdevfechareal()):""%>'>
         <a href="javascript:show_calendar('form1_<%=i-1%>.devfechareal');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
   	     <img alt='Seleccionar Fecha' src="./disenno/im_menus/calendar3.gif" width="21" height="19" border="0"></a> 
      </td>
      <td><input name="devinconsistencia" type="text" value="<%= de.getdevinconsistencia()%>" size="25"> </td>
    <td> <input name="devmodoing_<%=de.getdevcodsx()%>" type="radio" value="V" <%= de.getdevmodoing().equals("V")?"checked":""%>>
      Ni&ntilde; <br>
      <input name="devmodoing_<%=de.getdevcodsx()%>"  type="radio" value="R" <%= de.getdevmodoing().equals("R")?"checked":""%>>
      Rod
      <td> <input name="devtipoing_<%=de.getdevcodsx()%>" type="radio" value="I" <%= de.getdevtipoing().equals("I")?"checked":""%>>
      Imp <br>
      <input name="devtipoing_<%=de.getdevcodsx()%>"  type="radio" value="A" <%= de.getdevtipoing().equals("A")?"checked":""%>>
      Alm
    <td><input  name="opcion" type="submit" id="opcion" value="ACT" <%= usu_cliente !=null || (entity!=null && entity.getepcerrado().equals("S"))?"style='display:none'":""%>>
      <input name="opcion" type="submit" id="opcion" value="-" <%=  usu_cliente !=null || ( entity!=null && entity.getepcerrado().equals("S"))?"style='display:none'":""%>> </td>

  </form>  <%
    }
    %>
</table>
 
  <%
   
  //miro si quiere agregar:
 
}
%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>