import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bitcoin_ticker/network.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({this.cur});
  String cur;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int btcRate;
  int ethRate;
  int ltcRate;
  String currency;

  void initState() {
    super.initState();
    currency = widget.cur??'USD';
    getRate(currency);
  }

  void getRate(String currency) async {
    NetworkHelper networkHelper = NetworkHelper(currency);
    await networkHelper.setRates();
    btcRate = networkHelper.btcRate;
    ethRate = networkHelper.ethRate;
    ltcRate = networkHelper.ltcRate;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PriceScreen(
              btcRate: btcRate,
              ethRate: ethRate,
              ltcRate: ltcRate,
              selectedCurrency: currency),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.lightBlue,
          size: 70.0,
        ),
      ),
    );
  }
}
