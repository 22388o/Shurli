import 'package:flutter/material.dart';
import 'package:Shurli/theme_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          
          color: createMaterialColor(Color(0xFF26263b)),
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.rocketLaunch),
                    SizedBox(height: 5),
                    Text("Dashboard"),
                  ],
                ),
              ),
              SizedBox(height: 40),
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.lightExchange),
                    SizedBox(height: 5),
                    Text("Trade"),
                  ],
                ),
              ),
              SizedBox(height: 40),
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.lightHistory),
                    SizedBox(height: 5),
                    Text("History"),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: createMaterialColor(Color(0xFF151422)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              border: Border.all(width: 0.8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            // color: Colors.green,
            width: 100,
            height: 100,
            child: Text("Contents"),
          ),
        ),
      ],
    ));
  }
}
