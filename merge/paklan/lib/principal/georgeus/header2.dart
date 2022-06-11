import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    //Entre 5 es el tamaño que se divide la pantalla
                    height:size.height/5,
                    //Es para los bordes del cuadrao turquesa
                    decoration: BoxDecoration(
                          color: Color(0xff3FACB3),
                          //Para hacer los bordes circulares
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(45),
                          ),
                            //Ponemos las sombras
                          boxShadow: [BoxShadow(blurRadius: 2),]
                    ),
                    child: Column(children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:Colors.white70,
                                  radius: 35,
                                  //Ponemos la imagen del perrito
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage("Assets/images/dog.jpg"),
                                    radius: 30,
                                    ),
                                ),
                                //Nombre para el usuario
                                    SizedBox(width: 5),
                                    Column(children: [
                                      Text(
                                        "Paul Flores",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                          )                                
                                      ),
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.black54,
                                            ),
                                          child:Text(
                                            "Gold Member",
                                            style:TextStyle(
                                              color: Colors.white,
                                              ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                              )
                            ],
                          ),
                  ),
                  //Para que la barrita de que quieres vaya en esa posicion
                  SizedBox(height: 20,), 
                ],
              ),
              Positioned(
                bottom:0,
                child: Container(
                  height: 50,
                  width:size.width,
                  //Es como el container ,pero elevado y con sombra
                  child:Card(
                    elevation:3,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(15),
                      ),
                    child:TextFormField(
                      decoration: InputDecoration(
                        //remueve el borde de lo que hacemos
                        border: InputBorder.none,
                        labelText: "Que buscas hoy?",
                        suffixIcon: Icon(Icons.search),
                        //Para que no este pegado de los borders
                        contentPadding: EdgeInsets.only(left:20)
                      ),
                    ),
                  ),
                ), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}
