import '../../backend/models/actions.dart';
import 'package:telephony/telephony.dart';

void sendSms(ActionsModel model) async {
  final Telephony telephony = Telephony.instance;
  bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
  if (model.phone != "" && permissionsGranted!) {
    print("helo world");
    final SmsSendStatusListener listener = (SendStatus status) {
      // Handle the status
      print("The status is: ${status}");
    };

    telephony.sendSms(
        to: model.phone,
        message: "May the force be with you!",
        statusListener: listener);
  }
}
