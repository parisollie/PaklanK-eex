//Se usa 
// Clases para buscar los Id
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//Metódo para mantenimiento dentro de nuestra base de datos
public class LISTASDAO implements CRUD {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Cliente co = new Cliente();
    int r = 0;

    //Se usa en VentasForm
    //Necesitamos el id para buscar al vendedor en la base
    public Vendedor listarIDs(int id) {
        Vendedor v = new Vendedor();
        // Buscamos  en la tabla  vendedor el id
        String sql = "select * from vendedor where IdVendedor=?";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();// ejecutamos la consulta
            while (rs.next()) { // Para ir buscando

                v.setId(rs.getInt(1));
                v.setDni(rs.getString(2));
                v.setNom(rs.getString(3));
                v.setTel(rs.getString(4));
                v.setEstado(rs.getString(5));
                v.setUser(rs.getString(6));
            }
        } catch (Exception e) {
        }
        // Retornamos al obejeto
        return v;
    }

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //Agregamos a producto en bases
    //Se usa en ProductoForm
    @Override
    public int add(Object[] o) {
        int r = 0;
        String sql = "insert into producto(IdCategoria,IdProv,Marca,Descripcion,Precio)values(?,?,?,?,?)";

        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);//la consulta sql
            ps.setObject(1, o[0]);//Enviamos los datos posicion 0
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
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
