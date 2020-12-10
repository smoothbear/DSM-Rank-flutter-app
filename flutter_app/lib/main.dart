import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/person.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/ui/PersonTile.dart';
import 'package:flutter_app/widgets/appbar/main_appbar.dart';
import 'package:http/http.dart';

void main() => runApp(Routes());

class MainScreen extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainScreen>{
  List<Person> people;
  String url = 'http://52.79.253.30:5050';
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: MainAppbar(),
        ),
          body: _buildList()
      );
  }

  Widget _buildList() {
    return ListView.separated(
      itemCount: people.length,
      itemBuilder: (BuildContext _context, int index) {
        return PersonTile(people[index]);
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  void _getPerson() async {
      Response response = await get(url + '/rank');
      final decoded = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(decoded);
      List rank = map['rank'];
      people = rank.map((people) => Person.fromJson(people)).toList();
  }
}

