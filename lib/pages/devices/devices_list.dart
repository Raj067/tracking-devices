import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/controllers/controller_home.dart';
import '../single_device.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scrollbar(
      child: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(SingleDevice(device: controller.devices[index]));
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
