//Inicio de la app de burritos
import 'package:flutter/material.dart';
import 'package:paklan/principal/georgeus/header2.dart';
import 'package:paklan/principal/georgeus/categories.dart';
import 'package:paklan/principal/georgeus/burrito_list.dart';
import 'package:paklan/principal/georgeus/burrito_page.dart';

import 'package:paklan/inicioApp/homeApp.dart';
import 'package:paklan/carrito/list_page.dart';
import 'package:paklan/burritos-menu/brlp.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Cambiamos el color pedefinidio azul
      theme: ThemeData(
        primaryColor: Color(0xff3FACB3),
        //nuestras tarjetas seran color blanco ,esto por el plus add
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(color: Color(0xff3FACB3), centerTitle: true),
        //Cambiamos el color del fondo de la app,donde est el home
        bottomAppBarColor: Color(0xff3FACB3),
        //Color del floating bottom que es el del home
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.orange),
      ),
      home: Comida(),
      //Importamos la pagina burritopage
      routes: {BurritoPage.tag: (_) => BurritoPage()},
      //Quitamos la bandita esquina del debug
      debugShowCheckedModeBanner: false,
    );
  }
}

class Comida extends StatefulWidget {
  @override
  _ComidaState createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //Pinned es para solucionar el problema del scroll
            pinned: true,
            title: Text("Bienvenido"),
            //Ponemos el icono del menu
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
            //Ponemos el icono del carrito
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.credit_card),
              )
            ],
          ),
          Header(),
          Categories(),

          //Para tener dos listas de burritos-para combos
          BurritoList(1),
          BurritoList(2),
        ],
      ),
      //Es para que las letras se transparenten al pasar por la media luna
      extendBody: true,
      //Centramos el button de home
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //Icono home
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //auth.signOut();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()));
        },
        child: Icon(
          Icons.home,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        //Redondeamos el fondo de la app esto va junto con el cliprrect
        borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        child: Container(
          //Transparencia media luna
          color: Colors.black38,
          child: BottomAppBar(
            //Es para hacer ua media luna abajo del home
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                //Separamos
                Spacer(),
                //Icono del carrito
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  //Color de los icons
                  color: Colors.white,
                  onPressed: () {
                    //auth.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => list_page()));
                  },
                ),
                //Separamos
                Spacer(),
                Spacer(),
                //Icono de la notita.
                IconButton(
                  icon: Icon(Icons.menu_book_rounded),
                  //Color de los icons
                  color: Colors.white,
                  onPressed: () {
                    //auth.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BLP()));
                  },
                ),
                //Separamos
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
