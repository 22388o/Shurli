import 'package:Shurli/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:Shurli/theme_data.dart';
import 'package:Shurli/widgets/assets_widget.dart';

class Dashboard extends StatefulWidget {
  static String id = 'dashboard_screen';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    print(queryData.size.width);
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
                AssetsCard(
                  coinName: 'Komodo',
                  coinBalance: '4.7880803',
                  coinTicker: 'KMD',
                  coinIcon: 'kmd',
                  isSynced: true,
                  isConnected: true,
                ),
                AssetsCard(
                  coinName: 'Pirate',
                  coinBalance: '4.7880803',
                  coinTicker: 'ARRR',
                  coinIcon: 'arrr',
                  isSynced: false,
                  isConnected: true,
                ),
                AssetsCard(
                  coinName: 'DEX',
                  coinBalance: '4.7880803',
                  coinTicker: 'DEX',
                  coinIcon: 'dex',
                  isSynced: true,
                  isConnected: true,
                ),
                AssetsCard(
                  coinName: 'Marmara',
                  coinBalance: '4.7880803',
                  coinTicker: 'MCL',
                  coinIcon: 'mcl',
                  isSynced: false,
                  isConnected: true,
                ),
                AssetsCard(
                  coinName: 'VerusCoin',
                  coinBalance: '4.7880803',
                  coinTicker: 'VRSC',
                  coinIcon: 'vrsc',
                  isSynced: true,
                  isConnected: true,
                ),
                AssetsCard(
                  coinName: 'HUSH',
                  coinBalance: '4.7880803',
                  coinTicker: 'HUSH',
                  coinIcon: 'hush3',
                  isSynced: false,
                  isConnected: false,
                ),
              ]),
            ),
          ),
        ),
      ],
    ));
  }
}
