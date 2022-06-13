import 'package:flutter/material.dart';
import 'package:paklan/aplicaciones/comida/burritos-menu/Models/BurritoModels.dart';
import 'package:google_fonts/google_fonts.dart';

class BurritosDetailPage extends StatelessWidget {
  const BurritosDetailPage({Key? key, required this.burritoModels})
      : super(key: key);

  final BurritoModels burritoModels;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: Hero(
              tag: 'text_${burritoModels.name}',
              child: Material(
                color: Colors.transparent,
                child: Text(burritoModels.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Inter',
                        fontSize: 25, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: burritoModels.name,
                    child:
                        Image.asset(burritoModels.image, fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  left: size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 610),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-100 * value, 240 * value),
                        child: child,
                      );
                    },
                    child: Text(
                      '\$${burritoModels.price.toStringAsFixed(2)}',
                      style: GoogleFonts.getFont('Inter',
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff3FACB3),
                          shadows: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 10,
                                spreadRadius: 20)
                          ]),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
