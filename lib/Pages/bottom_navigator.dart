import 'package:cipherx/Pages/Add.dart';
import 'package:cipherx/Pages/Budget.dart';
import 'package:cipherx/Pages/Home.dart';
import 'package:cipherx/Pages/Profile.dart';
import 'package:cipherx/Pages/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:cipherx/Pages/Add.dart';

class bottom_navigator extends StatefulWidget {
  const bottom_navigator({super.key});

  @override
  State<bottom_navigator> createState() => _bottom_navigatorState();
}

class _bottom_navigatorState extends State<bottom_navigator> {
  // List<Widget> screens = [home(), Transaction(), add(), Budget(), Profile()];

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => addd(check: true)));
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("Expense"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => addd(check: false)));
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("Income"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentsrc = home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentsrc,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff7F3DFF),
        onPressed: () {
          imagePickerOption();
        },
        child: Icon(
          FontAwesome.circle_plus,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                        currentsrc = home();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color:
                              currentTab == 0 ? Color(0xff7F3DFF) : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color(0xff7F3DFF)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                        currentsrc = Transaction();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.compare_arrows_rounded,
                          color:
                              currentTab == 1 ? Color(0xff7F3DFF) : Colors.grey,
                        ),
                        Text(
                          'Transaction',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color(0xff7F3DFF)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 3;
                        currentsrc = Budget();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pie_chart,
                          color:
                              currentTab == 3 ? Color(0xff7F3DFF) : Colors.grey,
                        ),
                        Text(
                          'Budget',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color(0xff7F3DFF)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 4;
                        currentsrc = Profile();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.manage_accounts_sharp,
                          color:
                              currentTab == 4 ? Color(0xff7F3DFF) : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 4
                                ? Color(0xff7F3DFF)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
