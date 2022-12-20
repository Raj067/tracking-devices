import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/controllers/controller_home.dart';
import '../backend/models/actions.dart';
import '../backend/models/types.dart';
import 'api.dart';
import 'homepage.dart';

class SelectActions extends StatefulWidget {
  const SelectActions({Key? key, required this.deviceType}) : super(key: key);
  final TypesDevices deviceType;

  @override
  State<SelectActions> createState() => _SelectActionsState();
}

class _SelectActionsState extends State<SelectActions> {
  List<ActionsModel> allActions = [];
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
        Uri.parse(actionUrl),
        headers: getAuthHeaders(controller.token.value),
      );
      List<ActionsModel> allTypes = [];
      // print(jsonDecode(response.body));
      for (var dx in jsonDecode(response.body)) {
        allTypes.add(fromJsonActionsModel(dx));
      }
      allActions = allTypes;
    } catch (e) {
      isError = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Action for ${widget.deviceType.name}"),
        elevation: 0,
      ),
      body: allActions.isEmpty && !isError
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
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ListTile(
                        title: Text(allActions[index].action),
                        subtitle: Text(allActions[index].code),
                        tileColor: Theme.of(context).primaryColor.withAlpha(50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        onTap: () {
                          Get.to(Homepage(
                            deviceType: widget.deviceType,
                            action: allActions[index],
                          ));
                        },
                      ),
                    );
                  },
                  itemCount: allActions.length,
                ),
    );
  }
}
