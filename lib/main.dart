import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mpdemo/models/user.dart';
import 'package:mpdemo/services/auth.dart';
import 'package:mpdemo/services/wrapper.dart';
import 'package:mpdemo/widgets/loading.dart';
import 'package:mpdemo/global.dart' as g;
import 'package:provider/provider.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => MaterialApp(
        title: 'Important Modules',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: g.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoadingPage(),
      );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: g.primary,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          title: 'Important Modules',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: g.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoadingPage(),
        );
      },
    );
  }
}

//home page
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthServices auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserInApp>.value(
        value: auth.userIsIn, child: Wrapper());
  }
}
