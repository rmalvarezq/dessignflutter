import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  SlideShow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlidesShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlidesShowModel>(context)._colorPrimario =
                  this.colorPrimario;
              Provider.of<_SlidesShowModel>(context)._colorSecundario =
                  this.colorSecundario;
              Provider.of<_SlidesShowModel>(context)._bulletPrimario =
                  this.bulletPrimario;
              Provider.of<_SlidesShowModel>(context)._bulletSecundario =
                  this.bulletSecundario;
              return _CrearEstructuraSlideShow(
                  puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.puntosArriba)
          _Dots(
            this.slides.length,
          ),
        Expanded(
          child: _Slides(this.slides),
        ),
        if (!this.puntosArriba)
          _Dots(
            this.slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(
    this.totalSlides,
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
            ),
          )),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(
    this.index,
  );
  @override
  Widget build(BuildContext context) {
    final slidesShowModel = Provider.of<_SlidesShowModel>(context);
    double tamano = 0;
    Color color;
    if (slidesShowModel.currentPage >= index - 0.5 &&
        slidesShowModel.currentPage < index + 0.5) {
      tamano = slidesShowModel._bulletPrimario;
      color = slidesShowModel._colorPrimario;
    } else {
      tamano = slidesShowModel._bulletSecundario;
      color = slidesShowModel._colorSecundario;
    }
    // final tamano1 = (slidesShowModel.currentPage == index)
    //     ? slidesShowModel.bulletPrimario
    //     : slidesShowModel._bulletSecundario;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        // color: (slidesShowModel.currentPage >= index - 0.5 &&
        // slidesShowModel.currentPage < index + 0.5)? slidesShowModel._colorPrimario :slidesShowModel._colorSecundario;

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
      Provider.of<_SlidesShowModel>(context, listen: false).currentPage =
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

class _SlidesShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 15;
  double _bulletSecundario = 10;
  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }
}
