import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mpdemo/global.dart' as g;

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    g.height = MediaQuery.of(context).size.height;
    g.width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: g.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Container()),
            SpinKitRipple(
              color: Colors.white,
              size: 100.0,
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              'Loading...',
              style: TextStyle(
                fontFamily: 'Lucida Bright',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
