import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(ShurliApp());
}

class ShurliApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shurli',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(title: 'Shurli'),
    );
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaDuotoneIcon(
              FontAwesomeIcons.duotoneRocketLaunch,
              primaryColor: Color.fromRGBO(0, 0, 0, 0.5),
              secondaryColor: Colors.black,
            ),
            title: Text('DASHBOARD'),
          ),
          BottomNavigationBarItem(
            icon: FaDuotoneIcon(
              FontAwesomeIcons.duotoneExchangeAlt,
              primaryColor: Color.fromRGBO(0, 0, 0, 0.5),
              secondaryColor: Colors.black,
            ),
            title: Text('TRADE'),
          ),
          BottomNavigationBarItem(
            icon: FaDuotoneIcon(
              FontAwesomeIcons.duotoneHistory,
              primaryColor: Color.fromRGBO(0, 0, 0, 0.5),
              secondaryColor: Colors.black,
            ),
            title: Text('TRADE HISTORY'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
