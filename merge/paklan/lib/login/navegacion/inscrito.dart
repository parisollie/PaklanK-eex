//Pagina cuando se registra el correo
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paklan/login/src/app.dart';

class Inscrito extends StatelessWidget {
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
              'Estas inscrito',
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
              'Estas inscrito',
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
              auth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => App()));
=======
            onPressed: (){
              auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => App()));
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
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
