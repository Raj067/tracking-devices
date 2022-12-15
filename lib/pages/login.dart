import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text("Let's Login"),
                TextFormField(
                  decoration: const InputDecoration(
                    // border: InputBorder.,
                    icon: Icon(Icons.verified_user),
                    hintText: 'Username',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    // obs
                    // border: InputBorder.,
                    icon: Icon(Icons.remove_red_eye_rounded),
                    hintText: 'Password',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      const Homepage(),
                    );
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
