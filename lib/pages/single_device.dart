import 'package:flutter/material.dart';
import '../backend/models/actions.dart';
import '../backend/models/devices.dart';
import 'devices/send_sms.dart';

class SingleDevice extends StatelessWidget {
  final Devices device;
  const SingleDevice({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              sendSms(data[index]);
            },
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
