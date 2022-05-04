/**/
import 'package:flutter/material.dart';
import 'package:paklan/Screens/Login/components/background.dart';
import 'package:paklan/Screens/Signup/signup_screen.dart';
import 'package:paklan/components/rounded_input_field.dart';
import 'package:paklan/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paklan/navegacion/inscrito.dart';
import 'package:paklan/navegacion/inicio.dart';
class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
  
}

class _BodyState extends State<Body> {
  //late es para que no ocurra eror de no tener variables no inicializadas
  
  
  final shape = StadiumBorder();
  // late Widget child;

  @override
  Widget build(BuildContext context) {
    late String _email, _password;
    final auth = FirebaseAuth.instance;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //   appBar: AppBar(
      //   title: Text('Login'),
      //),
      body: Container(
        
        width: double.infinity,
        height: size.height,
        
        decoration:BoxDecoration(
          gradient:LinearGradient(
                colors:[
                  Color.fromARGB(255, 230, 235, 232), 
                  Color.fromARGB(255, 231, 8, 183)
                ],
              ),             
            ),
        
        child: Center(          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Text(
                  "LOGIN",
                   style: TextStyle(fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                //////////////////////////////////////////////////////////
                
                RoundedInputField(
                  hintText: "Your Email",
                  
                  onChanged: (value) {
                    setState(() {
                           _email = value.trim();
                      });
                  },
                ),
                
                /**/

                RoundedPasswordField(
                  onChanged: (value) {
                    setState(() {
                        _password = value.trim();
                      });
                  },
                ),
                
                //AQUI EMPIEZA EL ELEVATE BUTTON
                Material(
                  color:Colors.transparent,
                  shape:shape,
                  elevation:8,
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: shape,
                      gradient:LinearGradient(
                        colors:[ 
                          Colors.teal,
                          Colors.purple,
                          Colors.indigo,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                        tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                        primary:Colors.transparent,
                        shadowColor:Colors.transparent,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: (){
                        auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Inicio()));
                            }); 
                                   
                      },
                      child: Text('LOGIN', style:TextStyle(fontSize:20)),
                      ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: Text(
                        'Don’t have an Account?, Sign Up ',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        ); 
                      },
                    ),
                  ],
                )
              ],      
          ),
        ),
      ),
    );
  }
}

