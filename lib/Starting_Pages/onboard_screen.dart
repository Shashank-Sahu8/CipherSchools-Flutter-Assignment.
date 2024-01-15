import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Authentications/Signup.dart';
import '../Authentications/if_login.dart';

class onboard_screen extends StatefulWidget {
  const onboard_screen({super.key});

  @override
  State<onboard_screen> createState() => _onboard_screenState();
}

class _onboard_screenState extends State<onboard_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => islogein()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0077FF),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Image.asset('assets/recordcircle_up.png')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Image.asset('assets/recordcircle.png')],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0, left: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/icon.png',
                  height: 85.11,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 14.0, bottom: 72.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Welcome to",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 40),
                        ),
                        Text(
                          "CipherX.",
                          style: GoogleFonts.brunoAceSc(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 36),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => islogein()));
                      },
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Color(0xffEDE1E1),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          weight: 35,
                          size: 60,
                          color: Color(0xff060607),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'The best way to track your expenses.',
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
