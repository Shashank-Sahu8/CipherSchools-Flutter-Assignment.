import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

final userRef = FirebaseFirestore.instance
    .collection('User')
    .doc(FirebaseAuth.instance.currentUser!.uid);
String cc = "No Name";
String img = "";

class _homeState extends State<home> {
  Future<void> checkuserforpermission() async {
    await userRef.get().then((DocumentSnapshot doc) {
      setState(() {
        cc = doc['name'];
        img = doc['imgurl'];
      });
    });
  }

  List<String> tabs = [
    "Today",
    "Week",
    "Month",
    "Year",
  ];
  // int current = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkuserforpermission();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 312,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Color(0xffFFF6E5),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35.0, left: 15, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffAD00FF),
                          radius: 20,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 16.5,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(img),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Bootstrap.bell_fill,
                              color: Color(0xff7F3DFF),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Account Balance",
                    style: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    '\u{20B9} 38000',
                    style: GoogleFonts.inter(
                        color: Color(0xff161719),
                        fontWeight: FontWeight.w600,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 80,
                        width: 165,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff00A86B)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.arrow_circle_down_rounded,
                                color: Color(0xff00A86B),
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '\u{20b9} 50000',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 165,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffFD3C4A)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.arrow_circle_up_rounded,
                                color: Color(0xffFD3C4A),
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expenses',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '\u{20b9} 50000',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
              child: Container(
                  child: DefaultTabController(
                      length: 4,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 56,
                              child: TabBar(
                                tabs: [
                                  Text('Today',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xffFCAC12))),
                                  Text('Week',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xffFCAC12))),
                                  Text('Month',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xffFCAC12))),
                                  Text('Year',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xffFCAC12))),
                                ],
                                indicator: ContainerTabIndicator(
                                  width: 90,
                                  color: Color(0xffFCEED4),
                                  height: 34,
                                  radius: BorderRadius.only(
                                    topRight: Radius.circular(18.0),
                                    bottomLeft: Radius.circular(18.0),
                                    topLeft: Radius.circular(18.0),
                                    bottomRight: Radius.circular(18.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 310,
                              child: TabBarView(children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Recent Transaction',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0.7,
                                                  backgroundColor:
                                                      Color(0xffEEE5FF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40))),
                                              child: Text(
                                                'See All',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xff7F3DFF)),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Transactions',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0.7,
                                                  backgroundColor:
                                                      Color(0xffEEE5FF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40))),
                                              child: Text(
                                                'See All',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xff7F3DFF)),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Transactions',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0.7,
                                                  backgroundColor:
                                                      Color(0xffEEE5FF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40))),
                                              child: Text(
                                                'See All',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xff7F3DFF)),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Transactions',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0.7,
                                                  backgroundColor:
                                                      Color(0xffEEE5FF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40))),
                                              child: Text(
                                                'See All',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xff7F3DFF)),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            )
                          ]))),
            )
          ],
        ),
      ),
    );
  }
}
