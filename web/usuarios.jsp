<%-- 
    Document   : usuarios
    Created on : 28/11/2016, 12:40:51 AM
    Author     : omari
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="clases.ProductoCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.Productos"%>
<%@page import="clases.ProductosDAO"%>
<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    ProductosDAO p = new ProductosDAO();
    ArrayList<ProductoCarrito> k = new ArrayList<ProductoCarrito>();
    Usuario h = new Usuario();
    Integer boton = 0;
    if (request.getSession().getAttribute("us") == null) {
        response.sendRedirect("login.jsp");
    } else {
        try {
            h = ((Usuario) session.getAttribute("us"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    try {
        if (h.getTipoUsuario() == "Cliente") {
            boton = 1;
            response.sendRedirect("CuentaUsuario.jsp");
        } else if (h.getTipoUsuario() == "Administrador") {
            boton = 2;
        }
    } catch (Exception e) {

    }

    
    Connection conexion = null;
    Statement sentencia = null;
    ResultSet resultado = null;
    String cadenaConecion = "jdbc:mysql://127.0.0.1:3306/bd_smartgreen";
    String usuarioBD = "root";
    String passwordBD = "n0m3l0";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(cadenaConecion, usuarioBD, passwordBD);
        sentencia = conexion.createStatement();
        resultado = sentencia.executeQuery("SELECT * FROM usuarios");
    }
    catch(Exception e){
        
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

        <title>Usuarios</title>

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
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <section id="cuenta" class="container-fluid" >
            <div>
                <h2 class="section-heading text-center">Usuarios de SmartGreen</h2>
            </div>
            <br>
            <br>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="color: white; text-shadow: black 0.1em 0.1em 0.2em;">Nombre</th>
                            <th style="color: white; text-shadow: black 0.1em 0.1em 0.2em;">Correo</th>
                            <th style="color: white; text-shadow: black 0.1em 0.1em 0.2em;">Tipo de Usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while (resultado.next()) {%>
                        <tr>
                            <td style="color: white; text-shadow: black 0.1em 0.1em 0.2em;"><%= resultado.getString("nombre")%></td>
                            <td style="color: white; text-shadow: black 0.1em 0.1em 0.2em;"><%= resultado.getString("correo")%></td>
                            <td style="color: white; text-shadow: black 0.1em 0.1em 0.2em;"><%= resultado.getString("tipoUsuario")%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>               
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
