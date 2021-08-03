import 'package:flutter/material.dart';
import 'package:mpdemo/models/user.dart';
import 'package:mpdemo/screens/home.dart';
import 'package:mpdemo/screens/login.dart';
import 'package:mpdemo/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:mpdemo/global.dart' as g;

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserInApp>(context);
    if (user == null) {
      return LoginPage();
    }
    AuthServices().getUserWithId(user.uid).then((value) {
      setState(() {
        g.userglob = value;
      });
    });
    return DashBoard();
  }
}
