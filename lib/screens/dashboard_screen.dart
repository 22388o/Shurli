import 'package:Shurli/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:Shurli/theme_data.dart';
import 'package:Shurli/widgets/assets_widget.dart';
import 'package:Shurli/services/shurli_service.dart';

class Dashboard extends StatefulWidget {
  static String id = 'dashboard_screen';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<AssetsCard> cardList = List<AssetsCard>();

  @override
  void initState() {
    _walletInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData queryData;
    // queryData = MediaQuery.of(context);
    // print(queryData.size.width);
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
              child: ListView(children: cardList),
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> _walletInfo() async {
    var res = await ShurliService.WalletInfo();
    var list = new List(res.wallets.length);
    list = res.wallets;
    List<AssetsCard> _tempCardList = List<AssetsCard>();
    for (var i=0; i<list.length; i++) {
      print(list[i].name);
      print(list[i].shielded);
      _tempCardList.insert(i, AssetsCard(
        coinName: list[i].name,
        coinBalance: list[i].balance.toString(),
        coinZBalance: list[i].zBalance.toString(),
        coinTicker: list[i].ticker,
        coinIcon: list[i].icon,
        isSynced: list[i].synced,
        isConnected: list[i].status,
        isShielded: list[i].shielded,
      ),);
    }
      // print(_tempCardList);
    setState(() {
      cardList = _tempCardList;
    });
  }
}
