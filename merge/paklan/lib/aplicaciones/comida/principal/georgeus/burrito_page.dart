//Pagina que nos manda al aplicar al burrito.
import 'package:flutter/material.dart';

class BurritoPage extends StatefulWidget {
  //Le damos un nombre
  static const tag = "burrito_page";
  @override
  State<BurritoPage> createState() => _BurritoPageState();
}

class _BurritoPageState extends State<BurritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
