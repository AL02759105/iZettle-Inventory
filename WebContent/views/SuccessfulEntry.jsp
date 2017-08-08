<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Success!</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
    <!-- Custom styles for this template -->
<body>
<jsp:include page = "/views/NavBar.jsp"/>

<div class="container">
    <h1 class="" contenteditable="false">Congratulations</h1>
    
    <br/>
    <font size = "3">You successfully recorded your device information.
    <br/>
    Now you can insert another one, or consult your devices going to queries.</font>
     <br/>
   <a class="btn btn-block btn-primary" href="${pageContext.request.contextPath}/InsertDevice" role="button">Make a new Entry</a>  
   <a class="btn btn-block btn-primary" href="${pageContext.request.contextPath}/Queries" role="button">Make a Query</a>
   <a class="btn btn-block btn-primary" href="${pageContext.request.contextPath}/views/Landing.jsp" role="button">Go Home</a>
   <br/>
    
    </div>
</body>
</html>