import 'package:flutter/material.dart';
import 'package:paklan/login/Screens/Welcome/welcome_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
=======
    return MaterialApp(  
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
      title: 'Login App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xff3FACB3), centerTitle: true),
        //Cambiamos el color del fondo de la app,donde est el home
        bottomAppBarColor: Color(0xff3FACB3),
<<<<<<< HEAD
      ),
      home: WelcomeScreen(),

      //Quitamos la bandita esquina
      debugShowCheckedModeBanner: false,
    );
  }
}
=======
        ),        
        home: WelcomeScreen(),
        
        //Quitamos la bandita esquina
        debugShowCheckedModeBanner: false,
    );
  }
}

 
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
