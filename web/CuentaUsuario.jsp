<%-- 
    Document   : CuentaUsuario
    Created on : 10/11/2016, 11:33:04 PM
    Author     : omari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Usuario"%>
<%@page import="java.util.*"%>
<%@page session="true"%>

<%
    
%>

<%
    Usuario h = new Usuario(); 
    
    try {
        h = ((Usuario) session.getAttribute("us"));
        if (h == null){
            System.out.println("Intentaron saltarse el login");
            response.sendRedirect("login.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("login.jsp");
        h=null;
        e.printStackTrace();
    }
    System.out.println("Paso el segundo try");

    int boton = 1;
    String tipo = "";
    String nombre = "";
    String correo = "";

    try {
        tipo = h.getTipoUsuario();
        nombre = h.getNombre();
        correo = h.getCorreo();
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    System.out.println("Paso el tercer try");

    try {
        if (h.getTipoUsuario() == "Cliente") {
            boton = 1;
        } else if (h.getTipoUsuario() == "Administrador") {
            boton = 2;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    System.out.println("Paso el cuarto try");
    
    String saludo = "que onda k pez";
    Calendar fecha = new GregorianCalendar();
    int hora = fecha.get(Calendar.HOUR_OF_DAY);

    if (hora <= 12) {
        saludo = "Buenos dias";
    } 
    else {
        if (hora > 12 && hora < 17) {
            saludo = "Buenas tardes";
        } 
        else {
            saludo = "Buenas noches";
        }
    }
    
    System.out.println("Llego al final");
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SmartGreen</title>
        
        <style type="text/css"> 
            .textoborde {
            -webkit-text-stroke-color: white;
            -webkit-text-stroke-width: .5px;  
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
    <body >
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
                            <a class="page-scroll" href="productos.jsp">Productos</a>
                        </li>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="CuentaUsuario.jsp">Opciones de Cuenta</a>
                        </li>
                        <% if(boton == 1){ %>
                        <li>
                            <a href="carritoDeCompras.jsp"><i style="color: white; text-shadow: black 0.01em 0.01em 0.2em;"  class="fa fa-shopping-cart fa-4x"></i></a>
                        </li>
                        <% }%>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        
        <section id="cuenta" class="container-fluid" >
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading"><%= saludo + " " + h.getNombre()%></h2>
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <form name="CerrarSesion" action="/SmartGreen/CerrarSesion" method="post">
                        <button type="submit" class="btn btn-primary">Cerrar Sesión</button>
                    </form>
                </div>
            </div>
            <br>
            <br>
            <br>
            <%if(boton == 1){ %>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <form name="ModificarCuenta" action="modificarCuenta.jsp" method="post">
                        <button type="submit" class="btn btn-primary">Modificar Datos</button>
                    </form>
                </div>
            </div>
            <br>
            <br>
            <br>
            
            <div class="row ">
                <div class="col-lg-12 text-center">
                    <form name="BorrarCuenta" action="/SmartGreen/BorrarCuenta" method="post">
                        <input type="hidden" name="correo" value="<%= correo%>">
                        <button type="submit" class="btn btn-primary">Borrar Cuenta</button>
                    </form>
                </div>
            </div>
            <% }else{%>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <form name="ConsultarProductos" action="ConsultaProductos.jsp" method="post">
                        <button type="submit" class="btn btn-primary">Consultar Productos</button>
                    </form>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <form name="ConsultaUsuarios" action="usuarios.jsp" method="post">
                        <button type="submit" class="btn btn-primary">Consultar Usuarios</button>
                    </form>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <form name="AgregarProducto" action="Capturar.jsp">
                        <button type="submit" class="btn btn-primary">Agregar Producto</button>
                    </form>
                </div>               
            </div>
            <br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <form name="ModificarCuenta" action="modificarProduct.jsp" method="post">
                        <button type="submit" class="btn btn-primary">Modificar Producto</button>
                    </form>
                </div> 
            </div>
            <br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <form name="BorrarProducto" action="eliminarProducto.jsp" method="post">
                        <input type="hidden" value="">
                        <button type="submit" class="btn btn-primary">Eliminar Producto</button>
                    </form>
                </div>                 
            </div>
            <% }%>
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