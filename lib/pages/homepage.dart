import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/models/actions.dart';
import '../backend/models/types.dart';
import 'devices/devices_list.dart';
import 'search_devices.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key, required this.deviceType, required this.action})
      : super(key: key);
  final TypesDevices deviceType;
  final ActionsModel action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Devices",
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SearchDevice(deviceType: deviceType, action: action));
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: DevicesList(
        deviceType: deviceType,
        action: action,
      ),
    );
  }
}
