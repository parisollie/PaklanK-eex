//Se usa y listo
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//Metódo para mantenimiento dentro de nuestra base de datos
public class ProveedorDAO implements CRUD {
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Proveedor co=new Proveedor();
    int r=0;
    //Se usa en ProductoForm
    //Metódo para buscar al proveedor
    public Proveedor listarID(int id){
        Proveedor c=new Proveedor();
       String sql="select * from proveedor where IdProv=?";
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            rs=ps.executeQuery();// ejecutamos la consulta
            while (rs.next()) { // Para ir buscando
                
                c.setId(rs.getInt(1));
                c.setRs(rs.getString(2));
                c.setNombres(rs.getString(3));
                c.setEdo(rs.getString(4));
                c.setCol(rs.getString(5));
                c.setCalle(rs.getString(6));
                c.setCp(rs.getString(7));
                c.setTel(rs.getString(8));
                
            }
        } catch (Exception e) {
        }
        return c;// Retornamos al objeto
    }
    
    //Se usa en ProveForma
    //Metodo para generar el id vendedor
    public String IdProveedor(){
        String idv="";
        // Max es para saber el maximo que tenemos en IdProv
        String sql="select max(IdProv) from proveedor";
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();// Consultamos la base de datos
            while (rs.next()) {
                idv=rs.getString(1);//idprov en la posicion 1
            }
        } catch (Exception e) {
        }
        return idv;//Retornamos el id ventas
    }
    //Se usa en ProveForma
    //Metodo para guardar detalle ventas
    public int GuardarDetalleTel(TelProv dv){
        String sql="insert into telpro(TelProv,IdProv)values(?,?)";
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);//Obtenemos los datos de la base
            ps.setString(1, dv.getTel());
            ps.setInt(2, dv.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;//Retornamos la respuesta
    }
    
    //Se usa en ProveForma
    @Override
    public List listar() {
        List<Proveedor> lista = new ArrayList<>();
        String sql = "select * from proveedor";//Consulta para cliente
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);//Consulta sql
            rs = ps.executeQuery();//Ejecuta la consulta
            
            while (rs.next()) {
                Proveedor c = new Proveedor();
                c.setId(rs.getInt(1));
                
                c.setRs(rs.getString(2));
                c.setNombres(rs.getString(3));
                c.setEdo(rs.getString(4));
                c.setCol(rs.getString(5));
                c.setCalle(rs.getString(6));
                c.setCp(rs.getString(7));
                c.setTel(rs.getString(8));
                lista.add(c);
            }
        } catch (Exception e) {
        }
        return lista;
        
    }
    //Se usa en ProveForma
    @Override
    public int add(Object[] o) {
        int r=0;
        String sql = "insert into proveedor(RsPro,NomPro,EdoPro,ColPro,CallePro,CpPro,TelPro)values(?,?,?,?,?,?,?)";
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);//la consulta sql
            ps.setObject(1, o[0]);//Enviamos los datos posicion 0
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
            ps.setObject(6, o[5]);
            ps.setObject(7, o[6]);
            
            r=ps.executeUpdate();//actualizar
        } catch (Exception e) {
        }
        return r;
    }
    //Se usa en ProveForma
    @Override
    public int actualizar(Object[] o) {
        int r=0;
       String sql="update proveedor set RsPro =?,NomPro=?,EdoPro=?,ColPro=?,CallePro=?,CpPro=?,TelPro=? where IdProv=?";//IdCliente=? ,que cliente actuliazaremos
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);
            ps.setObject(1, o[0]);//ps enviamos los datos
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
            ps.setObject(6, o[5]);
            ps.setObject(7, o[6]);
            ps.setObject(8, o[7]);//Se agrega uno mas
            
            r=ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;// retorna la variable rspuesta
    }
    //Se usa en ProveForma
    @Override
    public void eliminar(int id) {
         String sql="delete from proveedor where IdProv=?";//Recibimos todo el objeto
        try {
            con=cn.Conectar();
            ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void add(Producto v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
