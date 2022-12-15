import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/pages/login.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Theme Settings"),
            subtitle: const Text("Change to dark or light mode"),
            // trailing: Icon(Icons.arrow_forward),
            leading: const Icon(
              Icons.color_lens,
            ),
            onTap: () {
              Get.changeTheme(
                Get.isDarkMode
                    ? ThemeData(
                        primarySwatch: Colors.brown,
                        // useMaterial3: true,
                      )
                    : ThemeData.dark(),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(const Login());
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
