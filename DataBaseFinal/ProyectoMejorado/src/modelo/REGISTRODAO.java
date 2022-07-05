//Se usa y listo
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//Metódo para mantenimiento dentro de nuestra base de datos

public class REGISTRODAO implements CRUD {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Proveedor co = new Proveedor();
    int r = 0;

    //Se usa en REFORM
    @Override
    public List listar() {

        List<Registro> lista = new ArrayList<>();
        String sql = "select * from registrarpago";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);//Consulta sql
            rs = ps.executeQuery();//Ejecuta la consulta
            while (rs.next()) {

                Registro c = new Registro();

                c.setReg(rs.getInt(1));
                c.setIdv(rs.getInt(2));

                c.setSub(rs.getDouble(3));
                c.setIva(rs.getDouble(4));
                c.setTotal(rs.getDouble(5));
                lista.add(c);
            }
        } catch (Exception e) {

        }
        return lista;
    }

    //Se usa en REFORM
    @Override
    public int add(Object[] o) {
        int r = 0;
        String sql = "insert into registrarpago(IdVenta,SubTotal,IVA,Total)values(?,?,?,?)";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);//la consulta sql
            ps.setObject(1, o[0]);//Enviamos los datos posicion 0
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);

            r = ps.executeUpdate();//actualizar
        } catch (Exception e) {
        }
        return r;
    }

    @Override
    public int actualizar(Object[] o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void add(Producto v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //Se usa en registerForm
    //Es  para eliminar Idventa
    public void eliminars(int id) {
        String sql = "delete from venta where IdVenta=?";//Recibimos todo el objeto
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
