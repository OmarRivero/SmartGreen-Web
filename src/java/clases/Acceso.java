/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import static clases.Conection.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author omari
 */
public class Acceso {
    
    public boolean verificaExiste(String correo) throws SQLException{
        boolean existe = false;
        try(Connection con = Conection.getConnection()){
            String consulta= "";
            String q = ("SELECT * FROM usuarios WHERE correo='" + correo + "';");
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                consulta=rs.getString("idUsuario");
                System.out.println(consulta); 
                existe = true;
            }else{
                existe= false;
            }
            
            System.out.println("El usuario " + consulta + " ya tiene ese correo");
            
            return existe;
        
        }catch(SQLException ex){
            ex.printStackTrace();
            return true;
        }

    }
   
    
//  homepage con login, productos de su tema deben tener altas consulatas modificaciones y eliminacion ABCC, debe de tener usuarios con contraseña y tipo (proveedores, normal) los proveedores pueden tener alta baja cqambio y consulta. Debe haber dos administradores de negocio y de sistema (el de sistema se puede meter a cualquirer parte.), en el inventario hay un ingreso. 
/*
  tabla inventario
    id inventario
    id producto
    id usuario 
    cantidad
    costo
    
*/
    public void registrarUser(String nombre, String correo, String contrasena) throws SQLException {
        try(Connection con = getConnection()){
            String consulta= null;
            String q = "call insertarUser(null, 1, '"+ nombre +"', '"+ correo +"', '"+contrasena+"');";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
        } catch (SQLException ex) {
            
        }
    }
    
    
    public void borrarUser(String correo) throws SQLException {
        try(Connection con = getConnection()){
            String consulta= null;
            String q = "call borrarUsuario('"+correo+"')";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
        } catch (SQLException ex) {
        }
    }
    
    public void modificarUser(String correoAnte, String nombre, String contrasena, String correo) throws SQLException {
        try(Connection con = getConnection()){
            String consulta= null;
            String q = "call modificarDatos('"+correoAnte+"','"+nombre+"','"+correo+"','"+contrasena+"');";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
        } catch (SQLException ex) {
            
        }
    }
    
    public void modificarProducto(String nombreAnt, String producto, String precio, String cantidad, String descripcion, String rutaImagen) throws SQLException{
        try (Connection con = Conection.getConnection()){
            String q = "call modificarProducto('"+nombreAnt+"', '"+ producto +"', "+ precio +", "+ cantidad +", '"+ descripcion +"', '"+rutaImagen+"')";
            PreparedStatement ps = con.prepareStatement(q);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public boolean inicioSesion(String correo, String contrasena) throws SQLException{
        boolean existe = false;

        try(Connection con = Conection.getConnection()){
            String q = ("SELECT * FROM usuarios WHERE correo='"+correo+"' and contrasena=md5('"+contrasena+"');");
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            if(rs.absolute(1)){
                existe = true;
                System.out.println("Entro al if en inicioSesion de Acceso");
            }
            else{
                existe = false;
                System.out.println("Entro al else de inicioSesion en Acceso");
            }
            return existe;
        } catch (SQLException ex) {
            return existe;
        }
    }
    
    public int getTipo(String correo, String contrasena) throws SQLException{
        
        int tipo = 1;

        try (Connection con = Conection.getConnection()){
            String q = ("SELECT * FROM usuarios WHERE correo='" + correo + "' and contrasena=md5('" + contrasena + "');");
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tipo = rs.getInt("idTipo");
            }
            return tipo;
        } catch (SQLException ex) {
            return tipo;
        }
        
    }
    
    public String getNombre(String correo) throws SQLException{
        String nombre="No se encontro el nombre shavo";
        try (Connection con = Conection.getConnection()){
            String q = ("SELECT * FROM usuarios WHERE correo='"+correo+"';");
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                nombre= rs.getString("nombre");
            }
            System.out.println("ESTO es lo que extrajo de la tabla nombre " + nombre);
            
            return nombre;
        } catch (SQLException ex) {
            System.out.println("Se metio a la excepcion de SQL en getNombre");
            Logger.getLogger(Acceso.class.getName()).log(Level.SEVERE, null, ex);
            return nombre;
        }
    }
    
    public void AgregarProducto(String producto, String precio, String cantidad, String descripcion, String rutaImagen) throws SQLException{
        try (Connection con = Conection.getConnection()){
            String q = "insert into productos (idProducto, nombre, precio, cantidad, descripcion, rutaImagen) values(null, '"+ producto +"', "+ precio +", "+ cantidad +", '"+ descripcion +"', '"+rutaImagen+"')";
            PreparedStatement ps = con.prepareStatement(q);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void EliminarProducto(String nombre) throws SQLException{
        try (Connection con = Conection.getConnection()){
            String q = "delete from productos where nombre ='" + nombre + "';";
            PreparedStatement ps = con.prepareStatement(q);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
     public Usuario BuscarPorUsuario(String correo, String contrasena) throws SQLException {
		String query = "SELECT * FROM usuarios WHERE correo='"+correo+"' and contrasena=md5('"+contrasena+"');";
		try(Connection con = Conection.getConnection()) {
                    PreparedStatement ps = con.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    Usuario p = null;
                    if(rs.next()) {
                            p = crearDTO(rs);
                    }
                    return p;
		}
	}
     
     private Usuario crearDTO(ResultSet rs) throws SQLException {
        Usuario p = new Usuario();
        p.setIdUsuario(rs.getString("idUsuario"));
        p.setNombre(rs.getString("nombre"));
        p.setCorreo(rs.getString("correo"));
        switch(rs.getString("tipoUsuario")){
            case "1":
                p.setTipoUsuario("Cliente");
                break;
            case "2":
                p.setTipoUsuario("Administrador");
                break;
            case "3":
                p.setTipoUsuario("Proveedor");
            }
        return p;
    }
    
    
}
