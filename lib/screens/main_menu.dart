import 'package:flutter/material.dart';
import 'package:Shurli/theme_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        );
  }
}