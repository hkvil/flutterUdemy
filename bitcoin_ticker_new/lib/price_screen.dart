import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';
import 'reusable_card.dart';

CoinData coinData = CoinData();
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {


  String? selectedCurrency = currenciesList[0];           //first selected item when bootup
  List<DropdownMenuItem<String>>? dropDownItemList = [];  //store item based on currencyList
  List<Widget> cupertinoItemList = [];                    //store item based on currencyList
  List dataPriceScreen = [];                              //store decoded response from coinData

  getAndroidDropDown(){
    return DropdownButton(
        value: '$selectedCurrency',
        items: dropDownItemList,
        onChanged: (value){
          updateUI(value);
        });
  }
  getIosPicker(){
    return CupertinoPicker(itemExtent: 40, onSelectedItemChanged: (value){
      setState((){
        selectedCurrency = currenciesList[value];
        getData(selectedCurrency!);
      });
    }, children: cupertinoItemList);
  }

  getItemList(){
    dropDownItemList = [];
    cupertinoItemList=[];
    for(String cur in currenciesList){
      var r =DropdownMenuItem(child: Text(cur),value: cur);
      var c =Text(cur);
      dropDownItemList?.add(r);
      cupertinoItemList.add(c);
    }
  }
  Future<dynamic> getData(String country)async{
    var r = await coinData.getData(country);
    return r;
  }
  getLocalData(int i){
    if(dataPriceScreen.isNotEmpty){
      return '${dataPriceScreen[i]['rate'].toInt()} $selectedCurrency';
    }else{
      return '? $selectedCurrency';
    }
  }
  updateUI(var value)async{
    //WAIT API CALL BEFORE CHANGING STATE
    Platform.isAndroid?dataPriceScreen=await getData(value):dataPriceScreen=await getData(currenciesList[value]);
    setState((){
      selectedCurrency = value;
    });
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getItemList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCard(coinText: 'BTC',coinRate: getLocalData(0)),
          ReusableCard(coinText: 'ETH',coinRate: getLocalData(1)),
          ReusableCard(coinText: 'LTC',coinRate: getLocalData(2)),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid?getAndroidDropDown():getIosPicker(),
          ),
        ],
      ),
    );
  }
}
