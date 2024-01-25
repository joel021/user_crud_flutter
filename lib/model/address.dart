import 'package:user_crud_flutter/model/geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);
}
