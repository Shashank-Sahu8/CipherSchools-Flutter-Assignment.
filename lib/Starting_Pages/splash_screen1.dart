import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboard_screen.dart';

class splash_screen1 extends StatefulWidget {
  const splash_screen1({super.key});

  @override
  State<splash_screen1> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const onboard_screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0077FF),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon.png'),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'CipherX',
                    style: GoogleFonts.brunoAceSc(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'By',
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Open Source',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Community',
                      style: TextStyle(
                          color: Color(0xffF8A401),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
