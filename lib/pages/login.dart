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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            // height: 200,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: -2,
                  child: Container(
                    height: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  // top: 10,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      // semanticContainer: false,
                      // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
