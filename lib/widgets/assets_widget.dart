import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssetsCard extends StatelessWidget {
  final String coinIcon, coinName, coinTicker, coinBalance;
  final bool isSynced, isConnected;

  AssetsCard(
      {this.coinIcon,
      this.coinName,
      this.coinTicker,
      this.coinBalance,
      this.isSynced,
      this.isConnected});

  @override
  Widget build(BuildContext context) {
    // print(coinName);
    return Card(
      color: Colors.white.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: <Widget>[
          Container(
            // color: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                isSynced
                    ? Tooltip(
                        message: 'Synchronised',
                        child: FaDuotoneIcon(
                          FontAwesomeIcons.duotoneSyncAlt,
                          primaryColor: Colors.green.withOpacity(.4),
                          secondaryColor: Colors.green,
                          size: 15.0,
                        ),
                      )
                    : Tooltip(
                        message: 'Not Synchronised',
                        child: FaDuotoneIcon(
                          FontAwesomeIcons.duotoneSyncAlt,
                          primaryColor: Colors.redAccent.withOpacity(.4),
                          secondaryColor: Colors.redAccent,
                          size: 15.0,
                        ),
                      ),
                SizedBox(height: 5.0),
                isConnected
                    ? Tooltip(
                        message: 'Connected',
                        child: FaIcon(
                          FontAwesomeIcons.lightShieldCheck,
                          color: Colors.lightBlueAccent,
                          size: 15.0,
                        ),
                      )
                    : Tooltip(
                        message: 'Not connected',
                        child: FaIcon(
                          FontAwesomeIcons.lightLink,
                          color: Colors.redAccent,
                          size: 15.0,
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(width: 5.0),
          CircleAvatar(
            backgroundImage: AssetImage('assets/coin_icons/$coinIcon.png'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 5.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(coinName),
              Text(
                coinTicker,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(coinBalance),
                    Text(
                      coinTicker,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('$coinBalance '),
                    Text(
                      coinTicker,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
