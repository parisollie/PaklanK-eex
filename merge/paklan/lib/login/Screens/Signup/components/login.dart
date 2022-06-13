import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';

import 'package:paklan/login/Screens/Login/login_screen.dart';
import 'package:paklan/login/Screens/Signup/components/or_divider.dart';
import 'package:paklan/login/Screens/Signup/components/social_icon.dart';
import 'package:paklan/login/navegacion/inscrito.dart';

class LogBod extends StatefulWidget {
  @override
  _LogBodState createState() => _LogBodState();
}

class _LogBodState extends State<LogBod> {
  //late es para que no ocurra eror de no tener variables no inicializadas
  late String _email, _password;

  final auth = FirebaseAuth.instance;
  final shape = StadiumBorder();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 104, 178, 234),
                Color.fromARGB(255, 254, 254, 254),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //nombre(),
                //SizedBox(height: 20),
                // Text(
                //  "Sign up",
                // style: TextStyle(fontWeight: FontWeight.bold),
                //),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "Assets/icons/si.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Email',
                      //Para que no se adapte transparente
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                ),

                SizedBox(height: 18),
                Material(
                  color: Colors.transparent,
                  shape: shape,
                  elevation: 8,
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: shape,
                      gradient: LinearGradient(
                        // begin:Alignment.topCenter,
                        //end:Alignment.bottomCenter,
                        colors: [
                          Colors.teal,
                          Colors.purple,
                          Colors.indigo,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        auth
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((_) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Inscrito()));
                        });
                      },
                      child: Text('Sign up', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: Text(
<<<<<<< HEAD
                        '¿Ya tienes una cuenta?, Sign in',
=======
                        'Ya tienes una cuenta?, Sign in',
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
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
                    ),
                  ],
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "Assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "Assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "Assets/icons/google-plus.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
