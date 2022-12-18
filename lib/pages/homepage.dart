import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/models/types.dart';
import 'devices/devices_list.dart';
import 'privacy.dart';
import 'search_devices.dart';
import 'settings.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key, required this.deviceType}) : super(key: key);
  final TypesDevices deviceType;

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
              Get.to(SearchDevice(deviceType: deviceType));
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;
              Get.snackbar(
                "Syncronization",
                "Syncronizing database",
                icon: const Icon(Icons.sync),
                duration: const Duration(seconds: 60),
                // ignore: use_build_context_synchronously
                backgroundColor: Theme.of(context).primaryColor.withAlpha(50),
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.all(15),
                dismissDirection: DismissDirection.horizontal,
              );
            },
            icon: const Icon(
              Icons.sync,
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                // padding: const EdgeInsets.all(0),
                child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    // leading: Icon(Icons.privacy_tip),
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    title: const Text('Settings'),
                    onTap: () {
                      Get.back();
                      Get.to(const Settings());
                    }),
              ),
              PopupMenuItem(
                child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    // horizontalTitleGap: 0, PrivacyPage
                    title: const Text('Privacy'),
                    onTap: () {
                      Get.back();
                      Get.to(const PrivacyPage());
                    }),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text('Version 1.0.0')),
            ],
          ),
        ],
      ),
      body: DevicesList(deviceType: deviceType),
    );
  }
}
