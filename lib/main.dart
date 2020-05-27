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
        brightness: Brightness.dark,
        primaryColor: createMaterialColor(Color(0xFF0e2842)),
        backgroundColor: createMaterialColor(Color(0xFF001625)),
        scaffoldBackgroundColor: createMaterialColor(Color(0xFF001625)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: createMaterialColor(Color(0xFF001625)),
            selectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(
              color: Colors.white,
            )),
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

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Shurli Settings'),
        ),
        body: const Center(
          child: Text(
            'Shurli Settings page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: DASHBOARD',
      style: optionStyle,
    ),
    Text(
      'Index 1: TRADE',
      style: optionStyle,
    ),
    Text(
      'Index 2: TRADE HISTORY',
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
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.cog),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: Container(
          width: 50,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Test123'),
                  accountEmail: Text('test@123.com'),
                  currentAccountPicture: Image.network(
                      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a89c3e38-b6f3-48a0-9f9e-df9a0129fb93/daghh5x-4a77b3ec-fd4f-4d17-9f84-5963a8cb5c03.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E4OWMzZTM4LWI2ZjMtNDhhMC05ZjllLWRmOWEwMTI5ZmI5M1wvZGFnaGg1eC00YTc3YjNlYy1mZDRmLTRkMTctOWY4NC01OTYzYThjYjVjMDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dWTFMrwnbAbj5TtUp9U_vQsohW7MnkRPymzR5wZQoV8'),
                ),
                ListTile(
                  title: Text('data'),
                ),
              ],
            ),
          ),
        ),
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

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
