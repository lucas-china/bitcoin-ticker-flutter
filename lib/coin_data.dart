import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'EED6EA8D-6A60-4394-8D9F-1CAE1C8AD116';
const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';
class CoinData {
  Future getCoinData() async {
    http.Response response = await http.get('$url?apikey=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      var coinData = convert.jsonDecode(data);
      var rate = coinData['rate'];
      return rate;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
