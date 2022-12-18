import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          ListTile(
            title: const Text("Syncronization"),
            subtitle: const Text("Syncronize the online data"),
            leading: const Icon(
              Icons.sync,
            ),
            onTap: () {
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
          ),
        ],
      ),
    );
  }
}
