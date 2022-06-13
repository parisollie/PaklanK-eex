import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:paklan/login/Screens/Login/login_screen.dart';
import 'package:paklan/login/Screens/Signup/signup_screen.dart';
import 'package:paklan/login/Screens/Welcome/components/background.dart';

<<<<<<< HEAD
=======


>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shape = StadiumBorder();
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "BIENVENIDO(A) A PAKLAN K'EEX",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "Assets/icons/home.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            //AQUI EMPIEZA EL ELEVATE BUTTON
            Material(
              color: Colors.transparent,
              shape: shape,
              elevation: 8,
              child: Container(
                decoration: ShapeDecoration(
                  shape: shape,
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.purple,
                      Colors.indigo,
                    ],
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text('LOGIN', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            SizedBox(height: 20),

            //Segundo botton
            Material(
              color: Colors.transparent,
              shape: shape,
              elevation: 8,
              child: Container(
                decoration: ShapeDecoration(
                  shape: shape,
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.purple,
                      Colors.indigo,
                    ],
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: Text('SIGN UP', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
