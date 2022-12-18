import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/controllers/controller_home.dart';
import '../../backend/models/types.dart';
import '../device_details.dart';
import '../single_device.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({Key? key, required this.deviceType}) : super(key: key);
  final TypesDevices deviceType;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scrollbar(
      child: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                // Get.to(SingleDevice(device: controller.devices[index]));
                Get.to(DevicesDetails(device: controller.devices[index], deviceType:deviceType));
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
