import 'package:flutter_task/models/street.dart';

class Location{
  //values
  final Street street;
  final String city;
  final String state;
  //constractor
  Location(this.street,this.city,this.state);
  //data maping
  Location.fromJson(Map<String, dynamic> json)
      : street = Street.fromJson(json['street']),
        city = json['city'],
        state = json['state'];
}