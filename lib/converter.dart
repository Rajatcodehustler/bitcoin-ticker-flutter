import 'package:flutter/material.dart';
import'package:http/http.dart' as http;
import 'dart:convert';
class Convert {

  String currency;
  String CryptoCR;
  String url;

  Convert({this.currency, this.CryptoCR,});

  Future APIgetter() async {
    try {
      url =
      'https://rest.coinapi.io/v1/exchangerate/$CryptoCR/$currency?apikey=19A27C3D-D1BE-4904-8C99-178055AFA5D6';
      http.Response response = await http.get(Uri.parse(url
      ),);
      String rate = response.body;
      if(response.statusCode == 200) {
        double rate1 = jsonDecode(rate)['rate'];
        return rate1;
      }
      else{
        print(response.statusCode);
      }
    }
    catch (e) {
      print(e);
    }
  }
}
