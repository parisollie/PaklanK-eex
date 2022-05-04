
import 'package:flutter/material.dart';
import 'package:paklan/Screens/Login/login_screen.dart';
import 'package:paklan/Screens/Signup/components/background.dart';
import 'package:paklan/Screens/Signup/components/or_divider.dart';
import 'package:paklan/Screens/Signup/components/social_icon.dart';
import 'package:paklan/components/rounded_input_field.dart';
import 'package:paklan/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final shape = StadiumBorder();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        
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
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            
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
    );
  }
}
