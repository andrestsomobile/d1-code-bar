function validarDelete(url) {
	
	if(confirm('Seguro desea eliminar el registro deseado?')) 
		window.location=url;
}

function show_popup(pagina, width, height, left, top) {
	
 pagina = window.open("popup.jsp?pagina="+pagina ,  "width="+width+",height="+ height+",resizable=yes,scrollbars=yes,left="+left+",top="+top);

}

function showimprimir(width, height, left, top){
var r="";
 r = window.location + "";

ruta = r.substring(r.indexOf('?') +1 , r.charAt(r.length)=='#'? r.length -1 :r.length );

 pagina = window.open("imprimir.jsp?"+ruta, "pagina",  "width="+width+",height="+ height+",resizable=yes,scrollbars=yes,left="+left+",top="+top);

}



function showList(url, ancho, alto, izq, arr) {
  if(ancho && alto && izq && arr){
	sList = window.open(url, "lista", "width="+ancho+",height="+alto+",resizable=yes,scrollbars=yes,left="+izq+",top="+arr+"");
  }
  else{
	sList = window.open(url, "lista", "width=700,height=500,resizable=yes,scrollbars=yes,left=300,top=160");
  }
  sList.focus();
}

function showmapa(bodega, campo, formulario, procodsx, tipo) {
	window.open("mapa.jsp?bodega="+ bodega + "&campo="+ campo + "&formulario="+ formulario +"&procodsx=" + procodsx + "&tipo=" + tipo);
}

function imprimir() {
   var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
       sOption+="scrollbars=yes,width=850,height=650,left=25,top=25"; 

   var sWinHTML = document.getElementById('texto_ppal').innerHTML; 
   
   var winprint=window.open("","",sOption); 
       winprint.document.open(); 
       winprint.document.write('<html><body onload="window.print()">'); 
       winprint.document.write(sWinHTML);          
       winprint.document.write('</body><link href="./disenno/templates/Principal/styles.css" rel="stylesheet" type="text/css"  ></html>'); 
       winprint.document.close(); 
       winprint.focus(); 
}

function validar_cias(cia_ini, cia_fin){
	mens ='';
	if( document.reportesForm.cia_ini.value=='') mens +='-Debe Escribir la Cia inicial\n';
	if(isNaN ( document.reportesForm.cia_ini.value) )mens += '-La Cia Inicial debe ser el codigo numerico\n';
	
	if( document.reportesForm.cia_fin.value=='') mens +='-Debe Escribir la Cia Final\n';
	if(isNaN ( document.reportesForm.cia_fin.value) )mens += '-La Cia Final debe ser el codigo numerico\n'; 
	return mens;
}

function validar_fechas(fecha_ini, fecha_fin) {
	mens ='';
	if( document.reportesForm.fecha_ini.value=='') mens +='-Debe Escribir la Fecha Inicial\n';
	if( document.reportesForm.fecha_fin.value=='') mens +='-Debe Escribir la Fecha Final\n';
	return mens;
}


