import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:project/pages/api.dart';

import '../backend/controllers/controller_home.dart';
import 'device_type.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        child: Form(
                          key: loginKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Center(
                                child: Text(
                                  "Let's Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Username',
                                ),
                                controller: username,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field is required";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                ),
                                controller: password,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field is required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (loginKey.currentState!.validate()) {
                                    loginUser();
                                  }
                                },
                                child: const Text("Login"),
                              ),
                            ],
                          ),
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

  loginUser() async {
    Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;
    Get.snackbar(
      "Please Wait",
      "Loading ...",
      duration: const Duration(minutes: 5),
      // ignore: use_build_context_synchronously
      backgroundColor: Theme.of(context).primaryColor.withAlpha(50),
      snackPosition: SnackPosition.BOTTOM,
      showProgressIndicator: true,
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.all(0),
      borderRadius: 0,
    );
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username.text,
          'password': password.text,
        }),
      );
      if (response.statusCode == 200) {
        // Create storage
        final controller = Get.put(HomeController());
        Map tokens = jsonDecode(response.body);
        controller.token.value = tokens['access'];
        Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;
        Get.to(
          const DevicesTypeList(),
        );
      } else if (response.statusCode == 401) {
        Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;
        Get.snackbar(
          "Login error",
          "Username or password is not correct",
          backgroundColor: Colors.red.withAlpha(50),
          snackPosition: SnackPosition.BOTTOM,
          dismissDirection: DismissDirection.horizontal,
          margin: const EdgeInsets.all(0),
          borderRadius: 0,
        );
      }
    } catch (e) {
      Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;
      Get.snackbar(
        "Network error",
        "Check your network connection",
        backgroundColor: Colors.red.withAlpha(50),
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.all(0),
        borderRadius: 0,
      );
    }
  }
}
