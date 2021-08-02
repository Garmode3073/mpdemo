import 'package:flutter/material.dart';
import 'package:mpdemo/background.dart';
import 'package:mpdemo/global.dart' as g;
import 'package:mpdemo/register.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    g.height = MediaQuery.of(context).size.height;
    g.width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            BGreglog(),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: g.height * 0.15,
                  left: g.width / 8,
                  right: g.width / 8,
                ),
                child: ListView(
                  primary: false,
                  children: [
                    SizedBox(
                      height: g.height * 0.18,
                    ),
                    Container(
                      width: g.width * 3 / 4,
                      height: g.height * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 7.0,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: g.height * 0.045,
                                bottom: g.height * 0.025),
                            child: Text(
                              'Login Account',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: g.width * 0.075,
                              vertical: g.height * 0.01,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: g.width * 0.075,
                              vertical: g.height * 0.01,
                            ),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: 'Password',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: g.height * 0.05,
                          ),
                          RawMaterialButton(
                            onPressed: null,
                            child: Container(
                              height: g.height * 0.056,
                              width: g.width * 0.42,
                              decoration: BoxDecoration(
                                color: g.primary,
                                borderRadius:
                                    BorderRadius.circular(g.height * 0.028),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: g.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: g.height * 9 / 10,
              left: 0,
              width: g.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Account? ',
                    style: TextStyle(
                      fontSize: 20,
                      color: g.primary,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRightJoined,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: RegisterPage(),
                            childCurrent: LoginPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: g.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
