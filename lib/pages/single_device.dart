import 'package:flutter/material.dart';
import '../backend/models/actions.dart';
import '../backend/models/devices.dart';

class SingleDevice extends StatelessWidget {
  final Devices device;
  const SingleDevice({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<ActionsModel> data = List<ActionsModel>.generate(
    //   15,
    //   (index) => ActionsModel(
    //       action: 'Action $index',
    //       code: "Code $index",
    //       icon: const Icon(Icons.color_lens)),
    // );
    List<ActionsModel> data = allActions;

    return Scaffold(
      appBar: AppBar(
        title: Text("${device.device}"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].action),
            subtitle: Text(data[index].code),
            // trailing: Icon(Icons.arrow_forward),
            leading: data[index].icon,
            onTap: () {
              // Get.to(const SingleDevice());
            },
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
