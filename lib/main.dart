import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/homepage.dart';
// import 'package:tracking/backend/models/devices.dart';

// import 'package:telephony/telephony.dart';

// void backgrounMessageHandler(SmsMessage message) async {
//   //Handle background message
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tracking',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
