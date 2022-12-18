import 'package:flutter/material.dart';

class TypesDevices {
  String name;
  TypesDevices({
    required this.name,
  });
}

List<TypesDevices> allTypesDevices = [
  TypesDevices(
    name: "SMS query status",
  ),
  TypesDevices(
    name: "Check version",
  ),
  TypesDevices(
    name: "Query authorized number",
  ),
  TypesDevices(
    name: "Unlock device",
  ),
];
