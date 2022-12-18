import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage.dart';

class DevicesTypeList extends StatelessWidget {
  const DevicesTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devices List"),
        elevation: 0,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("First 1"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Second 2"),
            onTap: () {},
          ),
          const Text("Hello World"),
          ElevatedButton(
            onPressed: () {
              Get.to(const Homepage());
            },
            child: const Text("Hello !"),
          ),
        ],
      ),
    );
  }
}
