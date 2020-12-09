import 'dart:convert';

class Person {
  String email;
  String githubId;
  String githubImage;
  String name;
  String description;
  int contributions;

  Person(this.email, this.githubId, this.githubImage, this.name, this.description, this.contributions);

  factory Person.fromJson(dynamic json) {
    return Person(json['email'] as String, json['githubId'] as String, json['githubImage'] as String
      , json['name'] as String, json['description'] as String, json['contributions'] as int
    );
  }
}