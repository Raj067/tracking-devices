import 'package:flutter/material.dart';

class ActionsModel {
  String action;
  String code;
  Icon icon;
  ActionsModel({
    required this.action,
    required this.code,
    required this.icon,
  });
}

List<ActionsModel> allActions = [
  ActionsModel(
    action: "SMS query status",
    code: "AS1234*269#R#",
    icon: const Icon(Icons.edit),
  ),
  ActionsModel(
    action: "Check version",
    code: "AS1234*269#V#",
    icon: const Icon(Icons.edit),
  ),
  ActionsModel(
    action: "Query authorized number",
    code: "AS1234*269#P#",
    icon: const Icon(Icons.edit),
  ),
  ActionsModel(
    action: "Send SMS to 255679190720",
    code: "AS1234*269#P#",
    icon: const Icon(Icons.edit),
  ),
];
