import 'package:flutter/material.dart';
import 'package:paklan/pages/otra_pagina.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:paklan/pages/pedido_lista.dart';
import 'package:paklan/pages/pedList.dart';
import 'package:paklan/qr/qr.dart';
//import 'package:paklan/tarjeta/tarjeta.dart';
import 'package:paklan/novedades/BurritoListPage.dart';
import 'package:paklan/condiciones/pages/conditions.dart';
import 'package:paklan/camimg/camera.dart';
import 'package:paklan/tarjeta/tar.dart';

import 'package:paklan/principal/home.dart';
import 'package:paklan/drawer/NabBar.dart';
/**/
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            
            accountName: Text('Paul-Ollie.com',style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),),
            accountEmail: Text('palmeritaDorada@gmail.com',style: TextStyle(
            color: Color(0xff3FACB3),
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),),

            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "Assets/perfil/paul.jpg",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),

              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "Assets/perfil/ing2.jpg")
                      ),
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.camera,
            color: Color(0xff3FACB3),),
            title: Text('Cam-Img',
            
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => CamImg(),
                  )),
          ),

          ListTile(
            leading: Icon(Icons.favorite,
            color: Color(0xff3FACB3),),
            title: Text('Novedades',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => BurritosListPage(),
                  )),
          ),

          ListTile(
            leading: Icon(Icons.qr_code,
            color: Color(0xff3FACB3),),
            title: Text('QR',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => QrsPag(),
                  )),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.credit_card,
            color: Color(0xff3FACB3),),
            title: Text('Tarjeta',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Tarjeta(),
                  )),
          ),

          

          ListTile(
            leading: Icon(Icons.description,
            color: Color(0xff3FACB3),),
            title: Text('Politicas',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Conditions(),
                  )),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.settings,
            color: Color(0xff3FACB3),),
            title: Text('Settings',
            ),
            onTap: () => null,
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app,
            color: Color(0xff3FACB3),),
            title: Text('Exit',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Conditions(),
                  )),
          ),
          ListTile(
            leading: Icon(Icons.notifications,
            color: Color(0xff3FACB3),),
            title: Text('Notificaciones',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Conditions(),
                  )),
             trailing: ClipOval(
    child: Container(
      color: Colors.red,
      width: 20,
      height: 20,
      child: Center(
        child: Text(
          '8',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    ),
  ),
          ),


        ],
      ),
    );
  }
}