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
      home: null,
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
