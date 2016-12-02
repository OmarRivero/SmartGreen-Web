<%-- 
    Document   : modificarCuenta
    Created on : 27/11/2016, 12:35:04 PM
    Author     : omari
--%>

<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    Usuario h = new Usuario();
        try {
            h = ((Usuario) session.getAttribute("us"));
        } catch (Exception e) {
            h = null;
            e.printStackTrace();
        }
        
    if (request.getSession().getAttribute("us") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modificar Datos</title>

        <script type="text/javascript">
        
        window.onload = function () {
            document.formModificarCuenta.nombre.focus();
            document.formModificarCuenta.addEventListener('submit', validarForm);
            };

            function validarForm(evObject) {

                evObject.preventDefault();
                var todoCorrecto = true;
                var formulario = document.formModificarCuenta;

                for (var i = 0; i < formulario.length; i++) {
                    if (formulario[i].value.length === 0) {
                        alert("El campo " + formulario[i].name + ' no puede estar vacío o contener sólo espacios en blanco.');
                        todoCorrecto = false;
                    }
                }

                var clave1 = document.formModificarCuenta.contrasena.value;
                var clave2 = document.formModificarCuenta.contrasena2.value;
                var email = document.formModificarCuenta.correo.value;
                var expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if (clave1 !== clave2) {
                    alert("Las claves no coinciden");
                    todoCorrecto = false;
                }

                if (!expr.test(email)) {
                    alert("La dirección de correo " + email + " no es valida.");
                    todoCorrecto = false;
                }

                if (todoCorrecto === true) {
                    formulario.submit();
                }
            }
        </script>

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
    <body id="page-top" class="index">
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
                        <li>
                            <a href="carritoDeCompras.jsp"><i style="color: white; text-shadow: black 0.01em 0.01em 0.2em;"  class="fa fa-shopping-cart fa-4x"></i></a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>


        <section id="register">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Modifica tus Datos</h2>
                        <h3 class="section-subheading text-muted">Por si has decidido que no te gusta tu nombre</h3>
                    </div>
                </div>
                <div class="row">
                    <form name="formModificarCuenta" id="formModificarCuenta" action="/SmartGreen/ModificarDatos" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Nuevo nombre" name="nombre" required data-validation-required-message="Por favor ingresa tu nombre">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Nuevo correo eléctronico" name="correo" required data-validation-required-message="Por favor ingresa tu correo.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Nueva contraseña" name="contrasena" required data-validation-required-message="Por favor ingresa tu contraseña.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Repite tu nueva contraseña"  name="contrasena2" required data-validation-required-message="Por favor repite tu contraseña.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div>                                        
                                    <input type="hidden" name="correoAnte" value="<%= h.getCorreo()%>">                                            
                                </div>
                            </div>
                            <br>
                            <br>
                            <br>
                            <br>
                            <div class="text-center">
                                <button type="submit" value="submit" class="btn btn-xl">Guardar</button>
                            </div>
                        </div>
                    </form>
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
