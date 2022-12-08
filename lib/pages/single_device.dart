import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../backend/models/actions.dart';
import '../backend/models/devices.dart';
// import 'devices/send_sms.dart';
import 'package:telephony/telephony.dart';

class SingleDevice extends StatefulWidget {
  final Devices device;
  const SingleDevice({Key? key, required this.device}) : super(key: key);

  @override
  State<SingleDevice> createState() => _SingleDeviceState();
}

class _SingleDeviceState extends State<SingleDevice> {
  final Telephony telephony = Telephony.instance;
  String? msg;
  String status = "";
  @override
  Widget build(BuildContext context) {
    List<ActionsModel> data = allActions;

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.device.device}"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].action),
            subtitle: Text(data[index].code),
            // trailing: Icon(Icons.arrow_forward),
            leading: data[index].icon,
            onTap: () async {
              bool? permissionsGranted =
                  await telephony.requestPhoneAndSmsPermissions;
              if (data[index].phone != "" && permissionsGranted!) {
                // if permission granted

                // ignore: prefer_function_declarations_over_variables
                final SmsSendStatusListener listener = (SendStatus status1) {
                  // Handle the status
                  // print("The status is: $status");
                  setState(() {
                    status = status1.name;
                  });
                };

                // Receive new message
                telephony.listenIncomingSms(
                    onNewMessage: (SmsMessage message) {
                      // Handle message
                      print(message.body);
                      print(message.address);
                      setState(() {
                        msg = message.body;
                      });
                    },
                    listenInBackground: false);

                telephony.sendSms(
                  to: data[index].phone,
                  message: data[index].code,
                  statusListener: listener,
                );

                // botom sheet
                Get.bottomSheet(
                  // backgroundColor: Theme.of(context).cardColor,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Material(
                      // ignore: use_build_context_synchronously
                      color: Theme.of(context).cardColor,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(15),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                msg == null ? 'Please wait...' : "Done",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 10),
                            status != ""
                                ? Text("STATUS: $status")
                                : const SizedBox(height: 10),
                            const SizedBox(height: 10),
                            msg != null
                                ? Text("RESPONSE: ${msg!}")
                                : const Text("RESPONSE: No Response"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  isDismissible: false,
                  enableDrag: true,
                );
              }
            },
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
