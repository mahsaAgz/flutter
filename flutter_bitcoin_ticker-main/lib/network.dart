import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.currency);
  final currency;
  int btcRate;
  int ethRate;
  int ltcRate;

  Future<int> getRate(String base) async {
    String authority = 'rest.coinapi.io';
    var requestData = {
      "apikey": "05BC4981-8224-4386-A1C6-684D315FF163",
    };
    String unencodedPath = 'v1/exchangerate/$base/$currency';
    var url = Uri.https(authority, unencodedPath, requestData);
    var response = await http.get(url);
    var rate=jsonDecode(response.body)["rate"];
    return rate!=null ?rate.toInt() :0 ;
  }
  Future setRates()async{
    btcRate=await getRate('BTC');
    ethRate=await getRate('ETH');
    ltcRate=await getRate('LTC');

  }

}
