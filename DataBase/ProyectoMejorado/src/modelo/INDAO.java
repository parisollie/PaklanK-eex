//Se usa y listo
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class INDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    //Se usa en REGISTERFORM
    public int actualizarStock(int cant, int stock) {
        //Le mandamos la consulta sql
        String sql = "update inventario set Stock=? where CB=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);

            ps.setInt(1, cant);
            ps.setInt(2, stock);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    //Se usa en REGISTERFORM
    public Inv listarID(int id) {
        Inv p = new Inv();
        //Le mandamos la consulta sql
        String sql = "select * from inventario where CB=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);
            // 1 es la columna de nuestra base datos osea el id de CB
            ps.setInt(1, id);
            rs = ps.executeQuery();
            //Recorremos toda la tabla
            while (rs.next()) { 
                p.setIdc(rs.getInt(1));
                p.setCod(rs.getInt(2));
                p.setIp(rs.getInt(3));

                p.setPc(rs.getDouble(4));
                p.setPl(rs.getDouble(5));

                p.setFecha(rs.getString(6));
                p.setStock(rs.getInt(7));

            }
        } catch (Exception e) {
        }
        //Retornamos el id de CB
        return p;
    }

    //Se usa en InventarioForm
    public int actualizar(Inv in) {
        //Le mandamos la consulta sql
        String sql = "update inventario set CB=?,IdPro=?,PreCom=?,PreVen=?,Fecha=?,Stock=? where IDI=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);
            //Y actualizamos
            ps.setInt(1, in.getCod());
            ps.setInt(2, in.getIp());
            ps.setDouble(3, in.getPc());
            ps.setDouble(4, in.getPl());
            ps.setString(5, in.getFecha());
            ps.setInt(6, in.getStock());
            ps.setInt(7, in.getIdc());

            r = ps.executeUpdate();

        } catch (Exception e) {
        }
        return r;
    }

    //Se usa en VentasForm
    public int actualizarventas(Ventas in) {
        //Le mandamos la consulta sql
        String sql = "update venta set IdCliente=?,IdVendedor=?,Fecha=? where IdVenta=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);
            //Y actualizamos
            ps.setInt(1, in.getCl());
            ps.setInt(2, in.getVendedor());
            ps.setString(3, in.getFeha());
            ps.setInt(4, in.getVn());

            r = ps.executeUpdate();

        } catch (Exception e) {
        }
        return r;
    }

    //Se usa en REFORM
    public int actualizarReg(Registro in) {
        //Le mandamos la consulta sql
        String sql = "update registrarpago set IdVenta=?,SubTotal=?,IVA=?,Total=? where IdReg=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);
            //Y actualizamos
            ps.setInt(1, in.getIdv());
            ps.setDouble(2, in.getSub());
            ps.setDouble(3, in.getIva());
            ps.setDouble(4, in.getTotal());
            ps.setInt(5, in.getReg());

            r = ps.executeUpdate();

        } catch (Exception e) {
        }
        return r;
    }

    //Se usa en InventarioForm
    public void eliminar(int id) {
        //Le mandamos la consulta sql
        String sql = "delete from inventario where IDI=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);
            //Le mandamos el id en la posicion 1 y lo eliminamos
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //Se usa en Reform
    public void eliminarReg(int id) {
        //Le mandamos la consulta sql
        String sql = "delete from registrarpago where IdReg=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);
            //Le mandamos el id en la posicion 1 y lo eliminamos
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //Se usa en VentasForm
    public void eliminarVen(int id) {
        //Le mandamos la consulta sql
        String sql = "delete from venta where IdVenta=?";
        try {
            // Conectamos la base
            con = cn.Conectar();
            //Le pasamos la consulta sql
            ps = con.prepareStatement(sql);
            //Le mandamos el id en la posicion 1 y lo eliminamos
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
