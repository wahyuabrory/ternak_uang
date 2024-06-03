import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ternak_uang/stockbrokermodel.dart';
import 'package:ternak_uang/stockpricemodel.dart';

String url = "https://api.goapi.io";
String api = '143c28af-f2d1-5e5b-7e7e-4e7f9e28';

// connect untuk harga saham
Future<List<stockpricemodel>> fetchHargaSaham() async {
  final String apiKey = api;
  final String endpoint = url + '/stock/idx/prices';

  final response = await http.get(
    Uri.parse(endpoint),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
  );

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => stockpricemodel.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load stock prices');
  }
}

// connect untuk API Broker
Future<List<stockbrokermodel>> fetchBroker() async {
  final String apiKey = api;
  final String endpoint = 'https://api.goapi.io/stock/idx/brokers';
  final response = await http.get(
    Uri.parse(endpoint),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $api',
    },
  );

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => stockbrokermodel.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load stock prices');
  }
}
