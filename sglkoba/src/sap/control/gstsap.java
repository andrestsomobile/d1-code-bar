package sap.control;
	
	public ResultadoLeerInterface armarArchivo(String nombreArchivo,HttpServletRequest request){
		HttpSession se = request.getSession(true);
		String filePath = (String) se.getAttribute("ruta_upload");
		//String filePath = request.getRealPath("")+ File.separator;
		String myFullFileName = nombreArchivo, myFileName = "", slashType = (myFullFileName.lastIndexOf("\\") > 0) ? "\\" : "/"; // Windows or UNIX
		int startIndex = myFullFileName.lastIndexOf(slashType);

		// Ignore the path and get the filename
		myFileName = myFullFileName.substring(startIndex + 1, myFullFileName.length()).replaceAll(" ", "_");

		// Create new File object
		File uploadedFile = new File(filePath, myFileName);
		
		String contenidoArchivo 		  = "";
		ResultadoLeerInterface resultado  = new ResultadoLeerInterface();
		resultado.setParseadoCorrecto(false);
		
		ArrayList<String[]> dataResultado = new ArrayList<String[]>();
		
		try {
			contenidoArchivo = FileUtils.readFileToString(uploadedFile);
								
			String[] lineas = contenidoArchivo.split("\\~");
			for(String linea : lineas){
				String[] campos = linea.split("\\*");
				dataResultado.add(campos);
			}
			
			resultado.setDataRaw(dataResultado);
			resultado.setDataArchivo(contenidoArchivo);
			resultado.setParseadoCorrecto(true);
			
								
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return resultado;	
	}
