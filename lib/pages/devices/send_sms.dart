// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../backend/models/actions.dart';
// import 'package:telephony/telephony.dart';

// void sendSms(ActionsModel model, BuildContext context) async {
//   loadingSheet(context);
//   final Telephony telephony = Telephony.instance;
//   bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
//   if (model.phone != "" && permissionsGranted!) {
//     print("helo world");
//     final SmsSendStatusListener listener = (SendStatus status) {
//       // Handle the status
//       print("The status is: $status");
//     };
//     // Receive new message
//     telephony.listenIncomingSms(
//       onNewMessage: (SmsMessage message) {
//         // Handle message
//         print('the messagge is ---->:');
//         print(message.body);
//       },
//     );

//     telephony.sendSms(
//         to: model.phone,
//         message: "May the force be with you!",
//         statusListener: listener);
//   }
// }

// loadingSheet(BuildContext context) {
//   Get.bottomSheet(
//     // backgroundColor: Theme.of(context).cardColor,
//     Padding(
//       padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//       child: Material(
//         color: Theme.of(context).cardColor,
//         clipBehavior: Clip.antiAlias,
//         borderRadius: BorderRadius.circular(15),
//         child: Column(
//           children: const [
//             SizedBox(height: 10),
//             Text('Please wait...', style: TextStyle(fontSize: 20)),
//             SizedBox(height: 10),
//             CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     ),
//     isDismissible: false,
//     enableDrag: true,
//   );
// }
