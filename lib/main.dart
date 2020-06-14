import 'package:Shurli/theme_data.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Shurli/screens/dashboard_screen.dart';

void main() {
  runApp(ShurliApp());
}

class ShurliApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shurli',
      theme: kShurliAppThemeData,
      initialRoute: Dashboard.id,
      routes: {
        Dashboard.id: (context) => Dashboard(),
      },
    );
  }
}
