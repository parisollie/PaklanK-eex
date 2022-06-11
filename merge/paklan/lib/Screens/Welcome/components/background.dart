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
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -55,
            left: 200,
            child: Image.asset(
              "Assets/images/blue.png",
              width: size.width * 0.55,
            ),
          ),
          Positioned(
            bottom: -45,
            left: -60,
            child: Image.asset(
              "Assets/images/morado.png",
              width: size.width * 0.35,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
