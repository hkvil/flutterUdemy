import 'dart:convert';
import 'package:http/http.dart';

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

// const apiKey = '30A1DDCE-CD31-4604-B441-80FCF0A273DD'; //key 1
// const apiKey  = 'E8C80567-B2BC-4046-BE2E-4D5CBD7EA672';//key 2
const apiKey = '64513706-FD5A-49EF-BD0F-EC8D435467A2';    //key 3
const coinApi= 'https://rest.coinapi.io/v1/exchangerate/';


class CoinData {


  Future<dynamic> getData(String country) async {
    List data = [];

    for(String crypto in cryptoList){
      var r = await get(Uri.parse('$coinApi$crypto/$country?apikey=$apiKey'));
      if(r.statusCode==200){
        data.add(jsonDecode(r.body));
      }else{
        print('ERROR ${r.statusCode}');
      }
    }
    return data;
    //asset_id_quote rate
  }

}
