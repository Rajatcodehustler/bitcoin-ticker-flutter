import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/converter.dart';
import 'package:bitcoin_ticker/price_screen.dart';

class API {


  API();

  Future<double> api(String vlcr1, String vlcrpt2) async{
    Convert convert =  Convert(currency:  vlcr1, CryptoCR: vlcrpt2);
    double rate5 = await convert.APIgetter();
    print(rate5);
    return rate5;

  }
}