import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Logout"),
            // subtitle: const Text("Syncronize the online data"),
            leading: const Icon(
              Icons.logout,
            ),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
