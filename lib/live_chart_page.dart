import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ternak_uang/conn.dart';
import 'package:ternak_uang/stockbrokermodel.dart';

class LiveChartPage extends StatefulWidget {
  @override
  _LiveChartPageState createState() => _LiveChartPageState();
}

class _LiveChartPageState extends State<LiveChartPage> {
  late Future<List<stockbrokermodel>> futureStocks;

  @override
  void initState() {
    super.initState();
    futureStocks = fetchBroker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Chart Page'),
      ),
      body: Center(
        child: FutureBuilder<List<stockbrokermodel>>(
          future: futureStocks,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].ticker),
                      subtitle: Text(snapshot.data![index].name),
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
