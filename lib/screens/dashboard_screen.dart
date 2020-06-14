import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static String id = 'dashboard_screen';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 100,
          height: 100,
          child: Text("Menu"),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Text("Contents"),
          ),
        ),
      ],
    ));
  }
}
