import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import '../backend/controllers/controller_home.dart';
import '../backend/models/types.dart';
import 'api.dart';
import 'home/profile.dart';
// import 'home/syncronize.dart';
import 'select_action.dart';
// import 'settings.dart';
import 'package:http/http.dart' as http;

class DevicesTypeList extends StatefulWidget {
  const DevicesTypeList({Key? key}) : super(key: key);

  @override
  State<DevicesTypeList> createState() => _DevicesTypeListState();
}

class _DevicesTypeListState extends State<DevicesTypeList> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MainHome(),
    // SyncronizePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.blue[300]!,
              hoverColor: Colors.blue[100]!,
              gap: 8,
              activeColor: Colors.blue,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[50]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                // GButton(
                //   icon: LineIcons.syncIcon,
                //   text: 'Syncronize',
                // ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<TypesDevices> allTypesDevices = [];
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
        Uri.parse(deviceTypeUrl),
        headers: getAuthHeaders(controller.token.value),
      );
      List<TypesDevices> allTypes = [];
      // print(jsonDecode(response.body));
      for (var dx in jsonDecode(response.body)) {
        allTypes.add(fromJsonTypesDevices(dx));
      }
      allTypesDevices = allTypes;
    } catch (e) {
      isError = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Image.asset("assets/logo.jpg"),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
          child: Container(
            // height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(50),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      // "24 October, 2022",
                      DateFormat("d MMM, yyy").format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text(
            "Select Device type",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        allTypesDevices.isEmpty && !isError
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : isError
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        isError = false;
                      });
                      fetchData();
                    },
                    child: const Text("Network error: Reload"),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: ListTile(
                            title: Text(
                              allTypesDevices[index].name,
                            ),
                            tileColor:
                                Theme.of(context).primaryColor.withAlpha(50),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            onTap: () {
                              Get.to(SelectActions(
                                deviceType: allTypesDevices[index],
                              ));
                            },
                          ),
                        );
                      },
                      itemCount: allTypesDevices.length,
                    ),
                  ),
      ],
    );
  }
}
