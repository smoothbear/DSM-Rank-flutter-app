import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/person.dart';

class PersonTile extends StatelessWidget {
  PersonTile(this._person);
  final Person _person;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_person.githubImage)
      ),
      title: Text(_person.name),
    );
  }
  
}