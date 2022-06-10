import 'package:flutter/material.dart';
import 'package:paklan/models/productos_model.dart';
import 'package:paklan/pages/otra_pagina.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:paklan/pages/pedido_lista.dart';
import 'package:paklan/pages/pedList.dart';
import 'package:paklan/qr/qr.dart';
//import 'package:paklan/tarjeta/tarjeta.dart';
import 'package:paklan/novedades/BurritoListPage.dart';
import 'package:paklan/condiciones/pages/conditions.dart';
import 'package:paklan/camimg/camera.dart';
import 'package:paklan/tarjeta/tar.dart';

import 'package:paklan/principal/home.dart';
import 'package:paklan/drawer/NabBar.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF21BFBD), centerTitle: true),
        primaryColor: Color.fromARGB(255, 29, 214, 84),
      ),
      home: const MyHomePage(title: 'App de compras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
 // List<ProductosModel> _productosModel = List<ProductosModel>();

 List<ProductosModel> _productosModel = List<ProductosModel>.empty(growable: true);

 List<ProductosModel> _listaCarro = List<ProductosModel>.empty(growable: true);

 @override
  void initState() {
    super.initState();
    _productosDb();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 248, 109),
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Bienvenido Ingeniero(a)"),
        //title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 38,
                  ),
                  if (_listaCarro.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _listaCarro.length.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_listaCarro.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listaCarro),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      
      


      //////////////////////////////////////////////////////////////////////
      
      body: _cuadroProductos(),
    );
  }

  GridView _cuadroProductos() {
    return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _productosModel.length,
      itemBuilder: (context, index) {
        final String imagen = _productosModel[index].image;
        var item = _productosModel[index];
        return Card(
            elevation: 4.0,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: new Image.asset("Assets/images/$imagen",
                          fit: BoxFit.contain),
                    ),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          item.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                            bottom: 8.0,
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              child: (!_listaCarro.contains(item))
                                  ? Icon(
                                      Icons.shopping_cart,
                                      color: Colors.orange,
                                      size: 38,
                                    )
                                  : Icon(
                                      Icons.shopping_cart,
                                      color: Color.fromARGB(255, 42, 208, 214),
                                      size: 38,
                                    ),
                              onTap: () {
                                setState(() {
                                  if (!_listaCarro.contains(item))
                                    _listaCarro.add(item);
                                  else
                                    _listaCarro.remove(item);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ));
      },
    );
  }
//////////////////////////////////////////////////////////////////////

    void _productosDb() {
    var list = <ProductosModel>[
      ProductosModel(
        name: 'AMIBA 2',
        image: 'tar1.png',
        price: 1500,
      ),
      ProductosModel(
        name: 'EMP240T100C5',
        image: 'tar2.png',
        price: 1750,
      ),
      ProductosModel(
        name: 'CYCLONE IV',
        image: 'tar3.png',
        price: 1278,
      ),
      ProductosModel(
        name: 'DE10-LITE',
        image: 'tar4.png',
        price: 1907,
      ),
      ProductosModel(
        name: 'MAX 1000',
        image: 'tar5.png',
        price: 1178,
      ),
      ProductosModel(
        name: 'MAXII_EPM 240',
        image: 'tar6.png',
        price: 1400,
      ),
      ProductosModel(
        name: 'CYCLONE II',
        image: 'tar7.png',
        price: 1500,
      ),
      ProductosModel(
        name: 'Raspberry Pi',
        image: 'tar8.png',
        price: 1887,
      ),
    ];

    setState(() {
      _productosModel = list;
    });
  }

  

  //////////////////////////////////////////////////////////////////////
}
