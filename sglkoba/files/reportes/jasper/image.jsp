<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
java.util.Map imagesMap = (java.util.Map) session.getAttribute("IMAGES_MAP");

			if (imagesMap != null) {
				String imageName = request.getParameter("image");
				if (imageName != null) {
					byte[] imageData = (byte[]) imagesMap.get(imageName);

					response.setContentLength(imageData.length);
					ServletOutputStream ouputStream = response
							.getOutputStream();
					ouputStream.write(imageData, 0, imageData.length);
					ouputStream.flush();
					ouputStream.close();
				}
			}

		%>

</body>
</html>
