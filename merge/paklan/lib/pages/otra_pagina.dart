import 'package:flutter/material.dart';

class OtraPagina extends StatefulWidget {
  OtraPagina({Key? key}) : super(key: key);

  @override
  State<OtraPagina> createState() => _OtraPaginaState();
}

class _OtraPaginaState extends State<OtraPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Otra Pagina',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}
