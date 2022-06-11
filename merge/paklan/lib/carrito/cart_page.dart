// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:paklan/carrito/datos.dart';
import 'package:paklan/pages/pagado.dart';


class cart_page extends StatelessWidget {
  final List<carrito> lista;
  //final List lista;

  cart_page(this.lista);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Carrito'),
        ),
        body: ListView.builder(
          itemCount: lista.length + 1,
          itemBuilder: (context, index) {
            return _listArticulos(index);
          },
        ),
        floatingActionButton: TextButton(
          onPressed: () {
            Navigator.push(
            //Navigator nos pide el contexto
            context,
            //Y nos pide el widget a utilizar
            MaterialPageRoute(builder: (context)=>Pagado()));
          },
          child: Text('Comprar', style: TextStyle(fontSize: 20)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _listArticulos(int index) {
    if (index == lista.length) {
      return Column(
        children: [
          Card(
            elevation: 10.0,
            color: Colors.teal[100],
            shadowColor: Colors.teal[900],
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  '  ',
                  textAlign: TextAlign.center,
                )),
                Expanded(
                  child: Text(' Total: '),
                  flex: 3,
                ),
                Expanded(child: Text(' \$ ${calculoTotal()} MXN'), flex: 2),
              ],
            ),
          ),
        ],
      );
    } else {
      return Card(
        elevation: 10.0,
        color: Colors.teal[100],
        shadowColor: Colors.teal[900],
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              '${lista[index].cantidad}',
              textAlign: TextAlign.center,
            )),
            Expanded(
              child: Text(lista[index].nombre),
              flex: 3,
            ),
            Expanded(
                child: Text(
                    ' \$ ${lista[index].precio * lista[index].cantidad} MXN'),
                flex: 2),
          ],
        ),
      );
    }
  }

  double calculoTotal() {
    double cont = 0.0;
    for (int i = 0; i < lista.length; i++) {
      cont += lista[i].precio * lista[i].cantidad;
    }
    return cont;
  }
}
