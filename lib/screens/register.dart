import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpdemo/services/auth.dart';
import 'package:mpdemo/widgets/background.dart';
import 'package:mpdemo/global.dart' as g;
import 'package:mpdemo/widgets/loading.dart';
import 'package:string_validator/string_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController(text: '');
  TextEditingController pass1 = TextEditingController(text: '');
  TextEditingController pass2 = TextEditingController(text: '');
  final _fkey = GlobalKey<FormState>();
  bool isload = false;

  @override
  Widget build(BuildContext context) {
    g.height = MediaQuery.of(context).size.height;
    g.width = MediaQuery.of(context).size.width;
    return isload
        ? LoadingPage()
        : WillPopScope(
            onWillPop: () {
              SystemNavigator.pop();
              return Future.value(false);
            },
            child: GestureDetector(
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
                              height: g.height * 0.1,
                            ),
                            Container(
                              width: g.width * 3 / 4,
                              height: g.height * 0.6,
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
                              child: Form(
                                key: _fkey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: g.height * 0.045,
                                          bottom: g.height * 0.025),
                                      child: Text(
                                        'Register Account',
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
                                        controller: email,
                                        validator: (String email) {
                                          if (email.trim().isEmpty) {
                                            return 'Email field must not be empty';
                                          } else if (!isEmail(email.trim())) {
                                            return 'Invalid Email';
                                          }
                                          return null;
                                        },
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
                                        controller: pass1,
                                        validator: (String pass) {
                                          if (pass.trim().isEmpty) {
                                            return 'Password field must not be empty';
                                          } else if (pass.trim().length < 8) {
                                            return 'Password not strong enough';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          counterText: '',
                                          hintText: 'Password',
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
                                        controller: pass2,
                                        validator: (String pass) {
                                          if (pass.trim().isEmpty) {
                                            return 'Repeat Password field must not be empty';
                                          } else if (pass.trim() !=
                                              pass1.text.trim()) {
                                            return 'Password does not match';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          counterText: '',
                                          hintText: 'Repeat Password',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: g.height * 0.05,
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        if (_fkey.currentState.validate()) {
                                          setState(() {
                                            isload = true;
                                          });
                                          dynamic result = AuthServices()
                                              .registerWithEmailAndPassword(
                                                  email.text.trim(),
                                                  pass1.text.trim());
                                          email.clear();
                                          pass1.clear();
                                          pass2.clear();
                                          if (result == null) {
                                            setState(() {
                                              isload = false;
                                            });
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Error registering'),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text('Ok'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Container(
                                        height: g.height * 0.056,
                                        width: g.width * 0.42,
                                        decoration: BoxDecoration(
                                          color: g.primary,
                                          borderRadius: BorderRadius.circular(
                                              g.height * 0.028),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Register',
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
                            'Have an Account?',
                            style: TextStyle(
                              fontSize: 20,
                              color: g.primary,
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              email.clear();
                              pass1.clear();
                              pass2.clear();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
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
            ),
          );
  }
}
