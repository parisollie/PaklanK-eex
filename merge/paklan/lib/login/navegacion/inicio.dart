//Pagina cuando se registra el correo
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:mousy/src/login/login.dart';

class Inicio extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return Scaffold(  
      body: Center(
        child: ShaderMask(
          blendMode:BlendMode.srcIn,
          shaderCallback:(rect) =>LinearGradient(
          //begin:Alignment.topLeft,
          //end:Alignment.bottomRight,
          colors:[ 
            Colors.greenAccent, 
            Colors.indigo,
          ],
        ).createShader(rect),
          child: TextButton(
            child: Text(
              'Inicio app',
              style:TextStyle(
                fontSize:46,
                fontWeight:FontWeight.bold,
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
                fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
              ),
            ),
<<<<<<< HEAD
            onPressed: () {
              // auth.signOut();
=======
            onPressed: (){
             // auth.signOut();
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
