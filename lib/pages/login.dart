import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'device_type.dart';
// import 'homepage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(child: Text("Let's Login")),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(
                          const DevicesTypeList(),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
