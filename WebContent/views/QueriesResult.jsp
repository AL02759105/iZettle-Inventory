<!DOCTYPE html>
  	<%@ page import = "java.sql.*" %>
  	<%@ page import = "com.backend.*" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Query result</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
    <!-- Custom styles for this template -->
<body>
<jsp:include page = "/views/NavBar.jsp"/>

<div class="container">
    <h1 class="" contenteditable="false">The devices assigned to the selected user are:</h1>
    
<% 

String user = request.getParameter("inputUser");
int user_id = Integer.parseInt(user);
Device device = new Device();
ResultSet devices = device.getDevices(user_id);

%>

<br/>
<br/>
<table border="1" class="table">
<tbody>
	<tr>
		<td>First Name</td>
		<td>Last Name</td>
		<td>Status</td>
		<td>Device Type</td>
		<td>Serial Number</td>
		<td>IMEI</td>
		<td>Location</td>
		<td>Make</td>
		<td>Model</td>
		<td>Model Number</td>
		<td>Specification</td>
	</tr>
	<% while (devices.next())  { %>
	<tr>
		<td><%=devices.getString("first_name") %></td>
		<td><%=devices.getString("last_name")%></td>
		<td><%=devices.getString("status") %></td>
		<td><%=devices.getString("device_type") %></td>
		<td><%=devices.getString("serial_number") %></td>
		<td><%=devices.getString("IMEI") %></td>
		<td><%=devices.getString("location") %></td>
		<td><%=devices.getString("make") %></td>
		<td><%=devices.getString("model") %></td>
		<td><%=devices.getString("model_nr") %></td>
		<td><%=devices.getString("specification") %></td>
	</tr>
	<% } %>
</tbody>

</table>

   <br/>
   <a class="btn btn-block btn-primary" href="${pageContext.request.contextPath}/Queries" role="button">Make a new Query</a>
   <a class="btn btn-block btn-primary" href="${pageContext.request.contextPath}/views/Landing.jsp" role="button">Go Home</a>
   <br>
    </div>
    
   <div class ="container">
 
   </div>
</body>
</html>