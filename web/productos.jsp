<%-- 
    Document   : productos
    Created on : 21/11/2016, 10:23:00 PM
    Author     : omari
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clases.Productos"%>
<%@page import="clases.ProductosDAO"%>
<%@page import="clases.Usuario"%>
<%@page session="true"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario h = new Usuario();
    try {
        h = ((Usuario) session.getAttribute("us"));
    } catch (Exception e) {
        e.printStackTrace();
    }
    ProductosDAO p = new ProductosDAO();
    ArrayList<Productos> k = (ArrayList) p.BuscarTodos();

    Integer boton = 0;
    try {
        if (h.getTipoUsuario() == "Cliente") {
            boton = 1;
        } else if (h.getTipoUsuario() == "Administrador") {
            boton = 2;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Productos</title>

        <style type="text/css"> 
            .textoborde {
            -webkit-text-stroke-color: white;
            -webkit-text-stroke-width: .2px;  
            }
            
            .fondo{
                background-color:#318446;
            }
        </style>
        <!-- Bootstrap Core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

        <!-- Theme CSS -->
        <link href="css/agency.min.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- Navegacion -->
        <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll" href="index.jsp">SmartGreen</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li>
                            <a class="page-scroll" href="index.jsp#services">Servicios</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="index.jsp#team">Equipo</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="index.jsp#contact">Contacto</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#producto">Productos</a>
                        </li>
                        <%if (boton == 0){ %>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="login.jsp">Iniciar Sesión</a>
                        </li>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="register.jsp">Registro</a>
                        </li>
                        <%}%>
                        <% if(boton == 1){%>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="CuentaUsuario.jsp">Opciones de Cuenta</a>
                        </li>
                        <% } %>
                        <% if(boton == 2){%>
                        <li>
                            <a href="carritoDeCompras.jsp"><i style="color: white; text-shadow: black 0.01em 0.01em 0.2em;"  class="fa fa-shopping-cart fa-4x"></i></a>
                        </li>
                        <% } %>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        
        <section id="producto">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 style="color: black; text-shadow: white 0.01em 0.01em 0.2em;" class="section-heading">Conoce nuestra gama de invernaderos</h2>
                        <h3 style="color: black; text-shadow: white 0.1em 0.1em 0.2em;" class="section-subheading text-muted">Elige el que más te guste o se adapte a tus necesidades.</h3>
                    </div>
                </div>
                <div class="row">
                    <%for (int i = 0; i < k.size(); i++) {%>
                        <div class="col-sm-4">
                            <div class="team-member">
                                <a href="producto.jsp?N=<%= k.get(i).getIdProducto()%>"><img src=imagenes/<%=k.get(i).getRutaImagen()%> class="img-responsive img-circle" alt=""></a>
                                <h4 style="color: white; text-shadow: black 0.1em 0.1em 0.2em;"><%= k.get(i).getNombre()%></h4>
                                <h4 style="color: white; text-shadow: black 0.1em 0.1em 0.2em;">A solo: $<%= k.get(i).getPrecio()%> MX</h4>
                                <p style="color: white; text-shadow: black 0.1em 0.1em 0.2em;"><a href="producto.jsp?N=<%= k.get(i).getIdProducto()%>"> Ver mas</a></p>
                            </div>
                        </div>
                    <% }%>
                </div>
            </div>
        </section>
        
        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

        <!-- Contact Form JavaScript -->
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/contact_me.js"></script>

        <!-- Theme JavaScript -->
        <script src="js/agency.min.js"></script>
    </body>
</html>
