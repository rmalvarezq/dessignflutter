import 'package:dessignflutter/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0XffEF2929),
      //   shadowColor: Color(0XffEF2929),
      //   title: Text('Test'),
      // ),
      body: 
      HeaderWaveFooter(),
    );
  }
}
