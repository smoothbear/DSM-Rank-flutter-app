import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/person.dart';

class PersonTile extends StatelessWidget {
  PersonTile(this._person);
  final Person _person;

  @override
  Widget build(BuildContext context) {
    int rank = 1;
    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(_person.githubImage)),
      title: Row(
          children: [
            Text(
              "#" + rank.toString() + " ",
              style: TextStyle(fontSize: 20),
            ),
          Text(
            _person.name,
            style: TextStyle(fontSize: 20),
          ),
        ]));
  }
  
}