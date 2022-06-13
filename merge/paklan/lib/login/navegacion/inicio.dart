//Pagina cuando se registra el correo
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:mousy/src/login/login.dart';

class Inicio extends StatelessWidget {
  final auth = FirebaseAuth.instance;
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
            child: Text(
              'Inicio app',
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
              ),
            ),
            onPressed: () {
              // auth.signOut();
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ),
      ),
    );
  }
}
