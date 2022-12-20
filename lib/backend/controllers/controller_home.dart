import 'package:get/get.dart';
import '../models/devices.dart';

class HomeController extends GetxController {
  RxList<Devices> devices = <Devices>[].obs;

  var token = "".obs;
  @override
  void onInit() {
    super.onInit();
    devices = listDevices.obs;
  }

  void search(String val) {
    List filteredList = [];
    List remainedList = [];
    for (Devices dx in devices) {
      if (stringLinearSearch(val: val, parent: "${dx.device}")) {
        filteredList.add(dx);
      } else {
        remainedList.add(dx);
      }
    }
    List<Devices> newList = [...filteredList, ...remainedList];
    devices.value = newList;
    update();
  }

  bool stringLinearSearch({
    required String val,
    required String parent,
  }) =>
      parent.toLowerCase().contains(
            val.toLowerCase(),
          );
}
