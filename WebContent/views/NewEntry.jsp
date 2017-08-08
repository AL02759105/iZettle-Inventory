<!DOCTYPE html>
<html lang="en">
  <head>
  	<%@ page import = "java.sql.*" %>
  	<%@ page import = "com.backend.DBConnect" %>
  	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>New Entry</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
    <!-- Custom styles for this template -->
    <link href="views/static/NewEntryForm.css" rel="stylesheet">

  </head><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<body>

<jsp:include page = "/views/NavBar.jsp"/>

<div class="container">
<h2>Register new device</h2>
<h3>Fill up the form</h3>
Fields marked with "*" are mandatory, please insert as much information as possible.
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
<form class="form-group" name="NewEntryForm" method="post">
<br/>

      <div class ="form-group" id="selections">
      <label for="inputType" class="">DeviceType*</label>
      <select id="inputType" name="inputType">
        <option value="Workstation">Workstation</option>
        <option value="Mobile">Mobile</option>
      </select>
         <label for="inputStatus" class="">Status*</label>
      <select id="inputStatus" name="inputStatus" required>
        <option value ="In Use">In Use</option>
        <option value ="In Storage">In Storage</option>
        <option value ="Written Off">Written Off</option>
        <option value ="Unknown">Unknown</option>
        <option value ="Burner">Burner</option>
        <option value ="Decommissioned">Decommissioned</option>
        <option value ="Missing/Stolen">Missing/Stolen</option>
        <option value ="Retired">Retired</option>
      </select>
           <label for="inputUser" class="">User*</label>
      <select id="inputUser" name="inputUser" required>
        <%  while(rs.next()){ %>
            <option value ="<%= rs.getString(1)%>"><%=rs.getString(2)%><%=" "%><%=rs.getString(3)%></option>
        <% } %>
	  </select>
	  <label for="inputLocation" class="">Location*</label>
      <select id="inputLocation" name="inputLocation" required>
        <option value ="BRZ">BRZ</option>
        <option value ="EDI">EDI</option>
        <option value ="LDN">LDN</option>
        <option value ="MEX">MEX</option>
        <option value ="STK">STK</option>
        
        </select>
        </div>
      <div class="form-group">
      <label for="inputSN" class="">SerialNumber*</label>
      <input type="text" id="inputSN" name="inputSN" class="form-control" placeholder="S/N" required>
      </div>
      <div class="form-group">
      <label for="inputIMEI" class="">IMEI (only for Mobile devices)</label>
      <input type="text" id="inputIMEI" name="inputIMEI" class="form-control">
      </div>
      <div class="form-group">
      <label for="inputMake" class="">Make</label>
      <input type="text" id="inputMake" name="inputMake" class="form-control">
      </div>
      <div class="form-group">
      <label for="inputModel" class="">Model</label>
      <input type="text" id="inputModel" name="inputModel" class="form-control">
      </div>
      <div class="form-group">
      <label for="inputModelNumber" class="">Model Number</label>
      <input type="text" id="inputModelNumber" name="inputModelNumber" class="form-control">
      </div>
      <div class="form-group">
      <label for="inputSpecification" class="">Specification</label>
      <input type="text" id="inputSpecification" name="inputSpecification" class="form-control">
      </div>
      <div class="checkbox">
        <label class="">
            <input type="checkbox" name="inputEncrypted"class="">Encrypted</label>
    </div>
    <input type="hidden" name="hidden" value =result/>
    <button type="reset" class="btn btn-default">Clear</button>
    <button type="submit" class="btn btn-default">Submit</button>
    
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