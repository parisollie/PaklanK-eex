import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
     Key? key=null,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -30,
            left: -40,
            child: Image.asset(
              "assets/images/azul.png",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            bottom: -90,
            right: -30,
            child: Image.asset(
              "assets/images/mor.png",
              width: size.width * 0.55,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
