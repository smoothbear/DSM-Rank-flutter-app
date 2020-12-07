import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class Routes extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSM Rank',
      initialRoute: '/',
      routes: {
        "/": (BuildContext context) => MainScreen(),
      },
    );
  }
}