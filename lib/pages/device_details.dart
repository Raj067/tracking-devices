import 'package:flutter/material.dart';

import '../backend/models/devices.dart';
import '../backend/models/types.dart';

class DevicesDetails extends StatelessWidget {
  const DevicesDetails(
      {Key? key, required this.deviceType, required this.device})
      : super(key: key);
  final TypesDevices deviceType;
  final Devices device;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Details"),
        elevation: 0,
      ),
      body: const Text("Hello World"),
    );
  }
}
