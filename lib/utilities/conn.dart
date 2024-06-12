import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ternak_uang/datamodel/stockbrokermodel.dart';
import 'package:ternak_uang/datamodel/stockpricemodel.dart';

String url = "https://api.goapi.io/";
String api = 'f3cab52a-d57e-57d7-277a-3c6feea3';

// connect untuk harga saham
// Future<List<stockpricemodel>> fetchHargaSaham() async {
//   final String endpoint = url + 'stock/idx/prices';

//   final response = await http.get(
//     Uri.parse(endpoint),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $api',
//     },
//   );

//   if (response.statusCode == 200) {
//     final jsonResponse = json.decode(response.body);
//     final List<dynamic> data = jsonResponse['data'];
//     return data.map((item) => stockpricemodel.fromJson(item)).toList();
//   } else {
//     throw Exception('Failed to load stock prices');
//   }
// }

Future<List<stockpricemodel>> fetchHargaSaham() async {
  final response = await http.get(
    Uri.parse('https://api.goapi.io/stock/idx/prices'),
    headers: {
      'Authorization': 'Bearer f3cab52a-d57e-57d7-277a-3c6feea3',
      // atau jika API key diletakkan dalam header dengan nama lain
      // 'x-api-key': 'your_api_key_here',
    },
  );
  if (response.statusCode == 200) {
    // Parse JSON response
    final jsonResponse = json.decode(response.body);
    final List<dynamic> data = jsonResponse['data'];

    return data.map((item) => stockpricemodel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load prices');
  }
}

// connect untuk API Broker
Future<List<stockbrokermodel>> fetchBroker() async {
  final String endpoint = 'https://api.goapi.io/stock/idx/brokers';
  final response = await http.get(
    Uri.parse(endpoint),
    headers: {
      'X-API-KEY': '<$api>',
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
