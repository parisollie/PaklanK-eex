//Paginas de termnos y condiciones
import 'package:flutter/material.dart';

import 'package:paklan/main.dart';

class Pagina02 extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Terminos y condiciones"),
        ),
        body: Padding(
          //Engrapamos la columna en padding ,para que tengamos un borde en las orrillas
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Terminos y condiciones",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold ),),
              SizedBox(height: 20,),
              Text(
                "Para usar esta app es necesario que aceptes los terminos y condiciones.Para usar esta app es necesario que aceptes los terminos y condiciones. Para usar esta app es necesario que aceptes los terminos y condiciones.",style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                //Separamos los textos
                SizedBox(height: 15,),
                Text(
                "Para usar esta app es necesario que aceptes los terminos y condiciones.Para usar esta app es necesario que aceptes los terminos y condiciones. Para usar esta app es necesario que aceptes los terminos y condiciones.",style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                //Separamos los textos
                SizedBox(height: 15,),    
                Material(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,// background
                      onPrimary: Colors.yellowAccent, // foreground
                      ),
                      child: Row(
                        //Centramos el boton
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Acepto todo",style:TextStyle(fontSize: 20),),
                          //Ponemos la flechita para regresar a la pagina principal
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      onPressed: ()=>{
                         Navigator.of(context).pushReplacement(MaterialPageRoute(
                         builder: (context) => MyApp()))                   
                      },
                    ),
                )
            ],
          ),
        ),
      );    
  }
}