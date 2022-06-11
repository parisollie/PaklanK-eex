//Tarjeta
import 'package:flutter/material.dart';
import 'package:paklan/tarjeta/widgets/formulario_pago.dart';

class Tarjeta extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xff3FACB3), centerTitle: true),
        //Cambiamos el color del fondo de la app,donde est el home
        bottomAppBarColor: Color(0xff3FACB3),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                          icon: Icon(Icons.money_sharp),
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
                Text('Tu',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Tarjeta',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
               SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height - 135.0,
            //ovaladoBLanco
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(175.0)),
            ),
            
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 1.0, right: 10.0),
              
              children: <Widget>[
                SizedBox(height: 60,),
                
                FormCard(),
                
               
                
              ],


            ),
          )
        ],

      ),

      ),
    );
  }
}