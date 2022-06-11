//Esto es para las cajitas de arriba
import 'package:flutter/material.dart';
import 'package:paklan/main.dart';
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    //El numero de items de comida rapida
    int items =10;
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        //Separamos las cajitas de los burritos
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          //El numero de items de comida rapida
          itemCount:items,
           //Para que los iconos de las burritos vayan en sentido horizontal
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    height:90,
                    width:90,
                    margin: EdgeInsets.only(
                      //Espacio en las cajitas de la comida rapida
                      left: index == 0 ? 20 : 0,
                      right:20,
                    ),
                    child:GestureDetector(
                      //Para cambiar de color al momento de seleccionar
                      onTap:(){
                        setState(() {
                        currentSelectedItem =index;
                         });
                      },
                      child: Card(
                        color:index == currentSelectedItem 
                          ? Colors.black.withOpacity(0.7)
                          : Colors.white,
                    
                        child: Icon(
                            Icons.fastfood,
                            color:index == currentSelectedItem 
                            ? Colors.white 
                            : Colors.black.withOpacity(0.7),//Opacidad de las cajitas
                          ),
                          //Elevamos las cajitas
                          elevation: 3,
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          ),
                      ),
                    ),
                  )
                ],
              ),
              //Texto de las cajitas
              Positioned(
                //El bottom pasa el nombre a la parte de abajo
                bottom: 0,
                child: Container(
                  //Separacion del texto de las cajitas
                  margin:EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                      right:20, 
                  ),
                  width: 90,
                  child:Row(
                    children: [
                       Spacer(),
                       Text("Burrito"),
                       Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
