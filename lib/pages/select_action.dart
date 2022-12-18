import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/models/actions.dart';
import '../backend/models/types.dart';
import 'homepage.dart';

class SelectActions extends StatelessWidget {
  const SelectActions({Key? key, required this.deviceType}) : super(key: key);
  final TypesDevices deviceType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Action for ${deviceType.name}"),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: ListTile(
              title: Text(allActions[index].action),
              subtitle: Text(allActions[index].code),
              tileColor: Theme.of(context).primaryColor.withAlpha(50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              onTap: () {
                Get.to(Homepage(
                  deviceType: deviceType,
                ));
              },
            ),
          );
        },
        itemCount: allActions.length,
      ),
    );
  }
}
