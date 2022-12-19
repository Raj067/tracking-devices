import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import '../backend/models/types.dart';
import 'select_action.dart';
// import 'settings.dart';

class DevicesTypeList extends StatelessWidget {
  const DevicesTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: const Text("Devices Tracking"),
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Get.to(const Settings());
      //       },
      //       icon: const Icon(
      //         Icons.settings,
      //       ),
      //     ),
      //   ],
      // ),
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
                GButton(
                  icon: LineIcons.syncIcon,
                  text: 'Syncronize',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              // selectedIndex: _selectedIndex,
              onTabChange: (index) {
                // setState(() {
                //   _selectedIndex = index;
                // });
              },
            ),
          ),
        ),
      ),
      body: Column(
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ListTile(
                    title: Text(
                      allTypesDevices[index].name,
                    ),
                    tileColor: Theme.of(context).primaryColor.withAlpha(50),
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
      ),
    );
  }
}
