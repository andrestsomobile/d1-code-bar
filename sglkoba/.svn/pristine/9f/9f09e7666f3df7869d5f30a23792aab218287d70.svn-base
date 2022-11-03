  /** 
  * Autor: James Mauricio Martinez Figueroa
  * Email: jamesmauriciom@yahoo.com
  *        jmartinez@tribunetworks.com
  * URL: http://www.nexura.com/
  * Version: 2.0
  * Fecha: 20041127
  * Copyright (c) 2004
  * Todos los derechos reservados.
  */
	
	function jsValidacion(){
		
		// Despliega el mensaje alert en la validacion 
		this.displayAlert=true;
		// Fija el foco en el campo cuando se produce un error
		this.displayFoco=true;
		// Realiza trim cuando un campo es tipo text
		this.trimOn=true;
		// Objeto sobre el cual actua la validacion
		this.obj=null;
		// Id del objeto de validacion
		this.idObj=null;
		// Mensaje en la validacion
		this.mensaje=null;
		
		
		
		/**
		* Fija el foco en el objeto y selecciona el contenido para los campos de texto
		*/
		this.fijarFoco=function(){
			if(this.displayFoco){
				if(this.obj.type.toLowerCase()=='text') this.obj.select();
				try{this.obj.focus();} catch(e){}
			} // if
		}; // fijarFoco
		
		
		
		/**
		* Validacion para campos requeridos
		*/
		// Variables de objeto: Req
		this.setReq=function(mensaje){
			this.Req=true;
			this.mensaje=mensaje;
		}; // setReq
		
		this.validarReq=function(){
			if(this.obj.value.replace(/^\s*/ig, '')) return true;
			else {
				if(this.displayAlert===true){
					if(!this.mensaje && this.obj.type.match(/^select.*?$/ig)) this.mensaje='Debe seleccionar una opcion valida';
					else if(!this.mensaje) this.mensaje='El campo es requerido, no debe contener solo espacios';
					alert(this.mensaje);
				} // if
				this.fijarFoco();
				return false;
			} // if
		}; // validarReq
		
		
		
		/**
		* Validacion para determinar la longitud minima y maxima requerida para el campo
		*/
		// Variables de objeto: Long, LongMin, LongMax
		this.setLongMin=function(valor){
			this.LongMin=valor;
			this.Long=true;
		} // setLongMin
		
		this.setLongMax=function(valor){
			this.LongMax=valor;
			this.Long=true;
		} // setLongMax
		
		this.validarLong=function(){
			if(!this.validarLongConf()) return false;
			if(!this.LongMin && !this.LongMax) return true;
			
			if(this.LongMin){
				if(parseFloat(this.obj.value.length)<parseFloat(this.LongMin)){
					if(this.displayAlert) alert('La longitud del campo es menor que la permitida\nLongitd minima: '+this.LongMin);
					this.fijarFoco();
					return false;
				} // if
			} // if LongMin
			
			if(this.LongMax){
				if(parseFloat(this.obj.value.length)>parseFloat(this.LongMax)){
					if(this.displayAlert) alert('La longitud del campo es mayor que la permitida\nLongitd maxima: '+this.LongMax);
					this.fijarFoco();
					return false;
				} // if
			} // if LongMax
			
			return true;
		} // validarLong
		
		this.validarLongConf=function(){
			if(!this.LongMin && !this.LongMax) return true;
			msgError='';
			if(this.LongMin && this.LongMax && this.LongMin>=this.LongMax) msgError='La configuracion para LongMax debe ser mayor que LongMin.';
			if(this.LongMin && parseInt(this.LongMin)<1) msgError='La configuracion para LongMin debe ser mayor que 0.';
			if(this.LongMin && isNaN(this.LongMin)) msgError='La configuracion para LongMin debe ser numerica.';
			if(this.LongMax && parseInt(this.LongMax)<1) msgError='La configuracion para LongMax debe ser mayor que 0.';
			if(this.LongMax && isNaN(this.LongMax)) msgError='La configuracion para LongMax debe ser numerica.';
			
			if(msgError!=''){
				alert('ERROR DE CONFIGURACION: '+this.idObj+'\n\n'+msgError);
				this.fijarFoco();
				return false;
			} // if
			else return true;
		} // validarLongConf
		
		
		
		/**
		* Validacion para campos numero
		*/
		// Variables de objeto: Num
		this.setNum=function(){
			this.Num=true;
		}; // setNum
		
		this.validarNum=function(){
			if(isNaN(this.obj.value)){
				if(this.displayAlert) alert('El campo debe ser numerico');
				this.fijarFoco();
				return false;
			} // if
			else return true;
		}; // validarNum
		
		
		
		/**
		* Validacion para campos enteros
		*/
		// Variables de objeto: Int
		this.setInt=function(){
			this.Int=true;
		}; // setInt
		
		this.validarInt=function(){
			resultado=this.validarNum();
			if(!resultado) return false;
			
			if(this.obj.value.indexOf('.')>0){
				if(this.displayAlert) alert('El campo no puede contener decimales');
				this.fijarFoco();
				return false;
			} // if
			else return true;
		}; // validarInt
		
		
		
		/**
		* Validacion para campos numero en un rango determinado
		*/
		// Variables de objeto: Rango, RangoMin, RangoMax
		this.setRangoMin=function(valor){
			this.RangoMin=valor;
			this.Rango=true;
		} // setRangoMin
		
		this.setRangoMax=function(valor){
			this.RangoMax=valor;
			this.Rango=true;
		} // setRangoMax
		
		this.validarRango=function(){
			resultado=this.validarNum();
			if(!resultado) return false;
			
			if(this.RangoMin!==false){
				if(parseFloat(this.obj.value)<parseFloat(this.RangoMin)){
					if(this.displayAlert) alert('El valor del campo es menor que el permitido.\nValor minimo: '+this.RangoMin);
					this.fijarFoco();
					return false;
				} // if
			} // if rangoMin
			
			if(this.RangoMax!==false){
				if(parseFloat(this.obj.value)>parseFloat(this.RangoMax)){
					if(this.displayAlert) alert('El valor del campo es mayor que el permitido.\nValor maximo: '+this.RangoMax);
					this.fijarFoco();
					return false;
				} // if
			} // if rangoMax
			
			return true;
		} // validarRango
		
		this.validarRangoConf=function(){
			if(!this.validarRango()) return false;
			if(!this.RangoMin && !this.RangoMax) return true;
			
			msgError='';
			if(this.RangoMin && this.RangoMax && this.RangoMin>=this.RangoMax) msgError='La configuracion para rangoMax debe ser mayor que rangoMin.';
			if(this.RangoMin && isNaN(this.RangoMin)) msgError='La configuracion para rangoMin debe ser numerica.';
			if(this.RangoMax && isNaN(this.RangoMax)) msgError='La configuracion para rangoMax debe ser numerica.';
			
			if(msgError!=''){
				alert('ERROR DE CONFIGURACION: '+this.idObj+'\n\n'+msgError);
				this.fijarFoco();
				return false;
			} // if
			else return true;
		} // validarRangoConf
		
		
		
		/**
		* Validacion para campos login
		*/
		// Variables de objeto: Login
		this.setLogin=function(){
			this.Login=true;
		}; // setLogin
		
		this.validarLogin=function(){
			if(!this.obj.value.match(/^[a-z]\w{3}([_]?\w+)*[a-z0-9]$/ig)>0){
				if(this.displayAlert) alert('El campo debe ser un login correcto\n\nDebe tener por lo menos 5 caracteres\nDebe comenzar por una letra\nDebe terminar en una letra o numero');
				this.fijarFoco();
				return false;
			} // if
			else return true;
		}; // validarLogin
		
		
		
		/**
		* Validacion para campos email
		*/
		// Variables de objeto: Email
		this.setEmail=function(){
			this.Email=true;
		}; // setEmail
		
		this.validarEmail=function(){
			if(!this.obj.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/ig)>0){
				if(this.displayAlert) alert('El campo debe ser un e-mail correcto');
				this.fijarFoco();
				return false;
			} // if
			else return true;
		}; // validarEmail
		
		
		
		/**
		* Validacion para dos campos iguales
		*/
		// Variables de objeto: Igual, IgualId, IgualObj, IgualMsg
		this.setIgual=function(id, msg){
			this.Igual=true;
			this.IgualId=id;
			this.IgualMsg=msg;
		}; // setIgual
		
		this.validarIgual=function(){
			if(!this.validarIgualConf()) return false;
			
			if(this.obj.value!=this.IgualObj.value){
				if(this.displayAlert) alert(this.IgualMsg);
				this.fijarFoco();
				return false;
			} // if
			else return true;
		}; // validarIgual
		
		this.validarIgualConf=function(){
			msgError='';
			if(trim(this.IgualMsg)=='') msgError='La configuracion para el mensaje del objeto Igual no esta definido';
			if(trim(this.IgualId)=='') msgError='La configuracion para el id del objeto Igual no esta definida';
			if(this.IgualId!=null){
				this.IgualObj=getElement(this.IgualId);
				if(this.IgualObj===null) msgError='El objeto de validacion Igual no existe o no se encuentra bien configurado.';
			} // if
			
			if(msgError!=''){
				alert('ERROR DE CONFIGURACION: '+this.idObj+'\n\n'+msgError);
				this.fijarFoco();
				return false;
			} // if
			else return true;
		} // validarIgualConf
		
		
		
		/**
		* Validacion para campos con valor determinado en un conjunto de valores
		*/
		// Variables de objeto: Valores, ValoresDatos, ValoresSeparador
		this.setValores=function(datos, separador){
			this.Valores=true;
			this.ValoresDatos=datos;
			if(trim(separador)) this.ValoresSeparador=separador;
			else this.ValoresSeparador='|';
		}; // setValores
		
		this.validarValores=function(){
			if(!this.validarValoresConf()) return false;
			
			// Se parte por el separador y se obtiene un nuevo vector de datos
			var resultado=false;
			var ValoresDatos=this.ValoresDatos.split(this.ValoresSeparador);
			for(var i=0; i<ValoresDatos.length; i++) if(ValoresDatos[i]==this.obj.value) resultado=true;
			
			if(!resultado){
				if(this.displayAlert) alert('El valor del campo no corresponde con un valor permitido');
				this.fijarFoco();
				return false;
			} // if
			else return true;
		}; // validarValores
		
		this.validarValoresConf=function(){
			msgError='';
			if(trim(this.ValoresDatos)=='') msgError='La configuracion de los valores de validacion no es correcta.';
			
			if(msgError!=''){
				alert('ERROR DE CONFIGURACION: '+this.idObj+'\n\n'+msgError);
				this.fijarFoco();
				return false;
			} // if
			else return true;
		} // validarValoresConf
		
		
		
		/**
		* Validacion de fecha
		*/
		// Variables de objeto: Fecha, FechaFormato, FechaTipo
		this.setFecha=function(formato){
			this.Fecha=true;
			if(trim(formato)) this.FechaFormato=formato;
			else this.FechaFormato='dd/mm/aaaa';
		}; // setFecha
		
		this.validarFecha=function(){
			if(!this.validarFechaConf()) return false;
			
			// Si el valor es vacio se retorna como valido
			if(trim(this.obj.value)=='') return true;
			
			resultado=true;
			switch(this.FechaTipo){
				case 1:
					valores=this.obj.value.split(/[\/\-\.\s]/);
					dia=valores[0];
					mes=valores[1];
					anno=valores[2];
					break;
				case 2:
					valores=this.obj.value.split(/[\/\-\.\s]/);
					dia=valores[1];
					mes=valores[0];
					anno=valores[2];
					break;
				default:
					resultado=false;
			} // switch
			if(resultado) resultado=validarFechaJS(dia, mes, anno);
			
			if(!resultado){
				if(this.displayAlert) alert('El campo debe ser una fecha correcta');
				this.fijarFoco();
				return false;
			} // if
			else return true;
		}; // validarFecha
		
		this.validarFechaConf=function(){
			msgError='';
			switch(this.FechaFormato){
				case "dd/mm/aaaa":
				case "dd-mm-aaaa":
				case "dd.mm.aaaa":
				case "dd mm aaaa":
				case "dd/mm/aa":
				case "dd-mm-aa":
				case "dd.mm.aa":
				case "dd mm aa":
					this.FechaTipo=1;
					break;
				case "mm/dd/aaaa":
				case "mm-dd-aaaa":
				case "mm.dd.aaaa":
				case "mm dd aaaa":
				case "mm/dd/aa":
				case "mm-dd-aa":
				case "mm.dd.aa":
				case "mm dd aa":
					this.FechaTipo=2;
					break;
				default:
					msgError='El formato para la validacion de fecha no corresponde con alguno de los permitidos';
			} // switch
			
			if(msgError!=''){
				alert('ERROR DE CONFIGURACION: '+this.idObj+'\n\n'+msgError);
				this.fijarFoco();
				return false;
			} // if
			else return true;
		} // validarFechaConf
		
		
		
		/**
		* Define el id del campo para su validacion e inicializa cada una de las variables de la clase
		*/
		this.setId=function(idObj){
			this.idObj=idObj;
			this.Req=false;
			this.Long=false;
			this.LongMin=false;
			this.LongMax=false;
			this.Num=false;
			this.Int=false;
			this.Rango=false;
			this.RangoMin=false;
			this.RangoMax=false;
			this.Login=false;
			this.Email=false;
			this.Igual=false;
			this.IgualId=false;
			this.IgualObj=null;
			this.IgualMsg=false;
			this.Valores=false;
			this.ValoresDatos=false;
			this.ValoresSeparador=null;
			this.Fecha=false;
			this.FechaFormato=false;
			this.FechaTipo=false;
		} // setId
		
		
		
		/**
		* Validacion de campos
		*/
		this.validar=function(){
			var resultado=true;
			
			this.obj=getElement(this.idObj);
			if(this.obj===null){
				alert('ERROR DE CONFIGURACION: '+this.idObj+'\n\nEl objeto de validacion no existe o no se encuentra bien configurado.');
				resultado=false;
			} // if
			
			// Realiza trim a los campos text si esta configurado trimOn
			if(resultado && (this.obj.type.toLowerCase()=='text' || this.obj.type.toLowerCase()=='textarea') && this.trimOn) this.obj.value=trim(this.obj.value);
			
			if(resultado && this.Req) resultado=this.validarReq();
			if(resultado && this.Long) resultado=this.validarLong();
			if(resultado && this.Num) resultado=this.validarNum();
			if(resultado && this.Int) resultado=this.validarInt();
			if(resultado && this.Rango) resultado=this.validarRango();
			if(resultado && this.Login) resultado=this.validarLogin();
			if(resultado && this.Email) resultado=this.validarEmail();
			if(resultado && this.Igual) resultado=this.validarIgual();
			if(resultado && this.Valores) resultado=this.validarValores();
			if(resultado && this.Fecha) resultado=this.validarFecha();
			
			return resultado;
		} // validar
		
	} // jsValidacion

	
	/**
	* Valida una fecha
	*/
	function validarFechaJS(dia, mes, anno){
		if(isNaN(dia)) return false;
		
		if(isNaN(mes)) return false;
		if(mes>12 || mes<1) return false;
		
		if(isNaN(anno)) return false;
		if(anno.length==2) anno='20'+anno;
		if(anno.length!=4) return false;
		
		dia=parseInt(dia, 10);
		mes=parseInt(mes, 10);
		anno=parseInt(anno, 10);
		
		if((mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12) && (dia>31 || dia<1)) return false;
		if((mes==4 || mes==6 || mes==9 || mes==11) && (dia>30 || dia<1)) return false;
		if(mes==2){
			if(dia<1) return false;
			
			var valTemp=false;
			if((anno%100)==0){ if((anno%400)==0){ valTemp=true; } } // if
			else{ if((anno%4)==0){ valTemp=true; } } // else
			
			if(valTemp){ if(dia>29) return false; } // if
			else{ if(dia>28) return false; } // else
		} // if
		
		return true;
	} // validarFechaJS

	/**
	* Realiza el trim a una cadena
	*/
	function trim(valor){
		if(valor!='' && !(valor===undefined) && !(valor===null)) return valor.replace(/^\s*/ig, '').replace(/\s*$/ig, '');
		else return '';
	} // trim

  /**
  * Obtiene un objeto determinado identificado por su id
  */
  function getElement(e,f){
    if(document.layers){
        f=(f)?f:self;
        if(f.document.layers[e]) return f.document.layers[e];
        for(W=0;i<f.document.layers.length;W++) {
            return(getElement(e,fdocument.layers[W]));
        } // for
    } // if
    if(document.all) return document.all[e];
    return document.getElementById(e);
  } // getElement