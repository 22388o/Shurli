import 'package:Shurli/screens/main_menu.dart';
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
        MainMenu(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: createMaterialColor(Color(0xFF151422)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              border: Border.all(color: Color(0xCC26263b), width: 0.8),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                AssetsCard(),
              ]),
            ),
          ),
        ),
      ],
    ));
  }
}

class AssetsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/coin_icons/kmd.png'),
          ),
          SizedBox(width: 5.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Komodo'),
              Text('KMD'),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('4.7880803 KMD'),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FaDuotoneIcon(
                        FontAwesomeIcons.duotoneSyncAlt,
                        primaryColor: Colors.green.withOpacity(.4),
                        secondaryColor: Colors.green,
                        size: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      FaIcon(
                        FontAwesomeIcons.lightShieldCheck,
                        color: Colors.lightBlueAccent,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
