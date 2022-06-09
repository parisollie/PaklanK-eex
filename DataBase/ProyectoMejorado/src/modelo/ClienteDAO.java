
/******************************************************************************
  Se usa y esta bien comentado, es el la guia de todos los demas de como
   funciona la logica en los que terminan con DAO
  ***************************************************************************** 
*/
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//Metódo para el mantenimiento dentro de nuestra base de datos.
//Le pasamos los metodos que creamos en CRUD
public class ClienteDAO implements CRUD {
     
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Cliente co=new Cliente();
    int r=0;
    
    //Metódo para buscar al cliente
    //Necesitamos el Dni para buscar al cliente en nuestra base.
    public Cliente listarID(String dni){
        Cliente c=new Cliente();
        //Buscamos  en la tabla cliente el Dni ,desde la base.
        //Le mandamos la consulta sql
       String sql="select * from cliente where Dni=?";
        try {
            // Conectamos con la base
            con=cn.Conectar();
            //Le pasamos la consulta sql
            ps=con.prepareStatement(sql);
            ps.setString(1, dni);
           //Ejecutamos la consulta
            rs=ps.executeQuery();
            //Para ir buscando dentro de la base
            while (rs.next()) { 
                
                c.setId(rs.getInt(1));
                c.setDni(rs.getInt(2));
                c.setRs(rs.getString(3));
                c.setNombres(rs.getString(4));
                c.setEdocliente(rs.getString(5));
                c.setColcliente(rs.getString(6));
                c.setCallecliente(rs.getString(7));
                c.setCp(rs.getString(8));
                c.setEmail(rs.getString(9));
            }
        } catch (Exception e) {
        }
        // Retornamos al obejeto
        return c;
    }
    //Se usa en VentasForm
    // Necesitamos el Dni para buscar al cliente
    public Cliente listarIDs(int id){
        Cliente c=new Cliente();
        //Mandamos la consulta sql
        // Buscamos  en la tabla cliente el Dni
       String sql="select * from cliente where IdCliente=?";
        try {
            //Conectamos con la base
            con=cn.Conectar();
            //Le pasamos la consulta sql
            ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            //Ejecutamos la consulta
            rs=ps.executeQuery();
            // Para ir buscando
            while (rs.next()) { 
                c.setId(rs.getInt(1));
                c.setDni(rs.getInt(2));
                c.setRs(rs.getString(3));
                c.setNombres(rs.getString(4));
                c.setEdocliente(rs.getString(5));
                c.setColcliente(rs.getString(6));
                c.setCallecliente(rs.getString(7));
                c.setCp(rs.getString(8));
                c.setEmail(rs.getString(9));  
            }
        } catch (Exception e) {
        }
        // Retornamos al objeto
        return c;
    }
     
    //Se usa en cliente.
    //Metodo para generar el id vendedor
    public String IdCliente(){
        String idv="";
        // Max es para saber el maximo que tenemos en IdClientes
        String sql="select max(IdCliente) from cliente";
        try {
            // Conectamos con la base
            con=cn.Conectar();
            //Le pasamos la consulta sql
            ps=con.prepareStatement(sql);
           //Ejecutamos la consulta
            rs=ps.executeQuery();
            while (rs.next()) {
                //idventas en la posicion 1
                idv=rs.getString(1);
            }
        } catch (Exception e) {
        }
        //Retornamos el id ventas
        return idv;
    }
    
    //Metodos de Mantenimiento CRUD
    //Se usa en cliente.
    @Override
    public List listar() {
        List<Cliente> lista = new ArrayList<>();
         //Le mandamos la consulta sql
        String sql = "select * from cliente";
        try {
            // Conectamos con la base
            con=cn.Conectar();
            //Le pasamos la consulta sql
            ps=con.prepareStatement(sql);
           //Ejecutamos la consulta
            rs=ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                
                c.setId(rs.getInt(1));
                c.setDni(rs.getInt(2));
                c.setRs(rs.getString(3));
                c.setNombres(rs.getString(4));
                c.setEdocliente(rs.getString(5));
                c.setColcliente(rs.getString(6));
                c.setCallecliente(rs.getString(7));
                c.setCp(rs.getString(8));
                c.setEmail(rs.getString(9));
                //Los agregamos dentro de la lists con e parametro c ...clientes
                lista.add(c);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    //Se usa en cliente.
   //Metodo para guardar detalle ventas
    public int GuardarDetalleEmail(Email dv){
        String sql="insert into email(Email,IdCliente)values(?,?)";
        try {
            // Conectamos con la base
            con=cn.Conectar();
            //Le pasamos la consulta sql
            ps=con.prepareStatement(sql);
            ps.setString(1, dv.getEmail());
            ps.setInt(2, dv.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;//Retornamos la respuesta
    }
    //Se usa en cliente.
    @Override
    public int add(Object[] o) { //[] es un arreglo
        int r=0;
        //Los de abajo debe ser exactamente con los que tiene la base en php
        //Le mandamos la consulta sql
        String sql = "insert into cliente(Dni,Rs,Nombres,EdoCliente,ColCliente,CalleCliente,CpCliente,EmailCliente)values(?,?,?,?,?,?,?,?)";
        try {
            // Conectamos con la base
            con=cn.Conectar();
            //La consulta sql
            ps=con.prepareStatement(sql);
            //Enviamos los datos posicion 0
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
            ps.setObject(6, o[5]);
            ps.setObject(7, o[6]);
            ps.setObject(8, o[7]);
            //Actualizamos
            r=ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    //Se usa en cliente.
    @Override
    public int actualizar(Object[] o) {
       int r=0;
       //IdCliente=? ,que cliente vamos actualizar
        //Mandamos la consulta que vamos hacer
        //Le mandamos la consulta sql
       String sql="update cliente set Dni=?,Rs=?,Nombres=?,EdoCliente=?,ColCliente=?,CalleCliente=?,CpCliente=?,EmailCliente=? where IdCliente=?";//IdCliente=? ,que cliente borraremos
        try {
            // Conectamos con la base
            con=cn.Conectar();
            //La consulta sql
            ps=con.prepareStatement(sql);
            //ps enviamos los datos
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            ps.setObject(4, o[3]);
            ps.setObject(5, o[4]);
            ps.setObject(6, o[5]);
            ps.setObject(7, o[6]);
            ps.setObject(8, o[7]);
            ps.setObject(9, o[8]);
            r=ps.executeUpdate();
        } catch (Exception e) {
        }
        //Retorna la variable rspuesta
        return r;
    }
    //Se usa en cliente.
    @Override
    public void eliminar(int id) {
         //Recibimos todo el objeto a eliminar.
        //Le mandamos la consulta sql
        String sql="delete from cliente where IdCliente=?";
        try {
            // Conectamos con la base
            con=cn.Conectar();
            //La consulta sql
            ps=con.prepareStatement(sql);
            // Buscamos el id del Cliente y lo eliminamos
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
