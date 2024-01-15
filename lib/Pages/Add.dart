import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> _list1 = [
  'Shopping',
  'Subscription',
  'Travel',
  'Food',
  'Bills'
];
const List<String> _list2 = [
  'UPI',
  'Cash',
  'Card',
];

class addd extends StatefulWidget {
  bool check;
  addd({super.key, required this.check});

  @override
  State<addd> createState() => _addState();
}

class _addState extends State<addd> {
  TextEditingController money = TextEditingController();
  TextEditingController descriptionc = TextEditingController();
  String cat = "";
  String wal = "";
  addtask() async {
    await FirebaseFirestore.instance
        .collection('Money')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('data')
        .doc(DateTime.now().toString())
        .set({
      'check': widget.check,
      'amount': money.text.toString(),
      'description': descriptionc.text.toString(),
      'Category': cat,
      'Wallet': wal
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0077FF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff0077FF),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        title: Text(widget.check == true ? "Expense" : "Income"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("How much?",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white)),
                TextField(
                  controller: money,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.inter(
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "\u{20B9}0",
                    hintStyle: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )
                // Text(
                //   "\u{20B9}0",
                //   style: GoogleFonts.inter(
                //       fontSize: 64,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.white),
                // )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: CustomDropdown<String>(
                          decoration: CustomDropdownDecoration(
                              closedBorder:
                                  Border.all(color: Colors.grey, width: 0.1),
                              closedBorderRadius: BorderRadius.circular(16)),
                          hintText: 'Category',
                          items: _list1,
                          onChanged: (value) {
                            setState(() {
                              cat = value;
                            });
                            log('changing value to: $value');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        child: CustomDropdown<String>(
                          decoration: CustomDropdownDecoration(
                              closedBorder:
                                  Border.all(color: Colors.grey, width: 0.1),
                              closedBorderRadius: BorderRadius.circular(16)),
                          hintText: 'Wallet',
                          items: _list2,
                          onChanged: (value) {
                            setState(() {
                              wal = value;
                            });
                            log('changing value to: $value');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: descriptionc,
                          decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 17),
                            focusColor: Color(0xff8F57FF),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              addtask();
                              Fluttertoast.showToast(
                                  msg: "Added", backgroundColor: Colors.grey);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff7F3DFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
