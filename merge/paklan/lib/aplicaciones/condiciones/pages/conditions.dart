import 'package:flutter/material.dart';

import 'package:paklan/letras/detailsPage.dart';
import 'package:paklan/inicioApp/homeApp.dart';

class Conditions extends StatefulWidget {
  @override
  State<Conditions> createState() => _ConditionsState();
}

class _ConditionsState extends State<Conditions> {
  @override
  Widget build(BuildContext context) {
    final shape = StadiumBorder();
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Terminos Y',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Condiciones',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 60.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            //ovaladoBLanco
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(175.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                Text(
                  "Para usar esta app es necesario que aceptes los terminos y condiciones.Para usar esta app es necesario que aceptes los terminos y condiciones. Para usar esta app es necesario que aceptes los terminos y condiciones.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                //Separamos los textos
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Para usar esta app es necesario que aceptes los terminos y condiciones.Para usar esta app es necesario que aceptes los terminos y condiciones. Para usar esta app es necesario que aceptes los terminos y condiciones.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                //Separamos los textos
                SizedBox(
                  height: 25,
                ),
                Material(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // background
                      onPrimary: Colors.yellowAccent, // foreground
                    ),
                    child: Row(
                      //Centramos el boton
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Acepto todo",
                          style: TextStyle(fontSize: 20),
                        ),
                        //Ponemos la flechita para regresar a la pagina principal
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    onPressed: () => {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MyApp()))
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      heroTag: imgPath, foodName: foodName, foodPrice: price)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {})
              ],
            )));
  }
}
