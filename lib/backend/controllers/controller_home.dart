import 'package:get/get.dart';
import '../models/devices.dart';

class HomeController extends GetxController {
  RxList<Devices> devices = <Devices>[].obs;

  var token = "".obs;
}
