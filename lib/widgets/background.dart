import 'package:flutter/material.dart';
import 'package:mpdemo/global.dart' as g;

class BGreglog extends StatefulWidget {
  const BGreglog({Key key}) : super(key: key);

  @override
  _BGreglogState createState() => _BGreglogState();
}

class _BGreglogState extends State<BGreglog> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -g.height / 2,
      left: -g.width / 2,
      height: g.height * 1.25,
      width: g.width * 2,
      child: Container(
        height: g.height * 2 / 3,
        decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.topCenter,
              colors: [Color(0xff7a7bbd), g.primary],
              radius: 1),
          //color: g.primary,
          borderRadius: BorderRadius.circular(g.width * g.height * 0.005),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
