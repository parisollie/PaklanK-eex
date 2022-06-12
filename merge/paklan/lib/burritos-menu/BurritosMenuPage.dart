import 'package:flutter/material.dart';
import 'package:paklan/burritos-menu/brlp.dart';
import 'package:paklan/burritos-menu/Models/BurritoModels.dart';

class BurritosMenuPage extends StatefulWidget {
  @override
  _BurritosMenuPageState createState() => _BurritosMenuPageState();
}

class _BurritosMenuPageState extends State<BurritosMenuPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -10) {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 650),
                    pageBuilder: (_, animation, __) {
                      return FadeTransition(
                        opacity: animation,
                        child: BLP(),
                      );
                    }));
          }
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff3FACB3), Colors.white]))),
            ),
            Positioned(
                height: size.height * 0.4,
                left: 0,
                right: 0,
                top: size.height * 0.15,
                child: Hero(
                  tag: burritos[10].name,
                  child: Image.asset(burritos[10].image),
                )),
            Positioned(
                height: size.height * 0.7,
                left: 0,
                right: 0,
                bottom: 0,
                child: Hero(
                  tag: burritos[7].name,
                  child: Image.asset(burritos[7].image, fit: BoxFit.cover),
                )),
            Positioned(
                height: size.height,
                left: 0,
                right: 0,
                bottom: -size.height * 0.8,
                child: Hero(
                  tag: burritos[8].name,
                  child: Image.asset(burritos[8].image, fit: BoxFit.cover),
                )),
            Positioned(
                height: 140,
                left: 0,
                right: 0,
                bottom: size.height * 0.25,
                child: Image.asset('Assets/Burros/iconori.png')),
          ],
        ),
      ),
    );
  }
}
