import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paklan/login/navegacion/inicio.dart';
import 'package:paklan/login/navegacion/inscrito.dart';

class LoginScreen extends StatefulWidget {
<<<<<<< HEAD
  @override
  _LoginScreenState createState() => _LoginScreenState();
=======
  
  

  @override
  _LoginScreenState createState() => _LoginScreenState();
  
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
}

class _LoginScreenState extends State<LoginScreen> {
  //late es para que no ocurra eror de no tener variables no inicializadas
  late String _email, _password;

  final auth = FirebaseAuth.instance;
  final shape = StadiumBorder();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
<<<<<<< HEAD
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.indigo,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              nombre(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              SizedBox(height: 20),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                            .signInWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((_) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Inicio()));
                        });
                      },
                      child: Text('Sign in', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
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
                )
              ])
            ],
=======
        decoration:BoxDecoration(
              gradient:LinearGradient(
                colors:[
                  Colors.greenAccent, 
                  Colors.indigo,
                ],
              ),             
            ),
        child: Center(          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                nombre(),
                SizedBox(height: 20),
                
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
                
                SizedBox(height: 20),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                  Material(
                    color:Colors.transparent,
                    shape:shape,
                    elevation:8,
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: shape,
                        gradient:LinearGradient(
                          // begin:Alignment.topCenter,
                          //end:Alignment.bottomCenter,
                          colors:[ 
                            Colors.teal,
                            Colors.purple,
                            Colors.indigo,
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
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
                        child: Text('Sign in', style:TextStyle(fontSize:20)),           
                      ),
                    ),
                  ),      
                  Material(
                    color:Colors.transparent,
                    shape:shape,
                    elevation:8,
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: shape,
                        gradient:LinearGradient(
                          // begin:Alignment.topCenter,
                          //end:Alignment.bottomCenter,
                          colors:[ 
                            Colors.teal,
                            Colors.purple,
                            Colors.indigo,
                          ],
                        ),
                      ),
                      child: ElevatedButton( 
                        style: ElevatedButton.styleFrom(
                          tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                          primary:Colors.transparent,
                          shadowColor:Colors.transparent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: (){
                          auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Inscrito()));
                          });           
                        },
                        child: Text('Sign up', style:TextStyle(fontSize:20)),
                      ),
                    ),
                  )
                ])
              ],      
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
          ),
        ),
      ),
    );
  }
}

<<<<<<< HEAD
Widget nombre() {
  return Center(
    child: ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => LinearGradient(
        //begin:Alignment.topLeft,
        //end:Alignment.bottomRight,
        colors: [
          Colors.yellow,
          Colors.yellowAccent,
        ],
      ).createShader(rect),
      child: Text(
        'Welcome',
        style: TextStyle(
          fontSize: 46,
          fontWeight: FontWeight.bold,
=======
Widget nombre(){
  return Center(
    child: ShaderMask(
      blendMode:BlendMode.srcIn,
      shaderCallback:(rect) =>LinearGradient(
        //begin:Alignment.topLeft,
        //end:Alignment.bottomRight,
        colors:[ 
          Colors.yellow,
          Colors.yellowAccent,
        ],
      ).createShader(rect), 
      child: Text(
        'Welcome',
        style:TextStyle(
          fontSize:46,
          fontWeight:FontWeight.bold,
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
          fontStyle: FontStyle.italic,
          fontFamily: 'Open Sans',
        ),
      ),
    ),
  );
<<<<<<< HEAD
}
=======
}
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
