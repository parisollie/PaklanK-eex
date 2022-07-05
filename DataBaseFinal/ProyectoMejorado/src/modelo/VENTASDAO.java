//Se usa y listo
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//Metódo para mantenimiento dentro de nuestra base de datos
public class VENTASDAO implements CRUD {
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Proveedor co=new Proveedor();
    int r=0;
    //SE usa en RegisterForm
    //Se usa en REFORM
    //Metódo para buscar al proveedor
    public Ventas listarID(int id){
        Ventas c=new Ventas();
        
       String sql="select * from venta where IdVenta=?";
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            rs=ps.executeQuery();// ejecutamos la consulta
            while (rs.next()) { // Para ir buscando
                
                c.setVn(rs.getInt(1));
                c.setCl(rs.getInt(2));
                c.setVendedor(rs.getInt(3));
                c.setFeha(rs.getString(4));
                
                
            }
        } catch (Exception e) {
        }
        return c;// Retornamos al objeto
    }
    
   
    
    //Se usa en VentasForm
    @Override
    public List listar() {
        List<Ventas> lista = new ArrayList<>();
        String sql = "select * from venta";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);//Consulta sql
            rs = ps.executeQuery();//Ejecuta la consulta
            
            while (rs.next()) {
                Ventas c = new Ventas();
                c.setVn(rs.getInt(1));
                c.setCl(rs.getInt(2));
                c.setVendedor(rs.getInt(3));
                c.setFeha(rs.getString(4));
                
                lista.add(c);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    
    //Se usa en VentasForm
    @Override
    public int add(Object[] o) {
        int r=0;
        String sql="insert into venta(IdCliente,IdVendedor,Fecha)values(?,?,?)";
        
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);//la consulta sql
            
            ps.setObject(1, o[0]);//Enviamos los datos posicion 0
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);

            r=ps.executeUpdate();//actualizar
        } catch (Exception e) {
        }
        return r;
    }
    
    public void add(Producto v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     @Override
    public int actualizar(Object[] o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}

