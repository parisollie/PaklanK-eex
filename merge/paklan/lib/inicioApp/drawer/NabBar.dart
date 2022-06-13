import 'package:flutter/material.dart';

import 'package:paklan/aplicaciones/qr/qr.dart';
import 'package:paklan/aplicaciones/condiciones/pages/conditions.dart';
import 'package:paklan/aplicaciones/creditCard/tar.dart';
import 'package:paklan/login/screens/Welcome/components/body.dart';
import 'package:paklan/aplicaciones/MenuTarjetas/menuTar.dart';
import 'package:paklan/aplicaciones/comida/principal/home.dart';
<<<<<<< HEAD
import 'package:paklan/login/src/app.dart';
=======
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183

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
            accountName: Text(
              'Paul-Ollie.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            accountEmail: Text(
              'palmeritaDorada@gmail.com',
              style: TextStyle(
                  color: Color(0xff3FACB3),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
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
                  image: AssetImage("Assets/perfil/ing2.jpg")),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'Comida',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Inicio(),
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'Novedades',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => menTar(),
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.qr_code,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'QR',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => QrsPag(),
            )),
          ),
          Divider(),
          ListTile(
<<<<<<< HEAD
              leading: Icon(
                Icons.credit_card,
                color: Color(0xff3FACB3),
              ),
              title: Text(
                'Tarjeta',
              ),
              onTap: () =>
                  //print("Presionaste el botton")
                  //Para irnos a la otra pagina
                  Navigator.push(
                      //Navigator nos pide el contexto
                      context,
                      //Y nos pide el widget a utilizar
                      MaterialPageRoute(builder: (context) => Tarjeta()))),
=======
            leading: Icon(
              Icons.credit_card,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'Tarjeta',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Tarjeta(),
            )),
          ),
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
          ListTile(
            leading: Icon(
              Icons.description,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'Politicas',
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Conditions(),
            )),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'Settings',
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'Exit',
            ),
<<<<<<< HEAD
            onTap: () => //print("Presionaste el botton")
                //Para irnos a la otra pagina
                Navigator.push(
                    //Navigator nos pide el contexto
                    context,
                    //Y nos pide el widget a utilizar
                    MaterialPageRoute(builder: (context) => App())),
=======
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Body(),
            )),
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Color(0xff3FACB3),
            ),
            title: Text(
              'Notificaciones',
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
