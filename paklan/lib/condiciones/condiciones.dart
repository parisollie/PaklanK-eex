//Pagina para las condiciones

import 'package:flutter/material.dart';
import 'package:paklan/condiciones/pages/pagina02.dart';
//State full widget
class Condiciones extends StatefulWidget {
  
  @override
  _CondicionesState createState() => _CondicionesState();
}

class _CondicionesState extends State<Condiciones> {

 
  @override
  Widget build(BuildContext context) {
    //se crea para el botton gradiente
    final shape = StadiumBorder();
    return Scaffold(
      appBar: AppBar(
        title: Text("Terminos y condiciones"),
      ),
       body: Center(
         //Centramos la columna para que el boton quede en medio
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text(
               'Terminos y condiciones.',
               style:TextStyle(
                 fontSize:30,
                 fontWeight:FontWeight.bold,
                 fontStyle: FontStyle.italic,
                 fontFamily: 'Open Sans',
               ),
              ),
              //Para que se despegue el boton de los campos
              SizedBox(height:30,),
              //Envolvemos al container en widget Material
              Material(
                color:Colors.transparent,
                shape:shape,
                elevation:8,
                child: Container(
                  decoration: ShapeDecoration(
                    shape: shape,
                    gradient:LinearGradient(
                      //begin:Alignment.topCenter,
                      //end:Alignment.bottomCenter,
                      colors:[
                        Colors.greenAccent, 
                        Colors.indigo,
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () =>{
                      
                      //Para irnos a la otra pagina
                      Navigator.push(
                        //Navigator nos pide el contexto
                        context,
                        //Y nos pide el widget a utilizar
                        MaterialPageRoute(builder: (context)=>Pagina02())
                        )
                    }, 
                  style: ElevatedButton.styleFrom(
                    //desactivate color and shadow
                    tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                    primary:Colors.transparent,
                    shadowColor:Colors.transparent,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("Click me!", style:TextStyle(fontSize:20)),              
                  ),
                ),
              )
            ], 
          ),
        ),
    );
  }
}