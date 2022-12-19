import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import '../backend/models/actions.dart';
import '../backend/models/devices.dart';
import '../backend/models/types.dart';

class DevicesDetails extends StatefulWidget {
  const DevicesDetails({
    Key? key,
    required this.deviceType,
    required this.device,
    required this.action,
  }) : super(key: key);
  final TypesDevices deviceType;
  final Devices device;
  final ActionsModel action;

  @override
  State<DevicesDetails> createState() => _DevicesDetailsState();
}

class _DevicesDetailsState extends State<DevicesDetails> {
  final Telephony telephony = Telephony.instance;
  @override
  void initState() {
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          // Handle message
          // String phone = "0";
          message.address!.endsWith(widget.device.phone)
              ? setState(() {
                  Get.isSnackbarOpen ? Get.closeCurrentSnackbar() : true;

                  Get.snackbar(
                    "Response from ${widget.device.device}",
                    "RESPONSE: ${message.body!}\nPhone: ${widget.device.phone}",
                    // icon: const Icon(Icons.message),
                    duration: const Duration(seconds: 30),
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(50),
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(15),
                    dismissDirection: DismissDirection.horizontal,
                  );
                })
              : true;
          // print(message.body);
          // print(message.address!.endsWith(widget.device.phone));
          // print(widget.device.phone);
        },
        listenInBackground: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Details"),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
        children: [
          Container(
            // height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(0),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DEVICE TYPE: ${widget.deviceType.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "DEVICE ID: ${widget.device.device}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "PHONE: ${widget.device.phone}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "CODE: ${widget.action.code}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "ACTION: ${widget.action.action}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      bool? permissionsGranted =
                          await telephony.requestPhoneAndSmsPermissions;
                      if (permissionsGranted!) {
                        // if permission granted

                        // ignore: prefer_function_declarations_over_variables
                        final SmsSendStatusListener listener =
                            (SendStatus status) {
                          // Handle the status
                          Get.isSnackbarOpen
                              ? Get.closeCurrentSnackbar()
                              : true;
                          Get.snackbar(
                            "Message to ${widget.device.device}",
                            "STATUS: ${status.name}\nRESPONSE: Waiting",
                            icon: const Icon(Icons.notifications),
                            duration: const Duration(minutes: 5),
                            // ignore: use_build_context_synchronously
                            backgroundColor:
                                Theme.of(context).primaryColor.withAlpha(50),
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.all(15),
                            dismissDirection: DismissDirection.horizontal,
                          );
                        };

                        telephony.sendSms(
                          to: widget.device.phone,
                          message: widget.action.code,
                          statusListener: listener,
                        );
                      }
                    },
                    child: const Text("SEND REQUEST"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
