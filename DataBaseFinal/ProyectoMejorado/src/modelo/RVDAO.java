// Se usa y listo
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//Metódo para mantenimiento dentro de nuestra base de datos
public class RVDAO implements CRUD {
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Proveedor co=new Proveedor();
    int r=0;
   
    //Se usa en REGISTERFORM
    @Override
    public int add(Object[] o) {
        int r=0;
        String sql = "insert into registrar(CodBarras,IdVentas,PrecioVenta,Cantidad,Pago)values(?,?,?,?,?)";
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);//la consulta sql
            ps.setObject(1, o[0]);//Enviamos los datos posicion 0
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
            
            
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
    
    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet.");
        
    }

    
}
