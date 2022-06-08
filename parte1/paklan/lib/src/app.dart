import 'package:flutter/material.dart';
import 'package:paklan/Screens/Welcome/welcome_screen.dart';
import 'package:paklan/navegacion/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      title: 'Login App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xff3FACB3), centerTitle: true),
        //Cambiamos el color del fondo de la app,donde est el home
        bottomAppBarColor: Color(0xff3FACB3),
        ),        
        home: WelcomeScreen(),
        //home: LoginScreen(),
        //Quitamos la bandita esquina
        debugShowCheckedModeBanner: false,
    );
  }
}

 