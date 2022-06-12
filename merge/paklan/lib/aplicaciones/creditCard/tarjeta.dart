//Tarjeta
import 'package:flutter/material.dart';
import 'package:paklan/aplicaciones/creditCard/widgets/formulario_pago.dart';

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
        appBar: AppBar(
          title: const Text('Tu tarjeta'),
        ),
        body: FormCard(),
      ),
    );
  }
}
