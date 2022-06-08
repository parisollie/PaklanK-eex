import 'package:flutter/material.dart';
import 'burrito_page.dart';

class BurritoList extends StatefulWidget {
  //Variables para nuestras dos filas del burrito
  final int row;
  
  BurritoList(int row):
  this.row = row;
  

  @override
  _BurritoListState createState() => _BurritoListState();
}

class _BurritoListState extends State<BurritoList> {

  @override
  Widget build(BuildContext context) {
    //El conteo de los combos
    int items = 10;
    //Ponemos las imágenes de las hamburguesas
     Widget combo = Container(
      height: 120,
      child: Image.asset("images/combo.png"),
    );

    Widget combo2 = Container(
      height: 170,
      width: 130,
      child: Image.asset("images/combo2.png"),
    );

    return SliverToBoxAdapter(
      child:Container(
        //Para que no haya un bug,pero lo hace para que podamos hacer scroll hacia abajo
        height: widget.row == 2 ? 330 : 240,
        //se separa de las cajitas 
        margin: EdgeInsets.only(top: 10),
        
        child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context,index){
            //Variables para las imagenes
            //para que se muevan a la izquierda y derecha
            bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
            return Stack(
              children: [
                Container(
                  height: 240,
                  width: 220,
                  margin: EdgeInsets.only(
                    //espacio en los contenedores de las hamburguesas
                    left:20,
                    right: index == items ? 20 : 0,
                  ),
                  child:GestureDetector(
                    onTap: () {
                      //TODO NAVIGATOR
                      Navigator.of(context).pushNamed(BurritoPage.tag);
                    },
                    child: Card(
                      //Para las tarjetas
                      color:Theme.of(context).primaryColor,
                      child:Padding(
                        //para tener padding en el texto
                        padding: const EdgeInsets.only(top:20),
                        child: Column(
                          children: [
                            Text(
                              //"Burrito",
                              //Para que vayan uno y uno de cada burrito
                               reverse ? "Combo Burrito 1": "Combo Burrito 2",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:20,
                                fontWeight:FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            //El row esta afuera del contenedor verde
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  "25.95 \$ Mex",
                                  style: TextStyle(
                                    color:Colors.white,
                                    fontWeight:FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  //Contenedor del (+ add)
                                  width:50,
                                  height:50,
                                  child: Card(

                                    shape:RoundedRectangleBorder(
                                      borderRadius:BorderRadius.circular(10),
                                    ),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            )
        
                          ],
                        ),
                      ),
                      //Elevamos el bottom de la tarjeta,para que se vea mejor
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),                        
                      ),
                    ),
                  ),
                ),
                 //aqui ponemos las fotos
                 Positioned(
                   //Es para poner los burritos como a la mitad
                   top: reverse ? 50 :50,
                   child: GestureDetector(
                     onTap:(){
                     //Todo navigator
                     Navigator.of(context).pushNamed(BurritoPage.tag);
                    },
                   child: reverse ? combo2 : combo,
                  ),
                ),
              ],
            );
         },
        ),
      ) ,
    );
  }
}
