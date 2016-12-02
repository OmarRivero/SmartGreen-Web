package clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductosDAO {

    public List<Productos> BuscarTodos() throws SQLException {
        String query = "select * from productos;";
        try(Connection con = Conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Productos> list = new ArrayList<>();
            while(rs.next()) {				
                list.add(crearDTO(rs));
            }
            return list;
        }
    }
    public Productos BuscarPorProducto(String id) throws SQLException {
            String query = "select * from productos WHERE idProducto = ?";
            try(Connection con = Conection.getConnection()) {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                Productos p = null;
                if(rs.next()) {
                        p = crearDTO(rs);
                }
                return p;
            }
	}
    
    public Productos AñadirCarrito(String idUsuario,String idProducto,String cantidad) throws SQLException {
            String query = "call carrito(?,?,?,1);";
            try(Connection con = Conection.getConnection()) {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, idUsuario);
                ps.setString(2, idProducto);
                ps.setString(3, cantidad);
                ResultSet rs = ps.executeQuery();
                Productos p = null;
                if(rs.next()) {
                        p = crearDTO(rs);
                }
                return p;
            }
    }
    
    public List<ProductoCarrito> MisCompras(String idUsuario) throws SQLException {
            String query = "select * from carrito inner join productos on carrito.idProducto=productos.idProducto where idUsuario= ?;";
            try(Connection con = Conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            List<ProductoCarrito> list = new ArrayList<>();
            while(rs.next()) {				
                list.add(crearDTOx2(rs));
            }
            return list;
            }catch(Exception e){
                e.printStackTrace();
                return null;
            }
        }
    
    public void EliminarCarrito(String idUsuario) throws SQLException {
            String query = "call carrito(?,0,0,2);";
            try(Connection con = Conection.getConnection()) {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, idUsuario);
                ResultSet rs = ps.executeQuery();
            }
    }
    
    private Productos crearDTO(ResultSet rs) throws SQLException {
        Productos p = new Productos();
        p.setIdProducto(rs.getString("idProducto"));
        p.setNombre(rs.getString("nombre"));
        p.setPrecio(rs.getInt("precio"));
        p.setCantidad(rs.getInt("cantidad"));
        p.setDescripcion(rs.getString("descripcion"));
        p.setRutaImagen(rs.getString("rutaImagen"));
        return p;
    }
    
    private ProductoCarrito crearDTOx2(ResultSet rs) throws SQLException {
        ProductoCarrito p = new ProductoCarrito();
        p.setIdPedido(rs.getString("idPedido"));
        p.setIdUsuario(rs.getString("idUsuario"));
        p.setIdProducto(rs.getString("idProducto"));
        p.setCantidad(rs.getInt("cantidad"));
        p.setIdProducto(rs.getString("idProducto"));
        p.setNombre(rs.getString("nombre"));
        p.setPrecio(rs.getInt("precio"));
        p.setCantidad(rs.getInt("cantidad"));
        p.setDescripcion(rs.getString("descripcion"));
        p.setRutaImagen(rs.getString("rutaImagen"));
        return p;
    }
}
