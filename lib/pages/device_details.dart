import 'package:flutter/material.dart';

import '../backend/models/actions.dart';
import '../backend/models/devices.dart';
import '../backend/models/types.dart';

class DevicesDetails extends StatelessWidget {
  const DevicesDetails({
    Key? key,
    required this.deviceType,
    required this.device,
    required this.action,
  }) : super(key: key);
  final TypesDevices deviceType;
  final Devices device;
  final ActionsModel action;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Details"),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
        children: [
          Container(
            // height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(0),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DEVICE TYPE: ${deviceType.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "DEVICE ID: ${device.device}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "ACTION: ${action.action}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("SEND REQUEST"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
