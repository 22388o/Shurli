import 'package:Shurli/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:Shurli/theme_data.dart';

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
        MainMenu(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: createMaterialColor(Color(0xFF151422)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              border: Border.all(color: Color(0xCC26263b),width: 0.8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.8),
                  spreadRadius: 7,
                  blurRadius: 14,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: 100,
            height: 100,
            child: Text("Contents"),
          ),
        ),
      ],
    ));
  }
}
