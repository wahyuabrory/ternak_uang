import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ternak_uang/datamodel/stockpricemodel.dart';

class LiveChartPage extends StatefulWidget {
  @override
  _LiveChartPageState createState() => _LiveChartPageState();
}

class _LiveChartPageState extends State<LiveChartPage> {
  late Future<List<stockpricemodel>> futureStocks;

  @override
  void initState() {
    super.initState();
    futureStocks = fetchHargaSaham();
  }

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
      throw Exception(
          'Failed load data with status code ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Chart Page'),
      ),
      body: Center(
        child: FutureBuilder<List<stockpricemodel>>(
          future: futureStocks,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].symbol),
                      subtitle: Text('High: ${snapshot.data![index].high}'),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
