import 'package:flutter/material.dart';

import 'package:paklan/models/productos_model.dart';
import 'package:paklan/pagado/pagado.dart';




class Cart extends StatefulWidget {
  final List<ProductosModel> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;

  List<ProductosModel> _cart;

  Container pagoTotal(List<ProductosModel> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Color.fromARGB(156, 188, 187, 187),
      child: Row(
        children: <Widget>[
          // Text("Total:  \$${valorTotal(_cart)}",
          //Text("Total:  ",
          Text("Total:  \$${valorTotal(_cart)} Mx",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black))
        ],
      ),
    );
  }

  //Funcion para el listado de prouctos para que sepa el valor total de los productos
  String valorTotal(List<ProductosModel> listaProductos) {
    double total = 0.0;

    for (int i = 0; i < listaProductos.length; i++) {
      total = total + listaProductos[i].price * listaProductos[i].quantity;
    }
    return total.toStringAsFixed(2);
  }

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
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _cart.length;
                    });
                  },
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.shop_2_rounded),
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
                Text('Tus',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Compras',
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
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (_enabled && _firstScroll) {
                        _scrollController.jumpTo(
                            _scrollController.position.pixels -
                                details.delta.dy);
                      }
                    },
                    onVerticalDragEnd: (_) {
                      if (_enabled) _firstScroll = false;
                    },
                    child: SingleChildScrollView(
                        child: Column(
                      children: <Widget>[
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _cart.length,
                          itemBuilder: (context, index) {
                            final String imagen = _cart[index].image;
                            var item = _cart[index];
                            //item.quantity = 0;
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13.0, vertical: 2.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              child: new Image.asset(
                                                  //Simbolo de pesos para hacer el llamado product model
                                                  "Assets/images/$imagen",
                                                  fit: BoxFit.contain),
                                            ),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(item.name,
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0,
                                                      color: Colors.black)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 120,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red[600],
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 6.0,
                                                            color: Colors.blue,
                                                            offset: Offset(
                                                                0.0, 1.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(50.0),
                                                        )),
                                                    margin: EdgeInsets.only(
                                                        top: 20.0),
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: new Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 8.0,
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                              Icons.remove),
                                                          onPressed: () {
                                                            _removeProduct(
                                                                index);
                                                            valorTotal(_cart);
                                                            // print(_cart);
                                                          },
                                                          color: Colors.yellow,
                                                        ),
                                                        Text(
                                                            '${_cart[index].quantity}',
                                                            style: new TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 22.0,
                                                                color: Colors
                                                                    .white)),
                                                        IconButton(
                                                          icon: Icon(Icons.add),
                                                          onPressed: () {
                                                            _addProduct(index);
                                                            valorTotal(_cart);
                                                          },
                                                          color: Colors
                                                              .yellow, // print(_cart);
                                                        ),
                                                        SizedBox(
                                                          height: 8.0,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 38.0,
                                          ),
                                          Text(item.price.toString(),
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.0,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.purple,
                                )
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        pagoTotal(_cart),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          height: 100,
                          width: 200,
                          padding: EdgeInsets.only(top: 50),
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: ShapeDecoration(
                              shape: shape,
                              gradient: LinearGradient(
                                //begin:Alignment.topCenter,
                                //end:Alignment.bottomCenter,
                                colors: [
                                  Colors.greenAccent,
                                  Colors.indigo,
                                ],
                              ),
                            ),
                            child: ElevatedButton(
                              //textColor: Colors.white,
                              //color: Colors.green,
                              style: ElevatedButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),

                              onPressed: () => {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Pagado()))
                                /*
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => FancyDialog(
                                title: "ACEPTA PAGAR LA COMPRA",
                                descreption: "Bien pues pague :), Click OK",
                                animationType: FancyAnimation.BOTTOM_TOP,
                                theme: FancyTheme.FANCY,
                                gifPath:
                                    FancyGif.MOVE_FORWARD, //'./assets/walp.png',
                                okFun: () => {print("it's working :)")},
                              )
                      )*/
                              },
                              child: Text("PAGAR"),
                              //shape: new RoundedRectangleBorder(
                              //borderRadius: new BorderRadius.circular(30.0),
                              //),
                            ),
                          ),
                        ),
                      ],
                    ))),
              ],
            ),
          )
        ],
      ),
    );
  }

  _addProduct(int index) {
    setState(() {
      _cart[index].quantity++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      _cart[index].quantity--;
    });
  }
}
