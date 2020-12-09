import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/widgets/appbar/main_appbar.dart';

void main() => runApp(Routes());

class MainScreen extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainScreen>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: MainAppbar(),
        )
      );
  }
}

