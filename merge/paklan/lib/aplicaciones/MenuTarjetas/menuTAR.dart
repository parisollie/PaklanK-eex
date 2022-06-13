import 'package:flutter/material.dart';
import 'package:paklan/aplicaciones/MenuTarjetas/BurritoDetails.dart';
import 'package:paklan/aplicaciones/MenuTarjetas/Models/TarjetasModels.dart';
import 'package:google_fonts/google_fonts.dart';

const duration = Duration(milliseconds: 300);
const _initialPage = 1.0;

class menTar extends StatefulWidget {
  @override
  _menTarState createState() => _menTarState();
}

class _menTarState extends State<menTar> {
  final _pageController =
      PageController(viewportFraction: 0.35, initialPage: _initialPage.toInt());
  final _pageTextController = PageController(initialPage: _initialPage.toInt());

  double _currentPage = _initialPage;
  double _textPage = _initialPage;

  void _burritoScrollListener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  void _textScrollListener() {
    setState(() {
      _textPage = _pageTextController.page!;
    });
  }

  @override
  void initState() {
    _pageController.addListener((_burritoScrollListener));
    _pageTextController.addListener((_textScrollListener));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener((_burritoScrollListener));
    _pageTextController.removeListener((_textScrollListener));
    _pageController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff3FACB3)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Modelos nuevos",
          style: TextStyle(color: Color(0xff3FACB3)),
        ),
        centerTitle: true,
        
=======
>>>>>>> e792f62f36c702d5b5ba7a0c422117a98dbee183
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
              left: 22,
              right: 20,
              bottom: -size.height * 0.3,
              top: size.height * 0.3,
              child: DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 14, 128, 138),
                      blurRadius: 90,
                      spreadRadius: 45)
                ]),
              )),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: tarjetas.length + 1,
              onPageChanged: (value) {
                if (value < tarjetas.length) {
                  _pageTextController.animateToPage(value,
                      duration: duration, curve: Curves.easeOut);
                }
              },
              itemBuilder: (context, index) {
                if (index == 0) return SizedBox.shrink();

                final tarjeta = tarjetas[index - 1];
                final result = _currentPage - index + 1;
                final value = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 650),
                        pageBuilder: (_, animation, __) => FadeTransition(
                            opacity: animation,
                            child:
                                BurritosDetailPage(burritoModels: tarjeta))));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translate(
                              0.0, size.height / 2.6 * (1 - value).abs())
                          ..scale(value),
                        child: Opacity(
                            opacity: opacity,
                            child: Hero(
                                tag: tarjeta.name,
                                child: Image.asset(
                                  tarjeta.image,
                                  fit: BoxFit.fitHeight,
                                )))),
                  ),
                );
              },
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: 100,
              child: TweenAnimationBuilder<double>(
                duration: duration,
                tween: Tween(begin: 1.0, end: 0.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, -100 * value),
                    child: child,
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                        child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageTextController,
                      itemCount: tarjetas.length,
                      itemBuilder: (context, index) {
                        final opacity =
                            (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                        return Opacity(
                          opacity: opacity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.2),
                            child: Hero(
                              tag: 'text_${tarjetas[index].name}',
                              child: Material(
                                color: Colors.transparent,
                                child: Text(tarjetas[index].name,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont('Inter',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                    AnimatedSwitcher(
                        key: Key(tarjetas[_currentPage.toInt()].name),
                        duration: duration,
                        child: Text(
                          '\$${tarjetas[_currentPage.toInt()].price.toStringAsFixed(2)}',
                          style: GoogleFonts.getFont('Inter',
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
