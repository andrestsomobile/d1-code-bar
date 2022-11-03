	<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %> 
	
	 <td>Cliente
    <td><html:text property="clientefacturacion" readonly="true" styleClass="readonly" size="7" />  
    
       <%	 
    String[] parametros_cia = new String[] {  "0", ""};
	String[] parametros_total_cia = new String[] {""};
	String[] campos_form_cia= new String[] {"clientefacturacion" };
	String[] campos_pick_cia = new String[] {"clifcodsx"};
	String[] campos_entity_cia= new String[] {"clifcodsx", "clifnombre", "clifnit", "clifdireccion"};
	String[] nombres_campos_entity_cia= new String[] {"Codigo", "Nombre", "NIT" ,"Direccion"};
	String formulario_cia = "reportesForm";  
	String metodo_cia = "getlistacliente_facturacion"; 
	String metodoTotal_cia = "getTotalPaginaslistacliente_facturacion";
	%> <%@ taglib uri="/WEB-INF/popup.tld"  prefix="popup"%> 
	<popup:boton clase="facturacion.control.gstcliente_facturacion" entidad="facturacion.entity.cliente_facturacion"
			formulario="<%=formulario_cia %>" metodo="<%=metodo_cia %>"
			metodo_total="<%=metodoTotal_cia %>"
			parametros="<%= parametros_cia %>" campos_form="<%= campos_form_cia %>"
			campos_pick="<%= campos_pick_cia %>"
			parametros_total="<%= parametros_total_cia %>" 
			campos_entity="<%= campos_entity_cia %>" nombres_campos_entity="<%= nombres_campos_entity_cia %>" /> 
    
    
    *<html:errors property="clientefacturacion"  /> 