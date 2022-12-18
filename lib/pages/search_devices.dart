import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../backend/controllers/controller_home.dart';
import '../backend/models/types.dart';
import 'devices/devices_list.dart';

class SearchDevice extends StatelessWidget {
  const SearchDevice({Key? key, required this.deviceType}) : super(key: key);
  final TypesDevices deviceType;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
            cursorColor: Colors.white,
            // cursorHeight: 26,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Device..',
            ),
            onChanged: (val) {
              controller.search(val);
            }),
        elevation: 0,
      ),
      body: DevicesList(deviceType: deviceType),
    );
  }
}
