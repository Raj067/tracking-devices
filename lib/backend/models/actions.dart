class ActionsModel {
  String action;
  String code;
  ActionsModel({
    required this.action,
    required this.code,
  });
}

ActionsModel fromJsonActionsModel(Map<String, dynamic> e) {
  return ActionsModel(
    action: e['action'],
    code: e['code'],
  );
}

// List<ActionsModel> allActions = [
//   ActionsModel(
//     action: "SMS query status",
//     code: "AS1234*269#R#",
//     icon: const Icon(Icons.edit),
//   ),
//   ActionsModel(
//     action: "Check version",
//     code: "AS1234*269#V#",
//     icon: const Icon(Icons.vertical_shades),
//   ),
//   ActionsModel(
//     action: "Query authorized number",
//     code: "AS1234*269#P#",
//     icon: const Icon(Icons.open_in_browser),
//   ),
//   ActionsModel(
//     action: "Unlock device",
//     code: "AS1234*269#8,888888#",
//     icon: const Icon(Icons.open_in_full),
//   ),
// ];
