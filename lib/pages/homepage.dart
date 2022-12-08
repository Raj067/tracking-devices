import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'devices/devices_list.dart';
import 'search_devices.dart';
import 'settings.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tracking Devices",
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const SearchDevice());
            },
            icon: const Icon(
              Icons.search,
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
              // PopupMenuItem(
              //   child: GestureDetector(
              //     child: const Text(
              //       'Settings',
              //     ),
              //     onTap: () {
              //       Get.back();
              //       Get.to(const Settings());
              //     },
              //   ),
              // ),
              const PopupMenuItem(
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  // leading: Icon(Icons.privacy_tip),
                  minVerticalPadding: 0,
                  minLeadingWidth: 0,
                  // horizontalTitleGap: 0,
                  title: Text('Privacy'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text('Version 1.0.0')),
            ],
          ),
        ],
      ),
      body: const DevicesList(),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       UserAccountsDrawerHeader(
      //         currentAccountPicture: const CircleAvatar(
      //           backgroundImage: NetworkImage(
      //               'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
      //         ),
      //         accountEmail: const Text('jane.doe@example.com'),
      //         accountName: const Text(
      //           'Jane Doe',
      //           style: TextStyle(fontSize: 24.0),
      //         ),
      //         decoration: BoxDecoration(
      //           color: Theme.of(context).primaryColor,
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.settings),
      //         title: const Text(
      //           'Settings',
      //         ),
      //         onTap: () {
      //           Get.to(const Settings());
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.apartment),
      //         title: const Text(
      //           'Apartments',
      //         ),
      //         onTap: () {
      //           //
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
