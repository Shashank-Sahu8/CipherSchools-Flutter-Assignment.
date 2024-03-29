import 'dart:io';
import 'dart:math';
import 'package:cipherx/Authentications/Google_signUp.dart';
import 'package:cipherx/Authentications/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:badges/badges.dart' as badges;
import '../Privacy Policy.dart';
import 'package:cipherx/image_upload.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  File? pickedImage;
  final formfield = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool isChecked = false;
  bool ob = false;
  String imageurl = '';

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
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
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

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  addfire(bool c) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'name': namecontroller.text.toString(),
      'email': emailcontroller.text.toString(),
      'imgurl': c != true
          ? FirebaseAuth.instance.currentUser!.photoURL
          : pickedImage != null
              ? await _uploadpic()
              : 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png',
    });
  }

  Future<String> _uploadpic() async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('pic')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(pickedImage!);
    TaskSnapshot snapshot = await uploadTask;
    String downurl = await snapshot.ref.getDownloadURL();
    return downurl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    imagePickerOption();
                  },
                  child: badges.Badge(
                    badgeStyle:
                        badges.BadgeStyle(badgeColor: Color(0xffAD00FF)),
                    badgeContent: Icon(
                      Icons.camera_enhance_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color(0xffAD00FF),
                      radius: 35,
                      child: CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius:
                                30.5, //https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png
                            backgroundColor: Colors
                                .grey, //pickedImage?Image.file(pickedImage!):
                            backgroundImage: pickedImage != null
                                ? Image.file(pickedImage!).image
                                : NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png'),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Form(
                    key: formfield,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: namecontroller,
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 17),
                            focusColor: Color(0xff8F57FF),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 17),
                            focusColor: Color(0xff8F57FF),
                            fillColor: Color(0xff8F57FF),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: ob == true ? true : false,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ob = !ob;
                                });
                              },
                              icon: ob == true
                                  ? Icon(
                                      FontAwesome.eye_slash,
                                      size: 23,
                                    )
                                  : Icon(
                                      FontAwesome.eye,
                                      size: 23,
                                      color: Color(0xff7F3DFF),
                                    ),
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 17),
                            focusColor: Color(0xff8F57FF),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            MSHCheckbox(
                              size: 23,
                              value: isChecked,
                              colorConfig:
                                  MSHColorConfig.fromCheckedUncheckedDisabled(
                                checkedColor: Color(0xff7F3DFF),
                              ),
                              style: MSHCheckboxStyle.stroke,
                              onChanged: (selected) {
                                setState(() {
                                  isChecked = selected;
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Privacy_Policy()));
                                  },
                                  child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                        text: "By signing up,you agree to the ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      TextSpan(
                                        text:
                                            "Terms of \n Services and Privacy Policy",
                                        style: TextStyle(
                                            color: Color(0xff7F3DFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isChecked == false) {
                                Fluttertoast.showToast(
                                  msg: "Please accept the Privacy Policy",
                                  backgroundColor: Colors.grey,
                                  textColor: Color(0xff7F3DFF),
                                );
                              } else {
                                if (formfield.currentState!.validate()) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email:
                                              emailcontroller.text.toString(),
                                          password: passwordcontroller.text
                                              .toString())
                                      .then((value) {
                                    addfire(true);
                                    Fluttertoast.showToast(
                                        msg: "Account created & Login success",
                                        backgroundColor: Colors.grey,
                                        textColor: Color(0xff7F3DFF));
                                    Navigator.pop(context);
                                  }).onError((error, stackTrace) {
                                    Fluttertoast.showToast(
                                        msg: error.toString(),
                                        backgroundColor: Colors.grey,
                                        textColor: Color(0xff7F3DFF));
                                  });
                                }
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff7F3DFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Or with",
                          style: GoogleFonts.inter(
                              color: Color(0xff91919F),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              await AuthServices().signInWithGoogle();
                              addfire(false);
                              Navigator.pop(context);
                              await FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({
                                'uid': FirebaseAuth.instance.currentUser!.uid,
                                'name': FirebaseAuth
                                    .instance.currentUser!.displayName
                                    .toString(),
                                'email':
                                    FirebaseAuth.instance.currentUser!.email
                              });
                              Fluttertoast.showToast(
                                msg: 'Login success',
                                backgroundColor: Colors.grey,
                                textColor: Color(0xff7F3DFF),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/google.png'),
                                  height: 33,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Sign Up with Google",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.inter(
                                  color: Color(0xff91919F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.inter(
                                        color: Color(0xff7F3DFF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
