<%-- 
    Document   : index
    Created on : 10/11/2016, 11:33:04 PM
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
        e.printStackTrace();
    }

    Integer boton = 0;
    try {
        if (h.getTipoUsuario() == "Cliente") {
            boton = 1;
        } else {
            if (h.getTipoUsuario() == "Administrador") {
                boton = 2;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
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
    <body id="page-top" class="index">
        <!-- Navegacion -->
        <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">SmartGreen</a>
                </div>
                
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="#services">Servicios</a>
                        </li>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="#team">Equipo</a>
                        </li>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="#contact">Contacto</a>
                        </li>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="productos.jsp">Productos</a>
                        </li>
                        <%if (boton == 0){ %>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="login.jsp">Iniciar Sesión</a>
                        </li>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="register.jsp">Registro</a>
                        </li>
                        <% }%>
                        <%if(boton == 1 || boton == 2){ %>
                        <li>
                            <a style="color: white; text-shadow: black 0.1em 0.1em 0.2em;" class="page-scroll" href="CuentaUsuario.jsp">Opciones de Cuenta</a>
                        </li>
                        <% } %>
                        <%if(boton == 1){ %>
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
        
        <!-- Header -->
        <header>
            <div class="container">
                <div class="intro-text">
                    <div class="intro-lead-in">Es un placer conocerte!</div>
                    <div class="intro-heading textoborde">Bienvenido a SmartGreen</div>
                    <a href="#services" class="page-scroll btn btn-xl">Cuentame más</a>
                </div>
            </div>
        </header>
        
        <!-- Seccion de servicios -->
        <section id="services">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Servicios</h2>
                        <h3 class="section-subheading text-muted">A continuacion te presentamos los servicios que suministra nuestra empresa.</h3>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">Venta de invernaderos inteligentes</h4>
                        <p class="text-muted">¿Te imaginas? Nosotros podemos solucionar un gran problema. Si no tienes tiempo, no hay problema. Tu invernadero hace que tus plantas siempre tengan lo que necesitan.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">Monitoreo web de tu invernadero</h4>
                        <p class="text-muted">Cuando tengas en fucionamiento tu invernadero, podrás checar su estado desde nuestra página.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">Ayudarás al medio ambiente</h4>
                        <p class="text-muted">Tu invernadero será una máquina generadora de oxigeno automática. ¿Verdad que es genial?.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="team" class="bg-light-gray">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Nuestro sorprendente equipo <3</h2>
                        <h3 class="section-subheading text-muted">Los creadores de SmartGreen</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="team-member">
                            <img src="img/team/1.jpg" class="img-responsive img-circle" alt="">
                            <h4>El Aletzis</h4>
                            <p class="text-muted">Diseñador web</p>
                            <ul class="list-inline social-buttons">
                                <li><a href="https://www.instagram.com/lieediant/"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li><a href="https://www.facebook.com/AlexisC20"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li><a href="https://github.com/AlexisCastro"><i class="fa fa-github"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="team-member">
                            <img src="img/team/2.jpg" class="img-responsive img-circle" alt="">
                            <h4>Ima OH</h4>
                            <p class="text-muted">Programador</p>
                            <ul class="list-inline social-buttons">
                                <li><a href="https://www.instagram.com/ohriveer/"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li><a href="https://www.facebook.com/omar.imanol"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li><a href="https://github.com/OmarRivero"><i class="fa fa-github"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="team-member">
                            <img src="img/team/3.jpg" class="img-responsive img-circle" alt="">
                            <h4>El Killer</h4>
                            <p class="text-muted">Documentación</p>
                            <ul class="list-inline social-buttons">
                                <li><a href="https://www.facebook.com/emerson.alvarado.3950"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li><a href="https://github.com/dan2344"><i class="fa fa-github"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Contáctanos</h2>
                        <h3 class="section-subheading text-muted">Envia tus dudas o sugerencias</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <form action="contact_me.php" method="post" name="sentMessage" id="contactForm" novalidate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Tu nombre *" id="name" name="name" required data-validation-required-message="Por favor ingresa tu nombre">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Tu correo eléctronico *" id="email" name="email" required data-validation-required-message="Por favor ingresa tu correo">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Asunto *" id="asunto" name="asunto" required data-validation-required-message="Por favor ingresa tu asunto">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <textarea class="form-control" placeholder="Tu mensaje **" id="message" name="message" required data-validation-required-message="Por favor ingresa un mensaje"></textarea>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-lg-12 text-center">
                                    <div id="success"></div>
                                    <button type="submit" class="btn btn-xl">Enviar Mensaje</button>
                                </div>
                            </div>
                        </form>
                    </div>
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
