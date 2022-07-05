// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, use_key_in_widget_constructors, prefer_const_declarations, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:paklan/aplicaciones/comida/carrito/cart_page.dart';
import 'package:paklan/aplicaciones/comida/carrito/datos.dart';
import 'package:paklan/aplicaciones/comida/carrito/detail_page.dart';
import 'package:flutter/services.dart' show rootBundle;

class list_page extends StatefulWidget {
  static String id = "list_page";

  @override
  State<list_page> createState() => _list_pageState();
}

class _list_pageState extends State<list_page> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  var contenido;
  int seleccion = 0;
  List<carrito> lista = <carrito>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: TextButton(
            child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cart_page(lista),
                  ));
            },
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                autofocus: true,
                onPressed: () {
                  setState(() {
                    seleccion = 0;
                  });
                },
                child: Text(
                  contenido.asst[0].nombre,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    seleccion = 1;
                  });
                },
                child: Text(
                  contenido.asst[1].nombre,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: contenido.asst[seleccion].articulos.length,
          itemBuilder: (context, index) {
            return _cardArticulos(
                context,
                index,
                seleccion,
                contenido.asst[seleccion].articulos[index].nombre,
                contenido.asst[seleccion].articulos[index].imagen,
                contenido.asst[seleccion].articulos[index].calificacion,
                contenido.asst[seleccion].articulos[index].precio);
          },
        ),
      ),
    );
  }

  Widget _cardArticulos(BuildContext context, int index, int seleccion,
      String nombre, String image, double rate, double precio) {
    return Card(
      elevation: 20.0,
      color: Colors.teal,
      shadowColor: Colors.teal[900],
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        minLeadingWidth: 60,
        leading: _myImage(index, image, 60, 60),
        subtitle: Container(
          decoration: BoxDecoration(
            color: Colors.teal[400],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nombre,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$ $precio MXN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBar.builder(
                itemBuilder: (context, _) =>
                    Icon(Icons.star_rate, color: Colors.amber),
                onRatingUpdate: (rating) {},
                initialRating: rate,
                itemSize: 15,
                ignoreGestures: true,
              ),
              TextButton(
                onPressed: () {
                  comprar(context, index);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.blue[100],
                      size: 18.0,
                    ),
                    Text(
                      ' Añadir ',
                      style: TextStyle(
                        color: Colors.blue[100],
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myImage(int index, String image, double w, double h) {
    return Image.asset(
      image,
      width: w,
      height: h,
    );
  }

  void comprar(BuildContext context, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => detail_page(index, seleccion),
      ),
    );
    if (result != null) {
      if (result[2] > 0) {
        lista.add(carrito(result[0], result[1], result[2]));
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                  '${result[2]} de ${result[0]} se añadieron al carrito :)'),
            ),
          );
      }
    }
  }

  void getData() async {
    final jsonMap = jsonDecode(await getJson());
    final datos0 = datos.fromJson(jsonMap);
    setState(() {
      contenido = datos0;
    });
  }

  Future<String> getJson() {
    return rootBundle.loadString('Assets/docs/datos.json');
  }
}
