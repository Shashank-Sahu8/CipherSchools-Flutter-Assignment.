import 'dart:async';
import 'package:flutter/material.dart';

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
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => onboard_screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/td_icon-removebg-preview.png'),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
