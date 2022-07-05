// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'dart:convert';
import 'package:paklan/aplicaciones/comida/carrito/datos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/services.dart' show rootBundle;

class detail_page extends StatefulWidget {
  final int indice;
  final int seleccion;
  @override
  State<detail_page> createState() => _detail_pageState();

  detail_page(this.indice, this.seleccion);
}

class _detail_pageState extends State<detail_page> {
  late var contenido;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(contenido
              .asst[widget.seleccion].articulos[widget.indice].nombre)),
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Center(
            child: _myImage(
                widget.indice,
                contenido
                    .asst[widget.seleccion].articulos[widget.indice].imagen,
                400,
                400),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
                contenido.asst[widget.seleccion].articulos[widget.indice]
                    .descripcion,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ),
        ),
        Expanded(
          child: Center(
            child: RatingBar.builder(
              itemBuilder: (context, _) =>
                  Icon(Icons.star_border, color: Colors.amber),
              onRatingUpdate: (rating) {},
              initialRating: contenido
                  .asst[widget.seleccion].articulos[widget.indice].calificacion,
              ignoreGestures: true,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
                '\$ ${contenido.asst[widget.seleccion].articulos[widget.indice].precio} MXN',
                style: TextStyle(fontSize: 20, color: Colors.green)),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  if (counter > 0) {
                    setState(() {
                      counter--;
                    });
                  }
                },
                child: Icon(
                  Icons.indeterminate_check_box_outlined,
                  size: 20.0,
                ),
              ),
              Text(
                ' $counter ',
                style: TextStyle(
                  color: Colors.blue[200],
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Icon(
                  Icons.add_box_outlined,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context, [
                  contenido
                      .asst[widget.seleccion].articulos[widget.indice].nombre,
                  contenido
                      .asst[widget.seleccion].articulos[widget.indice].precio,
                  counter
                ]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 28.0,
                  ),
                  Text(
                    ' Añadir ',
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _myImage(int index, String image, double w, double h) {
    return Image.asset(
      image,
      width: w,
      height: h,
    );
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

  void incrementCounter(bool incremento) {
    if (incremento) {
      setState(() {
        counter++;
      });
    } else {
      setState(() {
        counter--;
      });
    }
  }
}
