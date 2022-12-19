import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/controllers/controller_home.dart';
import '../../backend/models/actions.dart';
// import '../../backend/models/devices.dart';
import '../../backend/models/types.dart';
import '../device_details.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({
    Key? key,
    required this.deviceType,
    required this.action,
  }) : super(key: key);
  final TypesDevices deviceType;
  final ActionsModel action;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scrollbar(
      child: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            // List<Devices> devices = [];
            // for (var e in controller.devices) {
            //   if (e.deviceTypeId == deviceType.id) {
            //     devices.add(e);
            //   }
            // }
            return ListTile(
              onTap: () {
                // Get.to(SingleDevice(device: controller.devices[index]));
                Get.to(
                  DevicesDetails(
                    device: controller.devices[index],
                    deviceType: deviceType,
                    action: action,
                  ),
                );
              },
              title: Text(
                "${controller.devices[index].device}",
              ),
            );
          },
          itemCount: controller.devices.length,
        ),
      ),
    );
  }
}
