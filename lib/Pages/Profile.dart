import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

final userRef = FirebaseFirestore.instance
    .collection('User')
    .doc(FirebaseAuth.instance.currentUser!.uid);
String cc = "No Name";
String img = "";

class _ProfileState extends State<Profile> {
  Future<void> checkuserforpermission() async {
    await userRef.get().then((DocumentSnapshot doc) {
      setState(() {
        cc = doc['name'];
        img = doc['imgurl'];
      });
    });
  }

  refresh() {
    setState(() {});
  }

  TextEditingController namecont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkuserforpermission();
    setState(() {});
  }

  String? codeDialog;
  String? valueText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffAD00FF),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 30.5,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(img),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        cc.length > 15 ? cc.substring(0, 13) + "..." : cc,
                        style: GoogleFonts.inter(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  backgroundColor: Color(0xffEEE5FF),
                                  title: const Text('TextField in Dialog'),
                                  content: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        valueText = value;
                                      });
                                    },
                                    controller: namecont,
                                    decoration: const InputDecoration(
                                        hintText: "Text Field in Dialog"),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      textColor: Colors.white,
                                      child: const Text('CANCEL'),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                    MaterialButton(
                                      color: Color(0xff7F3DFF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      textColor: Colors.white,
                                      child: const Text('Update'),
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('User')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .update({
                                          'name': namecont.text.toString()
                                        });
                                        setState(() async {
                                          codeDialog = valueText;
                                          Navigator.pop(context);
                                          await refresh();
                                          namecont.text = "";
                                        });
                                      },
                                    ),
                                  ]);
                            });
                      },
                      icon: Icon(Bootstrap.pencil))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 17.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffEEE5FF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: Color(0xff7F3DFF),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Account',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffEEE5FF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.settings,
                                color: Color(0xff7F3DFF),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Settings',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffEEE5FF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.file_upload_outlined,
                                color: Color(0xff7F3DFF),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Export Data',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17.0, bottom: 18.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffFFE2E4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.logout,
                                  color: Color(0xffFD3C4A),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Logout',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
