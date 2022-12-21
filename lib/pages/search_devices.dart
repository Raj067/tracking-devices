import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../backend/controllers/controller_home.dart';
import '../backend/models/actions.dart';
import '../backend/models/devices.dart';
import '../backend/models/types.dart';
import 'api.dart';
import 'device_details.dart';

class SearchDevice extends StatefulWidget {
  const SearchDevice({
    Key? key,
    required this.deviceType,
    required this.action,
  }) : super(key: key);
  final TypesDevices deviceType;
  final ActionsModel action;

  @override
  State<SearchDevice> createState() => _SearchDeviceState();
}

class _SearchDeviceState extends State<SearchDevice> {
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
        Uri.parse("${baseUrl}get-devices/${widget.deviceType.id}/"),
        headers: getAuthHeaders(controller.token.value),
      );
      List<Devices> allTypes = [];
      // print(jsonDecode(response.body));
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
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
            cursorColor: Colors.white,
            // cursorHeight: 26,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Device..',
            ),
            onChanged: (val) {
              search(val);
            }),
        elevation: 0,
      ),
      body: listDevices.isEmpty && !isError
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
                          listDevices[index].device,
                        ),
                        subtitle: Text(
                          widget.deviceType.name,
                        ),
                      );
                    },
                    itemCount: listDevices.length,
                  ),
                ),
    );
  }

  void search(String val) {
    List filteredList = [];
    List remainedList = [];
    for (Devices dx in listDevices) {
      if (stringLinearSearch(val: val, parent: dx.device)) {
        filteredList.add(dx);
      } else {
        remainedList.add(dx);
      }
    }
    List<Devices> newList = [...filteredList, ...remainedList];

    setState(() {
      listDevices = newList;
    });
  }

  bool stringLinearSearch({
    required String val,
    required String parent,
  }) =>
      parent.toLowerCase().contains(
            val.toLowerCase(),
          );
}
