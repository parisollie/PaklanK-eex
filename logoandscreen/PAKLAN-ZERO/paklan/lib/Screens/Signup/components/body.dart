import 'package:flutter/material.dart';
import 'package:paklan/Screens/Login/login_screen.dart';
import 'package:paklan/Screens/Signup/components/background.dart';
import 'package:paklan/Screens/Signup/components/or_divider.dart';
import 'package:paklan/Screens/Signup/components/social_icon.dart';
import 'package:paklan/components/rounded_input_field.dart';
import 'package:paklan/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paklan/navegacion/inscrito.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
  
}

class _BodyState extends State<Body> {
  //late es para que no ocurra eror de no tener variables no inicializadas
  late String _email, _password;

  final auth = FirebaseAuth.instance;
  final shape = StadiumBorder();
  late Widget child;

  @override
  Widget build(BuildContext context) {
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
                  Color.fromARGB(255, 179, 192, 185), 
                  Colors.indigo,
                ],
              ),             
            ),
        
        child: Center(

          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            /*
            
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                }
                );
              },
            ),
*/
            /*

            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                      });
              },
            ),
            */
            Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(  
                      border: InputBorder.none,
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
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),                  
                  child: TextField(               
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,                      
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
            SizedBox(height: size.height * 0.03), 

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
                          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                          tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                          primary:Colors.transparent,
                          shadowColor:Colors.transparent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: (){
                          auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Inscrito()));
                            }); 
                                  
                        },
                        child: Text('SIGNUP', style:TextStyle(fontSize:20)),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          'Already have an Account?, Sign In',
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
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/google-plus.svg",
                        press: () {},
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

