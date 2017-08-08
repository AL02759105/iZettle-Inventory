<html lang="en">
  <head>
  	<%@ page import = "java.sql.*" %>
  	<%@ page import = "com.backend.*" %>
  	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Queries</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
    <!-- Custom styles for this template -->

  </head><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page = "/views/NavBar.jsp"/>

<div class="container">
<h2>User query</h2>
<h3>Select one user</h3>
Upon user selection you will be able to see all devices assigned to that user.
<hr/>
</div>

<% 
 try {
	Connection conn = null;
	
	conn = DBConnect.getConnection();
	Statement stmt = conn.createStatement() ;
	ResultSet rs = null; 
	
	rs = stmt.executeQuery("SELECT user_id, first_name, last_name FROM user");
	
%>
<div class="container">
<form class="form-group" name="QueryForm" method="post">
<br/>

      <div class ="form-group" id="selections">
           <label for="inputUser" class="">Select the user you want to inspect</label>
      <select id="inputUser" name="inputUser" required>
        <%  while(rs.next()){ %>
            <option value ="<%= rs.getString(1)%>"><%=rs.getString(2)%><%=" "%><%=rs.getString(3)%></option>
        <% } %>
	  </select>
	 </div>
	 <div class ="form-group">	 
	    <button type="submit" class="btn btn-default">Submit</button>
    </div>
    
</form>
</div>
<%
 conn.close();
	
 } catch (SQLException e) {
	 e.printStackTrace();
 }
%>

</body>
</html>