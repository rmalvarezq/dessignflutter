import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0XffEF2929),
    );
  }
}

class HeaderBordersCirculares extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0XffEF2929),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          )),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XffEF2929),
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0XffEF2929);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = new Path();
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30 );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XffEF2929),
      child: CustomPaint(painter: _HeaderTriangularPainter()),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0XffEF2929);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XffEF2929),
      child: CustomPaint(painter: _HeaderPico()),
    );
  }
}

class _HeaderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0XffEF2929);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width , size.height * 0.25);
    path.lineTo(size.width , 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XffEF2929),
      child: CustomPaint(painter: _HeaderCurvo()),
    );
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0XffEF2929);
    lapiz.style = PaintingStyle.fill ;
    lapiz.strokeWidth = 10;

    final path = new Path();
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40,size.width , size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XffEF2929),
      child: CustomPaint(painter: _HeaderWave()),
    );
  }
}

class _HeaderWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // propiedades
    lapiz.color = Color(0XffEF2929);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = new Path();
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,size.width *0.5, size.height * 0.20);
    path.quadraticBezierTo(size.width* 0.75, size.height * 0.11,size.width , size.height*0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradientPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XffEF2929),
      child: CustomPaint(painter: _HeaderWaveGradientPainter()),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 55.0),
      radius: 180,

    );
    
    final gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors : <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA)
      ],
      stops: [
        0.2,
        0.5,
        1.0
      ]
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // propiedades
    // lapiz.color = Color(0XffEF2929);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = new Path();
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,size.width *0.5, size.height * 0.20);
    path.quadraticBezierTo(size.width* 0.75, size.height * 0.11,size.width , size.height*0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}