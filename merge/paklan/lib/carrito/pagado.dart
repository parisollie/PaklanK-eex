//Pagina cuando se registra el correo

import 'package:flutter/material.dart';
import 'package:paklan/inicioApp/homeApp.dart';

class Pagado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (rect) => LinearGradient(
            //begin:Alignment.topLeft,
            //end:Alignment.bottomRight,
            colors: [
              Colors.greenAccent,
              Colors.indigo,
            ],
          ).createShader(rect),
          child: TextButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Compra exitosa',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
            onPressed: () {
              //auth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
        ),
      ),
    );
  }
}
