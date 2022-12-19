// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../backend/models/actions.dart';
// import '../backend/models/devices.dart';
// // import 'devices/send_sms.dart';
// import 'package:telephony/telephony.dart';

// class SingleDevice extends StatefulWidget {
//   final Devices device;
//   const SingleDevice({Key? key, required this.device}) : super(key: key);

//   @override
//   State<SingleDevice> createState() => _SingleDeviceState();
// }

// class _SingleDeviceState extends State<SingleDevice> {
//   final Telephony telephony = Telephony.instance;

//   @override
//   void initState() {
//     telephony.listenIncomingSms(
//         onNewMessage: (SmsMessage message) {
//           // Handle message
//           message.address!.endsWith(widget.device.phone)
//               ? setState(() {
//                   Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;

//                   Get.snackbar(
//                     "Response from ${message.address}",
//                     "RESPONSE: ${message.body!}\nDevice: ${widget.device.device}\nPhone: ${widget.device.phone}",
//                     // icon: const Icon(Icons.message),
//                     duration: const Duration(seconds: 60),
//                     backgroundColor:
//                         Theme.of(context).primaryColor.withAlpha(50),
//                     snackPosition: SnackPosition.BOTTOM,
//                     margin: const EdgeInsets.all(15),
//                     dismissDirection: DismissDirection.horizontal,
//                   );
//                 })
//               : true;
//           // print(message.body);
//           // print(message.address!.endsWith(widget.device.phone));
//           // print(widget.device.phone);
//         },
//         listenInBackground: false);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<ActionsModel> data = allActions;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.device.device}"),
//         elevation: 0,
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(data[index].action),
//             subtitle: Text(data[index].code),
//             // trailing: Icon(Icons.arrow_forward),
//             leading: data[index].icon,
//             onTap: () async {
//               bool? permissionsGranted =
//                   await telephony.requestPhoneAndSmsPermissions;
//               if (permissionsGranted!) {
//                 // if permission granted

//                 // ignore: prefer_function_declarations_over_variables
//                 final SmsSendStatusListener listener = (SendStatus status) {
//                   // Handle the status
//                   Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;
//                   Get.snackbar(
//                     "Message to ${widget.device.device}",
//                     "ACTION: ${data[index].action}\nSTATUS: ${status.name}\nCODE: ${data[index].code}\nDevice: ${widget.device.device}\nPhone: ${widget.device.phone}\nRESPONSE: Waiting",
//                     icon: const Icon(Icons.notifications),
//                     duration: const Duration(seconds: 60),
//                     // ignore: use_build_context_synchronously
//                     backgroundColor:
//                         Theme.of(context).primaryColor.withAlpha(50),
//                     snackPosition: SnackPosition.BOTTOM,
//                     margin: const EdgeInsets.all(15),
//                     dismissDirection: DismissDirection.horizontal,
//                   );
//                 };

//                 telephony.sendSms(
//                   to: widget.device.phone,
//                   message: data[index].code,
//                   statusListener: listener,
//                 );
//               }
//             },
//           );
//         },
//         itemCount: data.length,
//       ),
//     );
//   }
// }
