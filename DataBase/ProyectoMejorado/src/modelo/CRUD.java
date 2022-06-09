//Se usa
//CRUD es nuestra interface , donde declararemos todos los metódos que se declarán
//en un mantenimiento.
package modelo;

import java.util.List;
//Dentro del metódo crud usaremos todas las variables para dar mantenimiento
public interface CRUD {
    public List listar();
    //Es un arreglo [].
    public int add(Object[] o); 
    public int actualizar(Object[] o);
    public void eliminar(int id);
    
}
