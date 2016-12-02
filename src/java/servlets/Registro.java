/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.Acceso;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author omari
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contra = request.getParameter("contrasena");
        
        if(nombre == null || correo == null || contra == null){
            response.sendRedirect("register.jsp");
        }
        
        Acceso conexion = new Acceso();
        boolean existe = conexion.verificaExiste(correo);
        System.out.println("La existencia del usuario es : " + existe);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Registro Confirmacion</title>"
                    + "<meta charset=\"utf-8\">\n"
                    + "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                    + "<meta name=\"description\" content=\"\">\n"
                    + "<meta name=\"author\" content=\"\">\n"
                    + "<title>SmartGreen</title>\n"
                    + "<style type=\"text/css\"> \n"
                    + "    .textoborde {\n"
                    + "    -webkit-text-stroke-color: white;\n"
                    + "    -webkit-text-stroke-width: .5px;  \n"
                    + "    }\n"
                    + "        </style>\n"
                    + "        <!-- Bootstrap Core CSS -->\n"
                    + "        <link href=\"vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "\n"
                    + "        <!-- Custom Fonts -->\n"
                    + "        <link href=\"vendor/font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n"
                    + "        <link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\">\n"
                    + "        <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>\n"
                    + "        <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>\n"
                    + "        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>\n"
                    + "\n"
                    + "        <!-- Theme CSS -->\n"
                    + "        <link href=\"css/agency.min.css\" rel=\"stylesheet\">\n"
                    + "\n"
                    + "        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\n"
                    + "        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n"
                    + "        <!--[if lt IE 9]>\n"
                    + "            <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\n"
                    + "            <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\n"
                    + "        <![endif]-->");
            out.println("</head>");
            out.println("<body id=\"page-top\" class=\"index\">"
                    + "<!-- Navegacion -->\n"
                    + "        <nav id=\"mainNav\" class=\"navbar navbar-default navbar-custom navbar-fixed-top\">\n"
                    + "            <div class=\"container\">\n"
                    + "                <div class=\"navbar-header page-scroll\">\n"
                    + "                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\n"
                    + "                        <span class=\"sr-only\">Toggle navigation</span> Menu <i class=\"fa fa-bars\"></i>\n"
                    + "                    </button>\n"
                    + "                    <a class=\"navbar-brand page-scroll\" href=\"#page-top\">SmartGreen</a>\n"
                    + "                </div>\n"
                    + "                \n"
                    + "                <!-- Collect the nav links, forms, and other content for toggling -->\n"
                    + "                <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\n"
                    + "                    <ul class=\"nav navbar-nav navbar-right\">\n"
                    + "                        <li class=\"hidden\">\n"
                    + "                            <a href=\"#page-top\"></a>\n"
                    + "                        </li>\n"
                    + "                        <li>\n"
                    + "                            <a class=\"page-scroll\" href=\"index.jsp#services\">Servicios</a>\n"
                    + "                        </li>\n"
                    + "                        <li>\n"
                    + "                            <a class=\"page-scroll\" href=\"index.jsp#team\">Equipo</a>\n"
                    + "                        </li>\n"
                    + "                        <li>\n"
                    + "                            <a class=\"page-scroll\" href=\"index.jsp#contact\">Contacto</a>\n"
                    + "                        </li>\n"
                    + "                        <li>\n"
                    + "                            <a class=\"page-scroll\" href=\"productos.jsp\">Productos</a>\n"
                    + "                        </li>"
                    + "                        <li>\n"
                    + "                            <a class=\"page-scroll\" href=\"login.jsp#login\">Iniciar Sesión</a>\n"
                    + "                        </li>\n"
                    + "                        <li>\n"
                    + "                            <a class=\"page-scroll\" href=\"#register\">Registro</a>\n"
                    + "                        </li>\n"
                    + "                    </ul>\n"
                    + "                </div>\n"
                    + "                <!-- /.navbar-collapse -->\n"
                    + "            </div>\n"
                    + "            <!-- /.container-fluid -->\n"
                    + "        </nav>\n"
                    + "        \n"
                    + "        \n"
                    + "        <section id=\"register\">\n"
                    + "            <div class=\"container\">\n"
                    + "                <div class=\"row\">\n"
                    + "                    <div class=\"col-lg-12 text-center\">\n");
                    if(!existe){
                        conexion.registrarUser(nombre, correo, contra);
                        out.println("           <h2 class=\"section-heading\">Muy bien :)</h2>");
                        out.println("           <h3 class=\"section-subheading text-muted\">Te has registrado correctamente! Ahora inicia sesión en tu nueva cuenta</h3>");
                    }
                    else{
                        out.println("           <h2 class=\"section-heading\">Rayos :(</h2>");
                        out.println("           <h3 class=\"section-subheading text-muted\">Ese correo ya está ocupado</h3>");
                    }
                        
                    out.println("          </div>\n"
                    + "                </div>\n"
                    + "                <div class=\"row\">\n"
                    + "                    <div class=\"col-lg-5 text-center\">\n"
                    + "                        <img src=\"imagenes/dino.png\" alt=\"\" class=\"img-responsive\">\n"
                    + "                    </div>\n"
                    + "                </div> "                   
                    + "            </div>\n"
                    + "        </section>\n"
                    + "        \n"
                    + "        <!-- jQuery -->\n"
                    + "        <script src=\"vendor/jquery/jquery.min.js\"></script>\n"
                    + "\n"
                    + "        <!-- Bootstrap Core JavaScript -->\n"
                    + "        <script src=\"vendor/bootstrap/js/bootstrap.min.js\"></script>\n"
                    + "\n"
                    + "        <!-- Plugin JavaScript -->\n"
                    + "        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js\"></script>\n"
                    + "\n"
                    + "        <!-- Contact Form JavaScript -->\n"
                    + "        <script src=\"js/jqBootstrapValidation.js\"></script>\n"
                    + "        <script src=\"js/contact_me.js\"></script>\n"
                    + "\n"
                    + "        <!-- Theme JavaScript -->\n"
                    + "        <script src=\"js/agency.min.js\"></script>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
