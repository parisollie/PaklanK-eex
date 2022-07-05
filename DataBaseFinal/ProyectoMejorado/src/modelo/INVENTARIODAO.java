//Se usa y listo

package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//Metódo para mantenimiento dentro de nuestra base de datos
public class INVENTARIODAO implements CRUD {

    Connection con;
    Inv in = new Inv();
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
   //Se usa en InventarioForm
    @Override
    public List listar() {

        List<Inv> lista = new ArrayList<>();
        String sql = "select * from inventario";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);//Consulta sql
            rs = ps.executeQuery();//Ejecuta la onsulta
            while (rs.next()) {
                Inv c = new Inv();

                c.setIdc(rs.getInt(1));
                c.setCod(rs.getInt(2));
                c.setIp(rs.getInt(3));
                c.setPc(rs.getDouble(4));
                c.setPl(rs.getDouble(5));
                c.setFecha(rs.getString(6));
                c.setStock(rs.getInt(7));
                //los agregamos dentro de la lista con e parametro c ...clientes
                lista.add(c);
            }
        } catch (Exception e) {

        }
        return lista;
    }
    //Agregamos dentro de inventtario en nuestra base
    //Se usa en InventarioForm
    @Override
    public int add(Object[] o) {
        int r = 0;
        String sql = "insert into inventario(CB, IdPro,PreCom,PreVen,Fecha,Stock)values(?,?,?,?,?,?)";
    
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);//la consulta sql
            ps.setObject(1, o[0]);//Enviamos los datos posicion 0
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
            ps.setObject(6, o[5]);
            //actualizar
            r = ps.executeUpdate();
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

}
