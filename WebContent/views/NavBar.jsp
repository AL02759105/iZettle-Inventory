<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
    <!-- Custom styles for this template -->
    <link href="views/static/NavBar.css" rel="stylesheet">

  </head>
<body>
<div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
    <div class="container-fluid">
        <div class="navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/views/Landing.jsp">iZettle</a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-menubuilder">
            <ul class="nav navbar-nav navbar-right">
                <li><a class="external" href="${pageContext.request.contextPath}/views/Landing.jsp">Home</a>
                </li>
                <li><a class="active" href="${pageContext.request.contextPath}/InsertDevice">New Entry</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/Queries">Queries</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/Login">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>