import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/converter.dart';
import 'package:bitcoin_ticker/API.dart';
import 'package:hotreloader/hotreloader.dart';
import 'dart:convert';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  List<Text> currencies1 = [];
  String value1 ='USD';
  int value2;
  double value3;
  double value4;
  double value5;
  var value10;
  var value11;
  var value12;
  bool check = false;
   void initState(){
    super.initState();

  }




    Padding Convertscrn(String crypto1, String currency1,int value4) {
      if((value3==null)&&(value4==null)&&(value5==null)){
        return Padding(
          padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                'please select the currency, and then the corresponding rates will be shown ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }


      return Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $crypto1 = $value4 $currency1 ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );


    }

    DropdownButton<String> currencylist() {
    List<DropdownMenuItem<String>> currencies = [];
    for(String x in currenciesList){
      var currency1 = DropdownMenuItem(child: Text(x),value: x,);
      currencies.add(currency1);
    }
    return DropdownButton<String>(
        value: value1,
        items: currencies,
        onChanged:  (value) async{
          API api1 =  API();
          value3 =   await api1.api(value, 'BTC' );
          value12 = value3.round();
          print(value12);
          value4 = await api1.api(value, 'ETH');
          value11 = value4.round();
          print(value11);
          value5 = await api1.api(value, 'LTC');
          value10 = value5.round();
          print(value10);

          setState(() {
            value1 = value;
            check = true;

          });
        }
    );
  }

  List<Text> iosroll(){
    for(String x1 in currenciesList){
      currencies1.add(Text(x1),);
    }
    return currencies1;
  }
  CupertinoPicker ioswhl() {
    return CupertinoPicker(itemExtent: 10.0, onSelectedItemChanged: (invalue){
      setState(() {
        value2 = invalue;
      });
    },
    children: iosroll(),);

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
        children: [
          Container(
            child:Column(
              children: [
                Convertscrn('BTC', value1, value12),
                Visibility(child: Convertscrn('ETH', value1, value11),
                visible:check,),
                Visibility(child:Convertscrn('LTC', value1, value10), visible: check, ),


              ],
            ),
          ),





          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: currencylist(),
          ),
        ],
      ),
    );
  }
}
