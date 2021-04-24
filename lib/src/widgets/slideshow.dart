import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dessignflutter/src/models/slider_model.dart';
// TODO: BORRAR
// import 'package:flutter_svg/flutter_svg.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  SlideShow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (this.puntosArriba)
                _Dots(this.slides.length, this.colorPrimario,
                    this.colorSecundario),
              Expanded(
                child: _Slides(this.slides),
              ),
              if (!this.puntosArriba)
                _Dots(this.slides.length, this.colorPrimario,
                    this.colorSecundario),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;

  _Dots(
    this.totalSlides,
    this.colorPrimario,
    this.colorSecundario,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            this.totalSlides,
            (i) => _Dot(
              i,
              this.colorPrimario,
              this.colorSecundario,
            ),
          )),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;
  const _Dot(
    this.index,
    this.colorPrimario,
    this.colorSecundario,
  );

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? this.colorPrimario
            : this.colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      // print('Página Actual: ${pageViewController.page}');
      //
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}
