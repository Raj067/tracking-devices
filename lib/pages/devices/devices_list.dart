import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../backend/controllers/controller_home.dart';
import '../../backend/models/actions.dart';
// import '../../backend/models/devices.dart';
import '../../backend/models/devices.dart';
import '../../backend/models/types.dart';
import '../api.dart';
import '../device_details.dart';

class DevicesList extends StatefulWidget {
  const DevicesList({
    Key? key,
    required this.deviceType,
    required this.action,
  }) : super(key: key);
  final TypesDevices deviceType;
  final ActionsModel action;

  @override
  State<DevicesList> createState() => _DevicesListState();
}

class _DevicesListState extends State<DevicesList> {
  // get-devices/<id:uuid>/
  List<Devices> listDevices = [];
  final controller = Get.put(HomeController());
  bool isError = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      var response = await http.get(
        Uri.parse("${baseUrl}get-devices/"),
        headers: getAuthHeaders(controller.token.value),
      );
      List<Devices> allTypes = [];
      print(jsonDecode(response.body));
      for (var dx in jsonDecode(response.body)) {
        allTypes.add(fromJsonDevices(dx));
      }
      listDevices = allTypes;
    } catch (e) {
      isError = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return listDevices.isEmpty && !isError
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : isError
            ? Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isError = false;
                    });
                    fetchData();
                  },
                  child: const Text("Network error: Reload"),
                ),
              )
            : Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        // Get.to(SingleDevice(device: listDevices[index]));
                        Get.to(
                          DevicesDetails(
                            device: listDevices[index],
                            deviceType: widget.deviceType,
                            action: widget.action,
                          ),
                        );
                      },
                      title: Text(
                        "${listDevices[index].device}",
                      ),
                    );
                  },
                  itemCount: listDevices.length,
                ),
              );
  }
}
