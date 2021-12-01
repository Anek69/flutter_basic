// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_import, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'foodmenu.dart';
import 'moneybox.dart';
import 'package:http/http.dart' as http;
import 'exchangerate.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Exchangerate? _dataFromApi;
  @override
  int number = 0;
  void initState() {
    super.initState();
    print("Test");
  }

  Future<void> getExchangeRate() async {
    print("getExchangeRate");

    Map<String, String> map = {
      "access_key": "6945ac873a0a5915d80b90d4c59f7a25",
      "base": "EUR",
      "symbols": "JPY,USD",
    };

    //var url = Uri.http('thaigold.info', '/RealTimeDataV2/gtdata_.txt');
    var url = Uri.http('api.exchangeratesapi.io', '/v1/latest', map);
    var Response = await http.get(url);
    setState(() {
      print(Response.body);
      //     _dataFromApi = exchangerateFromJson(Response.body);
    });

    print(Response.body);
  }

  @override
  //Display
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("อัตราการแลกเปลี่ยน"),
        ),
        body: Column(
          children: [
            LinearProgressIndicator(),
            Text("Text"),
          ],
        ));
  }
}
