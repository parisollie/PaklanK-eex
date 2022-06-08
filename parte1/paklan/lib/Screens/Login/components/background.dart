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
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -76,
            left: -40,
            child: Image.asset(
              "assets/images/explot.png",
              width: size.width * 0.75,
            ),
          ),
          Positioned(
            bottom: -40,
            right: -60,
            child: Image.asset(
              "assets/images/algodon.png",
              width: size.width * 0.6,
            ),
          ),
          child,
        ],
      ),


    );
  }
}

