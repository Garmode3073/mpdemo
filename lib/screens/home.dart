import 'package:flutter/material.dart';
import 'package:mpdemo/global.dart' as g;
import 'package:mpdemo/services/auth.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(g.height * 0.08),
        child: Container(
          color: g.primary,
          child: Column(
            children: [
              SizedBox(height: g.height * 0.03),
              Expanded(
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: g.width * 0.12),
                      Text(
                        'DashBoard',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  dynamic result =
                                      await AuthServices().signOut();
                                  if (result != null) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Error signing out'),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Ok'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: g.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: g.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: g.height * 0.16,
                  width: g.width * 0.42,
                  decoration: BoxDecoration(
                    color: Color(0xffa4a7ee),
                    borderRadius: BorderRadius.circular(g.height * 0.03),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3.0,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: g.width * 0.05,
                              vertical: g.height * 0.01,
                            ),
                            child: Text(
                              'Live:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Car: 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Bike: 1',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: g.height * 0.02,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: g.width * 0.05,
                ),
                Container(
                  height: g.height * 0.16,
                  width: g.width * 0.42,
                  decoration: BoxDecoration(
                    color: Color(0xff394180),
                    borderRadius: BorderRadius.circular(g.height * 0.03),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3.0,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: g.width * 0.04,
                          vertical: g.height * 0.01,
                        ),
                        child: Text(
                          'Total Vehical Entry:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Car: 2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Bike: 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: g.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: g.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: g.width * 0.05),
            child: Container(
              height: g.height * 0.16,
              decoration: BoxDecoration(
                color: Color(0xffbfc2e1),
                borderRadius: BorderRadius.circular(g.height * 0.03),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 3.0,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: g.width * 0.05,
                          vertical: g.height * 0.01,
                        ),
                        child: Text(
                          'Total count (camera):',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    'Car: 0',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Bike: 0',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: g.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: g.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: g.width * 0.05),
            child: Container(
              height: g.height * 0.16,
              decoration: BoxDecoration(
                color: Color(0xff9470dc),
                borderRadius: BorderRadius.circular(g.height * 0.03),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 3.0,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: g.width * 0.05,
                          vertical: g.height * 0.01,
                        ),
                        child: Text(
                          'Total earning:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹ 60',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: g.height * 0.01,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: g.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: g.height * 0.065,
                width: g.width * 0.37,
                decoration: BoxDecoration(
                  color: Color(0xff8083ee),
                  borderRadius: BorderRadius.circular(g.height * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 3.0,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Employee',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: g.height * 0.065,
                width: g.width * 0.37,
                decoration: BoxDecoration(
                  color: Color(0xff8083ee),
                  borderRadius: BorderRadius.circular(g.height * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 3.0,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
